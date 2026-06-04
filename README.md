# Pyramid Stacker · Runner

A two-phase mobile/web game built in a single HTML file with Three.js — no build step, no dependencies to install.

1. **Build phase** — tap to drop stones; each layer insets half a block up a four-walled pyramid. Sloppy drops weaken the structure; land them centered for PERFECT combos.
2. **Run phase** — sprint the spiral *up the exact pyramid you built*, grabbing coins, jumping the gaps your bad drops left, sliding under beams, and dodging pillars to the capstone.

## Features

- Pyramid stacker + on-rails runner in one loop
- Juice: landing squash, perfect-streak flash, near-miss bullet-time, low-integrity danger vignette + heartbeat, speed ramp
- Collectible coins (airborne grabs pay double) banked into a persistent currency
- Skin shop: 5 stone/runner palettes unlocked with coins
- Daily Challenge: a date-seeded pyramid that's identical for everyone
- Local leaderboard, persistent best score & high climb
- Hazards: sweeping pillars, sandstorms, crumbling tiles
- Revive / continue (coins or rewarded-ad placeholder) and 2× coins
- Onboarding hints, procedural Web Audio (no asset files)

## How to test it

The whole game is **`pyramid-stacker-runner.html`**. You need an internet connection the first time (it loads Three.js from a CDN).

### Quickest — open in a browser
Double-click `pyramid-stacker-runner.html`, or drag it into Chrome/Safari/Firefox. Click to start.

### Test the mobile/touch feel
Open it in Chrome, press **F12** → click the **device toolbar** icon (Ctrl/Cmd+Shift+M) → pick a phone. Now taps and swipes are emulated. Swipe ⟷ to change lane, ↑ to jump, ↓ to slide.

### Run a local server (recommended)
From this folder:

```bash
python3 -m http.server 8000
```

Then visit `http://localhost:8000/pyramid-stacker-runner.html`.

### Test on a real phone
Push to GitHub and enable **GitHub Pages** (Settings → Pages → deploy from branch). Your game will be live at
`https://<user>.github.io/<repo>/pyramid-stacker-runner.html` — open that on your phone.

### Controls
| Action | Desktop | Touch |
|---|---|---|
| Drop block / Jump | Space / ↑ | Tap |
| Move lane | ← / → | Swipe ⟷ |
| Slide | ↓ | Swipe down |

## Resetting progress
Coins, skins, and scores are saved in your browser's `localStorage`. To wipe them, clear site data for the page (DevTools → Application → Local Storage) or run `localStorage.clear()` in the console.
</content>
</invoke>
