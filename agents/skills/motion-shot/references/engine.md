# Engine — timeline, camera, morphs, sound, verification

> Load when building or debugging the shot. Start from
> `assets/shot-engine.html`; this file explains its parts and the patterns
> that are known to work.

## Contents

Timeline model · Primitives · Camera rig · Morph patterns · Sound design ·
Transport and retakes · Determinism gotchas · Verification commands

## Timeline model

One `TOTAL` in milliseconds; one `render(t)` that is a **pure function of the
time**. No state that render mutates, no CSS transitions, no `setInterval` —
so scrubbing, stepping and still-freezing all give identical output.

```js
const clamp=(v,a,b)=>Math.max(a,Math.min(b,v));
const lerp=(a,b,t)=>a+(b-a)*t;
const ease=t=>1-Math.pow(1-t,3);                       // decelerate
const easeIO=t=>t<.5?4*t*t*t:1-Math.pow(-2*t+2,3)/2;   // symmetric
const p=(a,b,t)=>ease(clamp((t-a)/b,0,1));             // segment helper
```

Motion windows are declared by time in ms: a row that lands across
`2300–2640` is `ease(clamp((t-2300)/340,0,1))`.

## Primitives

- **Word slots.** Split a line into spans once; drive each word's
  `opacity/transform/filter` from `t` with a stagger. This is the caption
  engine — see `#caps` in the starter.
- **Count chip.** One element whose `textContent` is set by thresholds
  (`t<7100?'2,400':(t<9200?'4':'1')`), with a short "hot" class for the change.
- **Live typing.** `textContent = QUERY.slice(0, floor((t-300)/85))` plus a
  caret whose opacity is `Math.sin(t/170)>0`.
- **In-place highlight.** Background/colour interpolated on existing spans;
  never draw connector lines in empty space.

## Camera rig

Two layers: `#bg` (oversized by ~60 px) and `#cam` (the content), both driven
from `t`. Content moves more than background — that difference is the depth.

```js
// piecewise keyframes; the most readable camera primitive
const track=(t,pts)=>{ if(t<=pts[0][0])return pts[0][1];
  for(let i=1;i<pts.length;i++) if(t<=pts[i][0])
    return lerp(pts[i-1][1],pts[i][1],(t-pts[i-1][0])/(pts[i][0]-pts[i-1][0]));
  return pts[pts.length-1][1]; };
const cs=track(t,[[0,1],[2600,1.07],[3400,1.02],[5600,.96],[6800,1.04],[9300,1.08],[10400,1.13]]);
const cy=track(t,[[0,0],[2600,-10],[3400,8],[5600,14],[6800,0],[9300,-4],[10400,-10]]);
```

Rules of thumb: one push per scene, a pull where the camera should "step
back" to let a new object form, and a chase (small push + drift) onto the
payoff. 4–13% scale is enough; 20%+ feels like a zoom effect. Compose for the
widest scale, or content clips at the stage edges.

## Morph patterns

- **Absorb (the merge).** The travelling element moves onto the target and is
  scaled slightly smaller and faded; the target takes a short ring flash and
  a squash (`sin(pi*p)*.02`). The incoming element should land a few pixels
  inset, not exactly on top — the still frame must still read as two objects
  for the ~200 ms of overlap.
- **Scene morph.** The old object shrinks toward the new object's centre and
  fades while the new one scales in from ~0.93. Same position, same palette:
  a hard cut with continuity, not a dissolve.
- **Object leaves a container.** Move it out on a `translateY` track, fade in
  only after it clears the container's edge, then remove the source chip.
  If the container empties before the traveller appears, keep the source
  visible longer — an empty panel is a dead frame.
- **Windowed list.** A fixed-height container with a CSS mask fading 14–24 px
  at the top and bottom, dashed ghost rows at the extremes, and real rows
  inside. This is the cheapest "many more" affordance.
- **Count as narrative.** `2,400 → 4 → 1`: change at the moment the cause
  happens (blocking, reject, merge) and flash the chip.

## Sound design

- One cue per visible state change; never a cue per moving element.
- Cue table lives in one array: `[[ms,'kind'],…]`.
- Two scheduling modes, both needed:
  - **Play/seek:** schedule all cues after `t` into the AudioContext
    (`osc.start(ctx.currentTime + (at-t)/1000)`).
  - **Scrub/loop:** fire a cue when the playhead crosses it
    (`prev < at && t >= at`), so scrubbing through a change ticks once.
- Known-good synth recipes (no assets): `tick` 340→260 Hz 90 ms; `dock`
  170→84 Hz with a `bass` 72→42 Hz under it for merges; `whoosh`
  band-passed noise 420→2200 Hz; `slide` descending 1900→520 Hz for exits;
  `confirm` two sines 880/1318 Hz.
- Add a sound toggle. Watch the shot muted before shipping.

## Transport and retakes

Deck: play/pause, replay, scrub, elapsed readout. Keyboard: `Space`, `R`.
Deep links are the retake tool: `?t=8.4` freezes that exact frame,
`?t=8.4&auto=1` also plays from it — use them to review or re-record one
beat without watching the whole shot.

## Determinism gotchas

- Transforms do not apply to non-replaced inline elements — give animated
  `span`s `display:inline-block`.
- Morph targets computed from `offsetTop` must read the *container-relative*
  position; verify a still at the merge frame before trusting it.
- Animate `transform` and `opacity`; a one-off scale on a single panel is
  fine, but never layout properties in a loop.
- Set `will-change` on the few elements that move every frame.
- A stage element hidden by its own action (emptied panel, label from a dead
  state) is the most common still-frame defect. Fade it out when its story
  ends.

## Verification commands

All commands below were run during the making of the reference shots
(Windows PowerShell).

```powershell
# 1. Extract the inline script and syntax-check it
$html = Get-Content -LiteralPath .\shot.html -Raw
$m = [regex]::Match($html,'(?s)<script>(.*?)</script>')
Set-Content -LiteralPath .\check.js -Value $m.Groups[1].Value -Encoding UTF8
node --check .\check.js      # silence = pass

# 2. Serve locally for browser checks and stills (file:// is often blocked)
Start-Process -FilePath python -ArgumentList "-m","http.server","8126","--bind","127.0.0.1" `
  -WorkingDirectory (Get-Location) -WindowStyle Hidden
Start-Sleep -Seconds 2

# 3. Freeze stills at beat boundaries
$chrome = "C:\Program Files\Google\Chrome\Application\chrome.exe"
foreach($t in @(1.0,3.2,5.6,7.3,9.4,11.5)){
  & $chrome --headless=new --disable-gpu --hide-scrollbars --window-size=1400,820 `
    --virtual-time-budget=1200 --screenshot="$PWD\still_$t.png" `
    "http://127.0.0.1:8126/shot.html?t=$t" | Out-Null
}
# Read every still. Ghost overlaps and stale labels only show up here.

# 4. Stop the server when done
$l = Get-NetTCPConnection -LocalPort 8126 -State Listen -ErrorAction SilentlyContinue
if($l){ Stop-Process -Id $l.OwningProcess -Force }
```

Then run the delivery checklist in SKILL.md Phase 3 against the stills.
