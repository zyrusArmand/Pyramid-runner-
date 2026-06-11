-- ============================================================================
--  Pyramid Stacker · Analytics + Cloud Save  — one-time Supabase setup
--  Run this in Supabase → SQL Editor.  Change the OWNER PASSWORD below first.
-- ============================================================================

-- ---------- 1) ANALYTICS EVENTS ---------------------------------------------
-- Players can INSERT events but can NEVER read them (no SELECT policy).
-- Only you can read aggregates, via the password-checked analytics() function.
create table if not exists public.events (
  id         bigint generated always as identity primary key,
  player     text,                         -- anonymous per-player id
  type       text not null,                -- install / open / play / win / death / level_complete / ad / purchase / iap / placements
  level      integer,
  value      numeric,                      -- score / coins spent / iap price, depending on type
  meta       jsonb,                        -- extra fields (reason, item, tally, …)
  app_v      text,
  created_at timestamptz default now()
);
create index if not exists events_type_time on public.events (type, created_at);
create index if not exists events_player on public.events (player);

alter table public.events enable row level security;
grant insert on table public.events to anon, authenticated;
drop policy if exists "events insert" on public.events;
create policy "events insert" on public.events for insert with check (true);
-- (no SELECT / UPDATE / DELETE policy → the public can only add events, never read them)

-- ---------- 2) CLOUD SAVES ---------------------------------------------------
-- One row per sync code. Access is ONLY through the PIN-checked functions below,
-- so no one can read or overwrite a save without the code + PIN.
create table if not exists public.saves (
  code       text primary key,
  pin        text not null,
  data       jsonb not null,
  updated_at timestamptz default now()
);
alter table public.saves enable row level security;
-- no policies → table is locked to the public; the SECURITY DEFINER functions below do the work.

create or replace function public.cloud_save(p_code text, p_pin text, p_data jsonb)
returns text language plpgsql security definer set search_path = public as $$
declare existing text;
begin
  select pin into existing from public.saves where code = p_code;
  if existing is null then
    insert into public.saves(code, pin, data) values (p_code, p_pin, p_data);
    return 'created';
  elsif existing = p_pin then
    update public.saves set data = p_data, updated_at = now() where code = p_code;
    return 'updated';
  else
    return 'badpin';
  end if;
end; $$;

create or replace function public.cloud_load(p_code text, p_pin text)
returns jsonb language plpgsql security definer set search_path = public as $$
declare d jsonb; existing text;
begin
  select pin, data into existing, d from public.saves where code = p_code;
  if existing is null then return jsonb_build_object('error','notfound'); end if;
  if existing <> p_pin then return jsonb_build_object('error','badpin'); end if;
  return jsonb_build_object('data', d);
end; $$;

grant execute on function public.cloud_save(text,text,jsonb) to anon, authenticated;
grant execute on function public.cloud_load(text,text)       to anon, authenticated;

-- ---------- 3) OWNER ANALYTICS DASHBOARD ------------------------------------
--  >>> CHANGE THIS PASSWORD <<<  — it's what you type when opening the dashboard.
create or replace function public.analytics(p_pass text)
returns jsonb language plpgsql security definer set search_path = public as $$
declare res jsonb;
begin
  if p_pass is null or p_pass <> 'CHANGE_ME_OWNER_PASSWORD' then
    return jsonb_build_object('error','denied');
  end if;
  select jsonb_build_object(
    'installs',       (select count(*) from events where type='install'),
    'players',        (select count(distinct player) from events),
    'sessions',       (select count(*) from events where type='open'),
    'dau',            (select count(distinct player) from events where type='open' and created_at > now()-interval '1 day'),
    'wau',            (select count(distinct player) from events where type='open' and created_at > now()-interval '7 day'),
    'mau',            (select count(distinct player) from events where type='open' and created_at > now()-interval '30 day'),
    'returning',      (select count(*) from (select player from events where type='open'
                         group by player having count(distinct date_trunc('day',created_at)) >= 2) q),
    'plays',          (select count(*) from events where type='play'),
    'levels_cleared', (select count(*) from events where type='level_complete'),
    'wins',           (select count(*) from events where type='win'),
    'deaths',         (select count(*) from events where type='death'),
    'avg_level',      (select round(avg(level)::numeric,1) from events where type in ('death','win') and level is not null),
    'ads',            (select count(*) from events where type='ad'),
    'purchases',      (select count(*) from events where type in ('purchase','iap')),
    'coins_spent',    (select coalesce(sum(value),0) from events where type='purchase'),
    'iap_revenue',    (select coalesce(round(sum(value)::numeric,2),0) from events where type='iap'),
    'placements', jsonb_build_object(
        'perfect', (select coalesce(sum((meta->>'PERFECT')::int),0) from events where type='placements'),
        'great',   (select coalesce(sum((meta->>'GREAT')::int),0)   from events where type='placements'),
        'good',    (select coalesce(sum((meta->>'GOOD')::int),0)    from events where type='placements'),
        'miss',    (select coalesce(sum((meta->>'MISS')::int),0)    from events where type='placements')),
    'deaths_by_reason', (select coalesce(jsonb_object_agg(reason, c),'{}'::jsonb) from (
        select coalesce(nullif(meta->>'reason',''),'unknown') as reason, count(*) c
        from events where type='death' group by 1 order by c desc limit 8) r)
  ) into res;
  return res;
end; $$;

grant execute on function public.analytics(text) to anon, authenticated;
-- ============================================================================
