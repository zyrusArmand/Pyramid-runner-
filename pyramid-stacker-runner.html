<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
<title>Pyramid Stacker · Runner</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@500;700&family=Space+Mono:wght@400;700&display=swap');
  * { margin:0; padding:0; box-sizing:border-box; -webkit-tap-highlight-color:transparent; }
  html,body { width:100%; height:100%; overflow:hidden; background:#1a1320; touch-action:none; }
  #app { position:fixed; inset:0; }
  canvas { display:block; }

  #hud { position:fixed; top:0; left:0; right:0; padding-top:max(16px,env(safe-area-inset-top));
    padding-left:18px; padding-right:18px; display:flex; justify-content:space-between;
    align-items:flex-start; pointer-events:none; font-family:'Space Mono',monospace;
    color:#f6e9d2; text-shadow:0 2px 6px rgba(0,0,0,.55); z-index:5; }
  .stat { font-size:12px; letter-spacing:2px; opacity:.8; }
  .val  { font-size:26px; font-weight:700; line-height:1; margin-top:2px; }
  #lives { display:flex; gap:7px; margin-top:6px; justify-content:flex-end; }
  .life { width:12px; height:12px; border-radius:2px; background:#e8b85f; transform:rotate(45deg);
    box-shadow:0 0 8px rgba(232,184,95,.7); transition:all .3s; }
  .life.gone { background:#3a2e2a; box-shadow:none; opacity:.5; }
  .right { text-align:right; }

  #meterWrap { position:fixed; left:50%; transform:translateX(-50%);
    bottom:max(26px,env(safe-area-inset-bottom)); width:min(320px,70vw); z-index:5;
    pointer-events:none; font-family:'Space Mono',monospace; transition:opacity .3s; }
  #meterLabel { font-size:10px; letter-spacing:3px; color:#f6e9d2; opacity:.7; text-align:center;
    margin-bottom:5px; text-shadow:0 1px 4px #000; }
  #meterBar { height:8px; border-radius:6px; background:rgba(255,255,255,.12); overflow:hidden;
    box-shadow:inset 0 0 0 1px rgba(255,255,255,.1); }
  #meterFill { height:100%; width:100%; border-radius:6px;
    background:linear-gradient(90deg,#6fe3a0,#e8d35f); transition:width .25s,background .25s; }

  #pop { position:fixed; top:38%; left:50%; transform:translate(-50%,-50%) scale(.6);
    font-family:'Cinzel',serif; font-weight:700; font-size:34px; color:#ffe9a8;
    text-shadow:0 0 18px rgba(255,210,120,.9); opacity:0; pointer-events:none; z-index:6; }
  #pop.show { animation:popfx .6s ease-out; }
  @keyframes popfx { 0%{opacity:0;transform:translate(-50%,-50%) scale(.5);}
    30%{opacity:1;transform:translate(-50%,-60%) scale(1.1);}
    100%{opacity:0;transform:translate(-50%,-90%) scale(1);} }

  .overlay { position:fixed; inset:0; z-index:10; display:flex; flex-direction:column;
    align-items:center; justify-content:center; text-align:center;
    background:radial-gradient(ellipse at 50% 40%,rgba(40,26,52,.55),rgba(12,8,16,.92));
    color:#f6e9d2; font-family:'Space Mono',monospace; padding:24px; backdrop-filter:blur(2px);
    transition:opacity .4s; }
  .hidden { opacity:0; pointer-events:none; }
  .title { font-family:'Cinzel',serif; font-weight:700; font-size:clamp(30px,10vw,56px);
    letter-spacing:3px; line-height:1.05; color:#f3d99a; text-shadow:0 0 28px rgba(243,200,120,.45); }
  .sub { margin-top:14px; font-size:13px; letter-spacing:2px; opacity:.75; max-width:330px; line-height:1.5; }
  .cta { margin-top:30px; font-size:14px; letter-spacing:4px; padding:15px 34px;
    border:1.5px solid rgba(243,200,120,.6); border-radius:40px; color:#f3d99a;
    animation:pulse 1.8s ease-in-out infinite; }
  @keyframes pulse { 0%,100%{box-shadow:0 0 0 0 rgba(243,200,120,.35);}
    50%{box-shadow:0 0 0 14px rgba(243,200,120,0);} }
  .bigscore { font-family:'Cinzel',serif; font-size:54px; font-weight:700; color:#f3d99a;
    margin:6px 0; text-shadow:0 0 20px rgba(243,200,120,.4); }
  .gostat { font-size:13px; letter-spacing:2px; opacity:.8; }
</style>
</head>
<body>
<div id="app"></div>

<div id="hud">
  <div><div class="stat" id="lblA">SCORE</div><div class="val" id="score">0</div></div>
  <div class="right"><div class="stat" id="lblB">LAYER</div><div class="val" id="layer">1</div>
    <div id="lives"><span class="life"></span><span class="life"></span><span class="life"></span></div></div>
</div>

<div id="meterWrap"><div id="meterLabel">LAYER STABILITY</div>
  <div id="meterBar"><div id="meterFill"></div></div></div>

<div id="pop">PERFECT</div>

<div class="overlay" id="startScreen">
  <div class="title">PYRAMID<br>STACKER</div>
  <div class="sub">PHASE 1 — Tap to drop each block; each layer rests halfway on the one below, like real pyramid stone. The first layer is forgiving, but higher up a sloppy drop weakens the structure — and a drop way off its support topples off and leaves a gap. Lose too much integrity and it all comes down.<br><br>PHASE 2 — Then run the spiral up what you built, jumping any gaps and cracks, to the capstone.</div>
  <div class="cta">TAP TO BUILD</div>
</div>

<div class="overlay hidden" id="overScreen">
  <div class="title" id="overTitle" style="font-size:clamp(26px,8vw,44px)">IT CRUMBLED</div>
  <div class="bigscore" id="finalScore">0</div>
  <div class="gostat" id="finalStat"></div>
  <div class="cta">TAP TO PLAY AGAIN</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
<script>
// ============================================================
//  PYRAMID STACKER + RUNNER
//  Phase 1: narrowing-pyramid stacker (ported from the Unity
//           PyramidManager: 4 walls/layer, camera turns per wall
//           & rises per layer, instability collapse, 3-miss fail).
//           Each layer insets one block, ending in a capstone.
//  Phase 2: on-rails spiral runner UP the exact pyramid you built.
//           Missed blocks = gaps. Tap to jump. Reach the capstone.
// ============================================================

const BASE_BLOCKS_PER_WALL  = 4;     // base ring; insets HALF a block per layer to a capstone
const BLOCK_SIZE            = 1;
const LAYER_HEIGHT          = 0.55;  // flatter courses → clean, climbable pyramid steps
const MISS_DISTANCE         = 0.85;
const PERFECT_DISTANCE      = 0.14;
const MAX_PIECE_LEN         = 2;     // pieces span 1–2 cells (longer rectangles)
const CORNER_CHANCE         = 0.6;   // chance the first piece of a wall is a cornerstone
const FALL_THRESHOLD        = 0.55;  // above layer 1, a drop this far off its support topples off

const app = document.getElementById('app');

const scene = new THREE.Scene();
scene.fog = new THREE.Fog(0x2a1d33, 16, 46);

const renderer = new THREE.WebGLRenderer({ antialias:true });
renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
renderer.setSize(innerWidth, innerHeight);
renderer.shadowMap.enabled = true;
renderer.shadowMap.type = THREE.PCFSoftShadowMap;
app.appendChild(renderer.domElement);

const skyGeo = new THREE.SphereGeometry(70, 32, 16);
const skyMat = new THREE.ShaderMaterial({ side:THREE.BackSide,
  uniforms:{ top:{value:new THREE.Color(0x241a36)}, bot:{value:new THREE.Color(0xc9714e)} },
  vertexShader:`varying vec3 p; void main(){p=position; gl_Position=projectionMatrix*modelViewMatrix*vec4(position,1.0);}`,
  fragmentShader:`varying vec3 p; uniform vec3 top; uniform vec3 bot;
    void main(){float h=clamp((p.y+45.0)/90.0,0.0,1.0); gl_FragColor=vec4(mix(bot,top,h),1.0);}` });
const sky = new THREE.Mesh(skyGeo, skyMat); scene.add(sky);

const camera = new THREE.PerspectiveCamera(60, innerWidth/innerHeight, 0.1, 120);

scene.add(new THREE.HemisphereLight(0xffd9a8, 0x33203a, 0.7));
const sun = new THREE.DirectionalLight(0xfff0d0, 1.15);
sun.position.set(7,16,9); sun.castShadow = true;
sun.shadow.mapSize.set(1024,1024);
sun.shadow.camera.near=1; sun.shadow.camera.far=60;
sun.shadow.camera.left=-16; sun.shadow.camera.right=16; sun.shadow.camera.top=16; sun.shadow.camera.bottom=-16;
scene.add(sun);

const ground = new THREE.Mesh(new THREE.CircleGeometry(50,48),
  new THREE.MeshStandardMaterial({ color:0x6b4a32, roughness:1 }));
ground.rotation.x = -Math.PI/2; ground.position.y = -0.5; ground.receiveShadow = true;
scene.add(ground);

// ---------- helpers ----------
const $ = id => document.getElementById(id);
function rand3(s){ return new THREE.Vector3((Math.random()-0.5)*s,(Math.random()-0.5)*s,(Math.random()-0.5)*s); }
function nForLayer(L){ return BASE_BLOCKS_PER_WALL - L; }   // blocks per wall at layer L (half-block inset)
function layerColor(L){ const hue=(30+L*26)%360; return new THREE.Color(`hsl(${hue},48%,62%)`); }

function gridPos(wall, index, n, layer){
  const H = (n*BLOCK_SIZE)/2, along = index*BLOCK_SIZE;
  const p = new THREE.Vector3(0, layer*LAYER_HEIGHT, 0);
  if      (wall===0){ p.z= H; p.x=-H+along; }
  else if (wall===1){ p.x= H; p.z= H-along; }
  else if (wall===2){ p.z=-H; p.x= H-along; }
  else              { p.x=-H; p.z=-H+along; }
  return p;
}

function makeBlock(color){
  const m = new THREE.Mesh(
    new THREE.BoxGeometry(BLOCK_SIZE*0.96, LAYER_HEIGHT*0.94, BLOCK_SIZE*0.96),
    new THREE.MeshStandardMaterial({ color, roughness:0.85, metalness:0.05 }));
  m.castShadow = true; m.receiveShadow = true; scene.add(m); return m;
}

// A piece spanning `len` cells along `axis` ('x' or 'z'), or an L-ish cornerstone.
function makePiece(len, axis, color, corner){
  const mat = new THREE.MeshStandardMaterial({ color, roughness:0.85, metalness:0.05 });
  const along = len*BLOCK_SIZE*0.96, depth = BLOCK_SIZE*0.96, h = LAYER_HEIGHT*0.94;
  if (corner){
    // a clean wrapped corner: full-size cube in the same stone colour, no seam, no highlight
    const m = new THREE.Mesh(new THREE.BoxGeometry(BLOCK_SIZE, h, BLOCK_SIZE), mat);
    m.castShadow = m.receiveShadow = true; scene.add(m); return m;
  }
  const dims = axis==='x' ? [along, h, depth] : [depth, h, along];
  const m = new THREE.Mesh(new THREE.BoxGeometry(dims[0], dims[1], dims[2]), mat);
  m.castShadow = true; m.receiveShadow = true; scene.add(m); return m;
}

// Terrace a block's exposed outer face into a few receding stone courses (Giza-style detail).
function addCourses(mesh, center, axis, len){
  const radial = axis==='x' ? 'z' : 'x';            // outward direction = perpendicular to the wall
  if (Math.abs(center[radial]) < 0.01) return;       // skip ambiguous/central pieces
  const sgn = center[radial] >= 0 ? 1 : -1;
  const h = LAYER_HEIGHT*0.94, along = len*BLOCK_SIZE*0.9, faceR = BLOCK_SIZE*0.96/2, N = 3;
  const shade = mesh.material.color.clone();
  for (let i=0; i<N-1; i++){                          // lower courses jut out; top course stays flush
    const out = (N-1-i)*0.06, ch = h/N, cy = -h/2 + ch*(i+0.5), ledgeD = 0.14 + out;
    const w = axis==='x' ? along : ledgeD, d = axis==='x' ? ledgeD : along;
    const ledge = new THREE.Mesh(new THREE.BoxGeometry(w, ch*0.9, d),
      new THREE.MeshStandardMaterial({ color:shade, roughness:0.9, metalness:0.04 }));
    const rPos = sgn*(faceR + out - ledgeD/2);
    ledge.position.set(axis==='x' ? 0 : rPos, cy, axis==='x' ? rPos : 0);
    ledge.castShadow = true; mesh.add(ledge);
  }
}

// ---------- sound (procedural Web Audio — no assets) ----------
const Sound = {
  ctx:null, on:true,
  init(){ if (this.ctx) return; try { this.ctx = new (window.AudioContext||window.webkitAudioContext)(); } catch(e){ this.on=false; } },
  blip(freq, dur, type='sine', gain=0.18, slideTo){
    if (!this.on || !this.ctx) return;
    const t = this.ctx.currentTime;
    const o = this.ctx.createOscillator(), g = this.ctx.createGain();
    o.type = type; o.frequency.setValueAtTime(freq, t);
    if (slideTo) o.frequency.exponentialRampToValueAtTime(slideTo, t+dur);
    g.gain.setValueAtTime(0.0001, t);
    g.gain.exponentialRampToValueAtTime(gain, t+0.012);
    g.gain.exponentialRampToValueAtTime(0.0001, t+dur);
    o.connect(g).connect(this.ctx.destination); o.start(t); o.stop(t+dur+0.02);
  },
  place(){ this.blip(420, 0.09, 'triangle', 0.14); },
  perfect(n){ const base=660; [0,4,7,12].slice(0, Math.min(2+n,4)).forEach((s,i)=> setTimeout(()=>this.blip(base*Math.pow(2,s/12),0.16,'sine',0.16),i*55)); },
  drop(){ this.blip(180, 0.32, 'sawtooth', 0.2, 60); },
  jump(){ this.blip(520, 0.14, 'square', 0.1, 880); },
  land(){ this.blip(300, 0.08, 'triangle', 0.12, 180); },
  step(){ this.blip(240, 0.05, 'sine', 0.05); },
  cap(){ [0,7,12,16,19].forEach((s,i)=> setTimeout(()=>this.blip(523*Math.pow(2,s/12),0.5,'triangle',0.16),i*90)); },
  win(){ [0,5,7,12,17,19,24].forEach((s,i)=> setTimeout(()=>this.blip(523*Math.pow(2,s/12),0.4,'sine',0.16),i*110)); }
};

// ---------- particles / fx ----------
function spawnDust(pos, color=0xe8d8c0, count=8, spread=1.6, up=2){
  for (let i=0;i<count;i++){
    const p = new THREE.Mesh(new THREE.SphereGeometry(0.07+Math.random()*0.06, 6, 6),
      new THREE.MeshBasicMaterial({ color, transparent:true, opacity:0.9 }));
    p.position.copy(pos);
    scene.add(p);
    S.fx.push({ mesh:p, vel:new THREE.Vector3((Math.random()-0.5)*spread, Math.random()*up, (Math.random()-0.5)*spread), life:1, decay:1.4+Math.random() });
  }
}
function sparkle(pos){ spawnDust(pos, 0xffe08a, 14, 2.2, 3); }
function shake(amt){ S.shakeAmt = Math.max(S.shakeAmt||0, amt); }

// ---------- state ----------
let S = {};
function resetState(){
  S = { phase:'build', gameOver:false, won:false,
    wall:0, cellIndex:0, layer:0, capstone:false,
    camRot:0, camHeight:0, camR:BASE_BLOCKS_PER_WALL + 5,
    fallen:0, score:0, streak:0, integrity:1, allBlocks:[],
    layerBlocks:[], active:null, falling:[],
    fx:[], squash:[], shakeAmt:0, shadow:null,
    pathSlots:[],          // ordered per-cell {pos, placed} for the runner
    run:null, runner:null };
}

// ---------- BUILD PHASE ----------
function spawnBlock(){
  const capstone = S.capstone;
  let center, axis, len = 1, cells = [], corner = false;

  if (capstone){
    center = new THREE.Vector3(0, S.layer*LAYER_HEIGHT, 0);
    axis = Math.random()<0.5 ? 'x' : 'z';
    cells = [0];
  } else {
    const n = nForLayer(S.layer);
    axis = (S.wall===0 || S.wall===2) ? 'x' : 'z';
    const remaining = n - S.cellIndex;
    corner = (S.cellIndex === 0) && (Math.random() < CORNER_CHANCE);
    len = corner ? 1 : Math.min(1 + Math.floor(Math.random()*MAX_PIECE_LEN), remaining);
    // cells this piece occupies, and the geometric center across them
    const a = gridPos(S.wall, S.cellIndex, n, S.layer);
    const b = gridPos(S.wall, S.cellIndex + len - 1, n, S.layer);
    center = a.clone().add(b).multiplyScalar(0.5);
    for (let c = S.cellIndex; c < S.cellIndex + len; c++) cells.push(c);
  }

  const speed = 1.8 + S.layer*0.18 + Math.random()*0.15;
  const color = capstone ? 0xf4cf6a : layerColor(S.layer);

  let mesh;
  if (capstone){ mesh = makeBlock(color); mesh.scale.set(0.8,0.8,0.8); mesh.material.emissive = new THREE.Color(0x5a3d00); }
  else { mesh = makePiece(len, axis, color, corner); }

  if (corner && !capstone && Math.random() < 0.55){
    // L-shaped cornerstone: same stone, wraps a cell down each adjoining wall
    const runDir  = [[1,0,0],[0,0,-1],[-1,0,0],[0,0,1]][S.wall];
    const prevDir = [[0,0,-1],[-1,0,0],[0,0,1],[1,0,0]][S.wall];
    const hh = LAYER_HEIGHT*0.94, L = BLOCK_SIZE*0.92, W = BLOCK_SIZE*0.96, OFF = BLOCK_SIZE*0.5;
    const arm = (d) => {
      const dims = d[0]!==0 ? [L, hh, W] : [W, hh, L];
      const a = new THREE.Mesh(new THREE.BoxGeometry(dims[0], dims[1], dims[2]),
        new THREE.MeshStandardMaterial({ color: mesh.material.color.clone(), roughness:0.85, metalness:0.05 }));
      a.position.set(d[0]*OFF, 0, d[2]*OFF); a.castShadow = a.receiveShadow = true; mesh.add(a);
    };
    arm(runDir); arm(prevDir);
  }

  mesh.position.copy(center);

  if (capstone){
    // alone on its layer — gentle symmetric swing
    const amp = 1.3;
    mesh.position[axis] = center[axis] + amp;
    S.active = { mesh, center, axis, speed, phase:Math.PI/2, mode:'sym', amp,
                 capstone:true, len, cells, corner, n:1 };
  } else {
    const n = nForLayer(S.layer);
    const odir = (S.wall===0 || S.wall===3) ? 1 : -1;     // toward unfilled cells
    const openBeyond = n - S.cellIndex - len;             // empty cells past this piece
    if (S.wall===3 && openBeyond <= 0){
      // FINISHER — the single block that completes the whole layer: lift one step up and sweep
      const u0 = gridPos(S.wall, 0,   n, S.layer)[axis];
      const u1 = gridPos(S.wall, n-1, n, S.layer)[axis];
      const M = 1.2;                                       // overshoot into air past each end
      const lo = Math.min(u0,u1) - M, hi = Math.max(u0,u1) + M;
      const liftY = center.y + LAYER_HEIGHT;               // exactly one step above the layer
      mesh.position.y = liftY;
      mesh.position[axis] = lo;
      S.active = { mesh, center, axis, mode:'finisher', lo, hi, u:lo,
                   vel: 3.2 + S.layer*0.45, liftY,
                   capstone:false, len, cells, corner, n };
    } else {
      let range;
      if (S.wall === 3){
        // closing wall: enclosed between existing blocks — swing only within the open gap, no overshoot
        range = Math.max(0.9, openBeyond * BLOCK_SIZE);
      } else {
        range = Math.min(3.2, Math.max(1.6, openBeyond*BLOCK_SIZE + 1.4));  // open air past the end
      }
      mesh.position[axis] = center[axis] + odir*range;
      S.active = { mesh, center, axis, speed, phase:Math.PI/2, mode:'open', odir, range,
                   capstone:false, len, cells, corner, n };
    }
  }
}

function drop(){
  if (S.phase!=='build' || S.gameOver || !S.active) return;
  const a = S.active;
  const cur = (a.mode==='finisher') ? a.u : a.mesh.position[a.axis];
  const off = cur - a.center[a.axis];                 // how far from dead-centre, signed
  const dist = Math.abs(off);
  S.active = null;

  const offN = Math.min(1, dist / 1.3);               // 0 = dead-on, 1 = way off
  const dmg = offN * S.layer * 0.05;                  // first layer free; higher layers weaken
  S.integrity = Math.max(0, S.integrity - dmg);

  // lock it EXACTLY where it was tapped — no snapping, no sinking, no wobble
  a.mesh.position.copy(a.center);
  a.mesh.position[a.axis] = cur;

  if (dmg > 0.02) Sound.drop();

  S.allBlocks.push(a.mesh);
  pushCells(a, true, offN > 0.45, off);   // run path follows where the block actually landed
  updateHUD();

  if (S.integrity <= 0){ collapseAll(); endGame(false, 'collapsed'); return; }
  blockPlaced(a.mesh, offN, a.capstone, a.len);
}

function collapseAll(){
  S.allBlocks.forEach(b => { if (b) S.falling.push({
    mesh:b, vel:new THREE.Vector3((Math.random()-0.5)*5, Math.random()*2, (Math.random()-0.5)*5), rot:rand3(6) }); });
  S.allBlocks = [];
  Sound.drop();
}

// record one runner path-slot per cell the piece covers
function pushCells(a, placed, weak, off=0){
  const n = a.n;
  if (a.capstone){ S.pathSlots.push({ pos:a.center.clone(), placed, weak:false, mesh:a.mesh }); return; }
  a.cells.forEach(c => {
    const p = gridPos(S.wall, c, n, S.layer).clone();
    p[a.axis] += off;                       // follow where the block was actually tapped
    S.pathSlots.push({ pos: p, placed, weak:!!weak, mesh:a.mesh });
  });
}

function blockPlaced(mesh, instability, capstone, len){
  S.layerBlocks.push(mesh);
  if (instability < PERFECT_DISTANCE){
    S.streak++; S.score += (100 + S.streak*25) * len;
    showPop(S.streak>2?`PERFECT x${S.streak}`:'PERFECT');
    Sound.perfect(S.streak); sparkle(mesh.position.clone().add(new THREE.Vector3(0,0.5,0)));
  } else { S.streak = 0; S.score += 40 * len; Sound.place(); }
  updateHUD();

  if (capstone){ startRun(); return; }     // pyramid complete!
  advance(len);
}

function advance(len){
  const n = nForLayer(S.layer);
  S.cellIndex += len;
  if (S.cellIndex >= n){
    S.cellIndex = 0; S.wall++; S.camRot += Math.PI/2;
    if (S.wall > 3){
      S.wall = 0; S.layer++; S.camHeight += LAYER_HEIGHT; S.layerBlocks = [];
      if (nForLayer(S.layer) <= 0){ S.capstone = true; }   // time for the capstone
    }
  }
  spawnBlock();
}

function collapseLayer(blocks){
  blocks.forEach(b => S.falling.push({ mesh:b, vel:new THREE.Vector3((Math.random()-0.5)*4,1,(Math.random()-0.5)*4), rot:rand3(6) }));
  if (S.active){ S.falling.push({ mesh:S.active.mesh, vel:rand3(4), rot:rand3(6) }); S.active=null; }
}

// ---------- RUN PHASE ----------
function startRun(){
  S.phase = 'run';
  Sound.cap();
  // build tile path straight from what was placed, in build order (already spiral order)
  const tiles = S.pathSlots.map(s => ({
    pos: new THREE.Vector3(s.pos.x, s.pos.y + LAYER_HEIGHT*0.5, s.pos.z),   // top surface
    gap: !s.placed, weak: !!s.weak, mesh: s.mesh, crumbled:false
  }));
  // cracked (weak) tiles: tint the block red and float a warning ring above it
  tiles.forEach(t => {
    if (!t.weak) return;
    if (t.mesh && t.mesh.material && !t.mesh.__weakTinted){ t.mesh.material.color.offsetHSL(-0.06, 0.3, -0.05); t.mesh.__weakTinted = true; }
    const mk = new THREE.Mesh(new THREE.RingGeometry(0.16, 0.4, 20),
      new THREE.MeshBasicMaterial({ color:0xff5a4a, transparent:true, opacity:0.85, side:THREE.DoubleSide }));
    mk.rotation.x = -Math.PI/2; mk.position.set(t.pos.x, t.pos.y+0.05, t.pos.z);
    scene.add(mk); t.marker = mk;
  });
  // procedural obstacles: beams to SLIDE under, side pillars to DODGE
  let lastOb = 2;
  for (let i = 5; i < tiles.length - 2; i++){
    const t = tiles[i];
    if (t.gap || t.weak || i - lastOb < 4) continue;
    if (Math.random() > 0.18) continue;
    const A = tiles[i].pos, B = tiles[Math.min(i+1, tiles.length-1)].pos;
    let fwd = B.clone().sub(A); fwd.y = 0; if (fwd.lengthSq()<1e-4) fwd.set(0,0,1); else fwd.normalize();
    const perp = new THREE.Vector3(-fwd.z, 0, fwd.x);
    if (Math.random() < 0.5){
      t.ob = { type:'beam' };
      const beam = new THREE.Mesh(new THREE.BoxGeometry(1.3, 0.16, 0.16),
        new THREE.MeshStandardMaterial({ color:0xffa23a, emissive:0x4a2600, roughness:0.5 }));
      beam.rotation.y = Math.atan2(-perp.z, perp.x);
      beam.position.set(t.pos.x, t.pos.y + 0.6, t.pos.z);
      beam.castShadow = true; scene.add(beam); t.obMesh = beam;
    } else {
      const hl = Math.random()<0.5 ? -1 : 1;
      t.ob = { type:'lane', lane:hl };
      const pil = new THREE.Mesh(new THREE.BoxGeometry(0.3, 0.62, 0.3),
        new THREE.MeshStandardMaterial({ color:0xd23a3a, emissive:0x3a0a0a, roughness:0.6 }));
      pil.position.set(t.pos.x + perp.x*hl*0.32, t.pos.y + 0.31, t.pos.z + perp.z*hl*0.32);
      pil.castShadow = true; scene.add(pil); t.obMesh = pil;
    }
    lastOb = i;
  }
  // little runner figure — small and nimble
  const g = new THREE.Group();
  const body = new THREE.Mesh(new THREE.BoxGeometry(0.2,0.3,0.2),
    new THREE.MeshStandardMaterial({ color:0x3ad6c5, emissive:0x0a3d38, roughness:0.4 }));
  body.position.y = 0.15; body.castShadow = true;
  const head = new THREE.Mesh(new THREE.SphereGeometry(0.12,16,16),
    new THREE.MeshStandardMaterial({ color:0xfff0d0, emissive:0x332600 }));
  head.position.y = 0.4; head.castShadow = true;
  g.add(body); g.add(head); scene.add(g);
  S.runner = g;
  // soft shadow blob under the runner
  const sh = new THREE.Mesh(new THREE.CircleGeometry(0.2, 20),
    new THREE.MeshBasicMaterial({ color:0x000000, transparent:true, opacity:0.32 }));
  sh.rotation.x = -Math.PI/2; scene.add(sh); S.shadow = sh;

  S.run = { tiles, idx:0, t:0, speed:2.9, jumping:false, jumpT:0, jumpDur:0.8, jumpH:1.6,
            falling:false, fallV:0, yOff:0, startDelay:1.4,
            lane:0, laneX:0, sliding:false, slideT:0, slideDur:0.55 };
  g.position.copy(tiles[0].pos);

  // HUD swap
  $('lblA').textContent = 'HEIGHT'; $('lblB').textContent = 'CLIMB';
  $('lives').style.display = 'none';
  $('meterLabel').textContent = 'SWIPE: ← → MOVE · ↑ JUMP · ↓ SLIDE';
  $('meterBar').style.display = 'none';
  showPop('PYRAMID COMPLETE');
  const cracks = tiles.some(t => t.weak);
  setTimeout(()=>{ if (S.phase==='run' && !S.gameOver) showPop(cracks ? 'JUMP THE CRACKS!' : 'CLIMB!'); }, 900);
}

function runJump(){
  const r = S.run; if (!r || r.falling || r.startDelay>0) return;
  if (!r.jumping && !r.sliding){ r.jumping = true; r.jumpT = 0; Sound.jump(); }
}
function runSlide(){
  const r = S.run; if (!r || r.falling || r.startDelay>0) return;
  if (!r.jumping && !r.sliding){ r.sliding = true; r.slideT = 0; Sound.land(); }
}
function runMove(dir){   // -1 = left, +1 = right (relative to run direction)
  const r = S.run; if (!r || r.falling || r.startDelay>0) return;
  r.lane = Math.max(-1, Math.min(1, r.lane + dir));
  Sound.step();
}

function updateRun(dt){
  const r = S.run, g = S.runner; if (!r) return;

  if (r.falling){
    r.fallV -= 12*dt; g.position.y += r.fallV*dt; g.rotation.z += dt*4;
    if (S.shadow) S.shadow.material.opacity *= 0.9;
    if (g.position.y < -6) endGame(false, r.crashReason || 'fell');
    followCam(dt, true); return;
  }

  // hold for the "PYRAMID COMPLETE / CLIMB" beat before moving
  if (r.startDelay > 0){
    r.startDelay -= dt;
    placeShadow(g, r);
    followCam(dt, false);
    return;
  }

  // advance along the path
  r.t += r.speed * dt / 1;
  while (r.t >= 1){
    r.t -= 1; r.idx++;
    if (r.idx >= r.tiles.length-1){ Sound.win(); endGame(true); return; }
    Sound.step();
    if (tileUnsafe(r.tiles[r.idx]) && !r.jumping){ crumbleTile(r.tiles[r.idx]); startFall(); return; }
    const ob = r.tiles[r.idx].ob;
    if (ob){
      if (ob.type==='beam' && !r.sliding){ runCrash(); return; }       // must slide under
      if (ob.type==='lane' && r.lane===ob.lane){ runCrash(); return; }  // must dodge to another lane
    }
  }
  const A = r.tiles[r.idx].pos, B = r.tiles[Math.min(r.idx+1,r.tiles.length-1)].pos;
  const base = A.clone().lerp(B, r.t);

  // jump arc
  let sx = 1, sy = 1;
  if (r.jumping){
    r.jumpT += dt;
    const k = Math.min(r.jumpT/r.jumpDur,1);
    r.yOff = Math.sin(k*Math.PI) * r.jumpH;
    sy = 1 + 0.25*Math.sin(k*Math.PI); sx = 1 - 0.12*Math.sin(k*Math.PI);   // stretch
    if (r.jumpT >= r.jumpDur){
      r.jumping = false; r.yOff = 0;
      if (tileUnsafe(r.tiles[r.idx])){ crumbleTile(r.tiles[r.idx]); startFall(); return; }
      Sound.land(); spawnDust(new THREE.Vector3(base.x, base.y-0.05, base.z), 0xe8d8c0, 6, 1.4, 1);
    }
  }

  // slide crouch — squashes flat for a moment
  if (r.sliding){
    r.slideT += dt;
    const k = Math.min(r.slideT/r.slideDur,1);
    sy *= 0.45 + 0.55*Math.abs(1-2*k);   // flatten then rise
    sx *= 1.25;
    if (r.slideT >= r.slideDur) r.sliding = false;
  }

  // lateral lane movement, perpendicular to the run direction
  const fwd = B.clone().sub(A); fwd.y = 0;
  if (fwd.lengthSq() < 1e-4) fwd.set(0,0,1); else fwd.normalize();
  const perp = new THREE.Vector3(-fwd.z, 0, fwd.x);          // right-hand perpendicular
  const laneTarget = r.lane * 0.32;                          // stay on the ~1-wide ledge
  r.laneX += (laneTarget - r.laneX) * Math.min(1, dt*10);

  g.position.set(base.x + perp.x*r.laneX, base.y + r.yOff, base.z + perp.z*r.laneX);
  g.scale.set(sx, sy, sx);
  placeShadow(g, r);

  // face direction of travel
  const dir = B.clone().sub(A); dir.y = 0;
  if (dir.lengthSq() > 0.0001) g.rotation.y = Math.atan2(dir.x, dir.z);

  // progress HUD
  $('score').textContent = base.y.toFixed(1) + 'm';
  $('layer').textContent = Math.round(r.idx / (r.tiles.length-1) * 100) + '%';

  followCam(dt, false);
}

function placeShadow(g, r){
  if (!S.shadow) return;
  const A = r.tiles[r.idx].pos;
  S.shadow.position.set(g.position.x, A.y + 0.46, g.position.z);
  const lift = Math.max(0, g.position.y - A.y);
  const s = Math.max(0.4, 1 - lift*0.4);
  S.shadow.scale.set(s, s, s);
  S.shadow.material.opacity = 0.32 * Math.max(0.25, 1 - lift*0.5);
}

function startFall(){ S.run.falling = true; S.run.fallV = -1; Sound.drop(); }
function runCrash(){ const r=S.run; if(!r||r.falling) return; r.crashReason='hit'; r.falling=true; r.fallV=1.2; Sound.drop(); shake(0.6); }

// a tile you can't safely stand on: a hole, or a cracked (weak) block
function tileUnsafe(t){ return t.gap || t.weak; }
function crumbleTile(t){
  if (t.marker){ scene.remove(t.marker); t.marker = null; }
  const m = t.mesh;
  if (m && !m.__fell){ m.__fell = true;
    S.falling.push({ mesh:m, vel:new THREE.Vector3((Math.random()-0.5)*3, 0.5, (Math.random()-0.5)*3), rot:rand3(5) }); }
}

function followCam(dt, falling){
  const r = S.run, g = S.runner;
  const A = r.tiles[r.idx].pos, B = r.tiles[Math.min(r.idx+1,r.tiles.length-1)].pos;
  let dir = B.clone().sub(A); dir.y = 0;
  if (dir.lengthSq() < 0.0001) dir.set(0,0,1); else dir.normalize();
  const want = g.position.clone().addScaledVector(dir, -3.6); want.y = g.position.y + 2.4;
  camera.position.lerp(want, Math.min(1, dt*4));
  camera.lookAt(g.position.x, g.position.y + 0.4, g.position.z);
  applyShake();
}

// ---------- camera (build) ----------
function buildFitDistance(){
  const n = S.capstone ? 2 : nForLayer(S.layer);
  const amp = 1.4 + Math.min(S.layer*0.12, 0.9);
  const halfW = (n*BLOCK_SIZE)/2 + amp*0.6 + 1.0;          // wall width + swing + margin
  const tanH = Math.tan(camera.fov*Math.PI/360) * camera.aspect;  // horizontal half-fov
  return Math.max(9, halfW / Math.max(tanH, 0.12));
}
function updateBuildCam(dt){
  S.camRotE = S.camRotE ?? 0; S.camHE = S.camHE ?? 0; S.camRE = S.camRE ?? buildFitDistance();
  S.camRotE += (S.camRot - S.camRotE) * Math.min(1, dt*5);
  S.camHE   += (S.camHeight - S.camHE) * Math.min(1, dt*4);
  S.camRE   += (buildFitDistance() - S.camRE) * Math.min(1, dt*3);
  const a = S.camRotE, R = S.camRE, h = S.camHE;
  camera.position.set(Math.sin(a)*R, h + R*0.34, Math.cos(a)*R);
  camera.lookAt(0, h, 0);                                  // aim at the row being built
  applyShake();
}
function applyShake(){
  if (!S.shakeAmt) return;
  camera.position.x += (Math.random()-0.5)*S.shakeAmt;
  camera.position.y += (Math.random()-0.5)*S.shakeAmt;
  camera.position.z += (Math.random()-0.5)*S.shakeAmt;
}

// ---------- HUD / screens ----------
function updateHUD(){
  $('score').textContent = S.score; $('layer').textContent = S.layer+1;
  const integ = Math.max(0, S.integrity);
  $('meterFill').style.width = (integ*100)+'%';
  $('meterFill').style.background = integ>0.4 ? 'linear-gradient(90deg,#6fe3a0,#e8d35f)' : 'linear-gradient(90deg,#e8a35f,#e85f5f)';
}
function showPop(t){ const p=$('pop'); p.textContent=t; p.classList.remove('show'); void p.offsetWidth; p.classList.add('show'); }

function startGame(){
  resetState();
  [...scene.children].forEach(o => { if (o.isMesh && o!==ground && o!==sky) scene.remove(o); if (o.isGroup) scene.remove(o); });
  S.phase='build';
  $('startScreen').classList.add('hidden'); $('overScreen').classList.add('hidden');
  $('lblA').textContent='SCORE'; $('lblB').textContent='LAYER';
  $('lives').style.display='none'; $('meterLabel').textContent='STRUCTURAL INTEGRITY'; $('meterBar').style.display='block';
  $('meterWrap').style.opacity='1';
  updateHUD(); spawnBlock();
}

function endGame(won, how){
  if (S.gameOver) return;
  S.gameOver = true; S.won = won; S.phase = 'over';
  setTimeout(()=>{
    $('overTitle').textContent = won ? 'YOU REACHED THE TOP' : (how==='fell' ? 'YOU FELL' : how==='hit' ? 'YOU CRASHED' : how==='collapsed' ? 'IT ALL CAME DOWN' : 'GAME OVER');
    $('finalScore').textContent = S.score;
    $('finalStat').textContent = won
      ? 'Pyramid built and conquered.'
      : (how==='fell' ? 'So close to the summit.' : how==='hit' ? 'Hit an obstacle on the climb.' : `The structure gave way on layer ${S.layer+1}.`);
    $('overScreen').classList.remove('hidden');
  }, 700);
}

// ---------- input ----------
function onTap(e){
  e.preventDefault();
  if (S.phase===undefined || !S.phase){ startGame(); return; }
  if (S.phase==='build'){ if (!S.started){} drop(); return; }
  if (S.phase==='run'){ runJump(); return; }
}
// boot: first tap starts; thereafter route by phase
let booted = false;
let gStart = null;
window.addEventListener('pointerdown', e => {
  e.preventDefault();
  Sound.init(); if (Sound.ctx && Sound.ctx.state==='suspended') Sound.ctx.resume();
  if (!booted){ booted = true; startGame(); return; }
  if (S.gameOver){ if (!$('overScreen').classList.contains('hidden')){ booted=true; startGame(); } return; }
  if (S.phase==='build'){ drop(); return; }
  if (S.phase==='run'){ gStart = { x:e.clientX, y:e.clientY }; }   // wait for swipe direction
}, { passive:false });
window.addEventListener('pointerup', e => {
  if (S.phase!=='run' || !gStart) return;
  const dx = e.clientX - gStart.x, dy = e.clientY - gStart.y; gStart = null;
  const TH = 28;
  if (Math.abs(dx) < TH && Math.abs(dy) < TH){ runJump(); return; }     // tap = jump
  if (Math.abs(dx) > Math.abs(dy)) runMove(dx > 0 ? 1 : -1);            // swipe L/R
  else if (dy < 0) runJump();                                          // swipe up
  else runSlide();                                                     // swipe down
}, { passive:false });
window.addEventListener('keydown', e => {
  const k = e.code;
  if (k!=='Space' && k!=='ArrowUp' && k!=='ArrowDown' && k!=='ArrowLeft' && k!=='ArrowRight') return;
  e.preventDefault();
  if (!booted){ booted=true; startGame(); return; }
  if (S.gameOver){ if (!$('overScreen').classList.contains('hidden')) startGame(); return; }
  if (S.phase==='build'){ if (k==='Space'||k==='ArrowUp'||k==='ArrowDown') drop(); return; }
  if (S.phase==='run'){
    if (k==='Space'||k==='ArrowUp') runJump();
    else if (k==='ArrowDown') runSlide();
    else if (k==='ArrowLeft') runMove(-1);
    else if (k==='ArrowRight') runMove(1);
  }
});

// ---------- loop ----------
const clock = new THREE.Clock();
resetState(); S.phase = null;
function animate(){
  requestAnimationFrame(animate);
  const dt = Math.min(clock.getDelta(), 0.05);

  if (S.active && S.phase==='build'){
    const a = S.active;
    if (a.mode==='finisher'){
      a.u += a.vel*dt;
      if (a.u >= a.hi){ a.u = a.hi; a.vel = -Math.abs(a.vel); }
      else if (a.u <= a.lo){ a.u = a.lo; a.vel = Math.abs(a.vel); }
      a.mesh.position[a.axis] = a.u;
      a.mesh.position.y = a.liftY;
    } else {
      a.phase += a.speed*dt;
      if (a.mode==='sym') a.mesh.position[a.axis] = a.center[a.axis] + Math.sin(a.phase)*a.amp;
      else a.mesh.position[a.axis] = a.center[a.axis] + a.odir*(a.range/2)*(Math.sin(a.phase)+1);
    }
  }
  for (let i=S.falling.length-1;i>=0;i--){ const f=S.falling[i];
    f.vel.y -= 9.8*dt; f.mesh.position.addScaledVector(f.vel,dt);
    f.mesh.rotation.x += f.rot.x*dt; f.mesh.rotation.z += f.rot.z*dt;
    if (f.mesh.position.y < -8){ scene.remove(f.mesh); S.falling.splice(i,1); } }

  // particles
  for (let i=S.fx.length-1;i>=0;i--){ const p=S.fx[i];
    p.vel.y -= 6*dt; p.mesh.position.addScaledVector(p.vel,dt);
    p.life -= p.decay*dt; p.mesh.material.opacity = Math.max(0,p.life);
    p.mesh.scale.multiplyScalar(1 - dt*0.6);
    if (p.life<=0){ scene.remove(p.mesh); S.fx.splice(i,1); } }

  // landing squash on placed blocks
  for (let i=S.squash.length-1;i>=0;i--){ const q=S.squash[i]; q.t += dt*5;
    const k = Math.min(q.t,1); const s = 1 - 0.28*Math.sin(k*Math.PI);
    q.mesh.scale.set(1, s, 1);
    if (q.t>=1){ q.mesh.scale.set(1,1,1); S.squash.splice(i,1); } }

  // decay camera shake
  if (S.shakeAmt) S.shakeAmt = Math.max(0, S.shakeAmt - dt*2.2);

  // gentle glow pulse on capstone + gap markers
  const pulse = 0.5 + 0.5*Math.sin(performance.now()*0.004);
  if (S.active && S.active.capstone && S.active.mesh.material.emissive)
    S.active.mesh.material.emissive.setRGB(0.35*pulse, 0.24*pulse, 0.0);
  if (S.run) S.run.tiles.forEach(t => { if (t.marker) t.marker.material.opacity = 0.5 + 0.4*pulse; });

  if (S.phase==='run') updateRun(dt);
  else updateBuildCam(dt);

  renderer.render(scene, camera);
}
// initial idle camera
camera.position.set(0,7,11); camera.lookAt(0,2,0);
animate();

addEventListener('resize', ()=>{ camera.aspect=innerWidth/innerHeight; camera.updateProjectionMatrix(); renderer.setSize(innerWidth,innerHeight); });
</script>
</body>
</html>
