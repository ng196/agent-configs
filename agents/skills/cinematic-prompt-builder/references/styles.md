# Style Recipes

Each recipe lists the distinguishing ingredients of that style. Build on top of the universal sections in `structure.md`. The recipes are starting points — the goal is to let the user make *anything*, so combine and deviate freely.

---

## Live-action cinematic (epic / dramatic)

**Look:** 8K photoreal, anamorphic widescreen, 35mm film quality, fine grain, professional color grading, steadicam fluidity. Photoreal, NOT 3D/game.
**Camera:** orbiting/chasing as a second flyer or ground presence; whip-pans; handheld shake on impacts.
**Structure:** works as a oner OR multishot. Epic scale wants crushing scale contrast — tiny figures vs vast subjects.
**Signature moves:** a "hook" event (a second giant creature, a near-collision) that triggers one held slow-motion beat, then snaps back into a dive/chase.
**Creatures:** original designs, described concretely (hide, wings, bioluminescent seams), "not based on any franchise".
**Lighting:** one warm accent color in a cold world (amber bioluminescence in slate-blue storm) reads beautifully.
**Audio:** diegetic; roars, wind, thunder; slow-mo drops to a muffled vacuum + heartbeat, snaps back with a sonic whoosh.

---

## 3D animated feature (Pixar-quality, with dialogue)

**Look:** vibrant glossy CGI render, Pixar-quality stylized animation, subsurface-scattered fur/skin, expressive cartoon performance, dappled daylight, lush saturated palette, depth-of-field mastery.
**Structure:** multishot montage — explicitly "Don't use one camera angle or single cut". 6 shots / 15s is the proven shape.
**Characters:** goofy, expressive, concrete designs (shaggy orange horned monster, round blue scaly dragon, mossy tree-creature). A tiny background character in the foreground ferns adds depth and comedy.
**Dialogue:** each shot can carry a spoken line in quotes, with the delivery described ("bursting with excitement he says:", "whispers:", "they all gasp:"). Keep lines short and characterful.
**Camera per shot:** vary deliberately — push-in, close-up, wide, tracking, insert, wide. Name the move each time.
**Comedy beat:** land a visual gag (the treasure under the foot the whole time) and a sheepish button line.
**Audio:** can use light score here, but follow the user's default (often still SFX-forward).

---

## Game-engine cutscene (third-person, persistent HUD)

**Look:** AAA video-game cinematic, Unreal Engine 5 real-time in-engine render, Lumen GI, Nanite micro-geometry, screen-space reflections. Hyperreal but unmistakably GAME-RENDERED — explicitly NOT live-action, NOT film. Game-character subsurface skin, NOT live-action pores.
**Camera:** virtual game-cinematic camera, third-person over-the-shoulder, 180° shutter motion blur, game-cutscene DOF.
**Structure:** multishot, hard cuts, 3 shots / 15s typical. Default NO slow-mo; speed-ramp only on the one or two big beats.
**HUD LAYER — the defining feature.** Replicate the reference HUD exactly: flat 2D screen-space UI in a locked accent hex color, screen-PINNED on every shot (does NOT move/parallax with camera; numbers may tick, layout is locked). Enumerate every element with exact text and position — compass bar, minimap, quest log (with quest names + progress counters), level/XP/HP/stamina bars, hotbar slots, ammo + currency, diegetic world-space `[E] PROMPT`. A boss bar fades in on the reveal.
**Subject:** `@handle` player-character matching the reference 100%, framed over-the-shoulder like a playable hero.
**Location:** reference is master STYLE reference, not a fixed keyframe — the world extends, the subject moves through space, not pinned to the frame.
**Constraints:** HUD legible and consistent in EVERY shot, accent color locked; contact shadows on debris; creature scale locked (e.g. boss-mutant ~2.5 human-heights, NOT kaiju-giant); NO eye glow.
**Audio:** NO MUSIC, SFX only, plus subtle UI ticks (waypoint ping, quest-update chime).

Note: a game-cutscene oner with HUD also works (see the flooded-cathedral boss example) — one unbroken third-person move, HUD burned into frame throughout, VFX tags like `[VFX: blade ignition]` inline.

---

## Gameplay footage (arcade, locked rig, live HUD)

**Look:** AAA arcade gameplay (Forza Horizon / Need for Speed). Hyper-saturated, glossy, high-contrast real-time engine render, crisp pinned UI. In-game gameplay, NOT a film plate.
**Camera:** classic third-person chase-cam, rock-steady, locked to the vehicle; ultra-wide; heavy speed-blur on the world, subject razor-sharp. Camera follows drift yaw but subject stays centered. No handheld, no chase-breaking cuts.
**Structure:** multishot but pure gameplay cam, 3 shots / 15s. NO slow-motion anywhere — constant full speed, super dynamic.
**HUD:** live racing UI pinned to screen, accent hex — RPM gauge, digital speedometer climbing, gear number, BOOST bar filling/draining, mini-map with hazard markers, lap timer, position. Flat on screen, never in the 3D world.
**World:** keep every element's design identical to the reference; model extends the road/track forward as the subject moves deeper. No new characters/props/palette. No real brand logos.
**Audio:** NO MUSIC, SFX only — engine revs, gear shifts, boost whoosh, tyre screech, impact slams, UI beeps.

---

## FPV / POV oner (single continuous take)

**Look:** single continuous shot, one take no cuts, cinematic FPV/POV oner, 4K ultra-detailed, photoreal macro, anamorphic, fluid drone/quadcopter flight.
**Camera:** the camera IS a flying/first-person presence. For POV: clean human vision, NO helmet/visor/HUD, rider's hands at the bottom of frame on controls, organic micro-tremor and reactive eye-line. For FPV drone: dives into texture clouds, brushes close against surfaces to read every material, never stops, never pulls up or back.
**Structure:** ONE unbroken paragraph, beats by timestamp. The only speed change is named: a jolt/strike triggers a slow-motion or bullet-time macro beat (e.g. 240fps), then snaps back to real-time (24fps). State the fps numbers for the ramp.
**Signature:** macro brushes against surfaces; a mid-shot slow-mo macro hold; a frozen bullet-time orbit on a strike; anamorphic flares on the slow beat.
**Audio:** diegetic; during slow-mo all ambient wind drops to a muffled vacuum replaced by amplified rhythmic sound (wingbeats, heartbeat), then a sonic whoosh as reality snaps back.

---

## Product / commercial spot

**Look:** 8K photorealistic editorial commercial, cinematic and moody, deep black crush, per-character/per-section color worlds.
**Structure:** multishot, many short sections (8–10), HARD match-cuts on action. Often a single named stylized transition (one FILM BURN) and otherwise all hard cuts. Resolves on a HERO PACKSHOT.
**Sections:** intercut human interaction with the product + rapid macro product montage (0.3s cuts, strobe flash on each). Each character gets their own color/light world.
**Product lock:** products match the reference arrangement exactly; logos read exactly as named and stay sharp; product colors locked (serum stays green, cream stays white). Restate in POSITIVE LOCKS.
**Packshot:** products in one third, clean dark negative space in the rest, slow dolly-in, particle drift (gold dust), micro-bounce settle, hold.
**Camera:** crash-zoom, macro probe-lens, snap-rack focus, speed-ramp on product interactions, slow dolly on the packshot.
**Physics:** surface tension on drops, cream spreads with weight, droplets bead, dust falls under gravity, correct contact shadows.
**Audio:** NO MUSIC, NO voiceover, NO on-screen text — only diegetic product-handling SFX (glass clink, pump hiss, spray mist) + ambient bass drone; ember sizzle only on the film burn.

For a multi-cut CGI product montage (e.g. "10 cuts of 3D CGI product"), same principle: each cut showcases the product surface/mechanism in hyperdetail, hard cuts, resolve clean.

---

## VFX composite on a source video (input-locked)

**Look:** 8K cinematic, photorealistic — explicitly no 3D render, no game engine, no game-cutscene look. Practical creature-FX realism: pore-level wet translucent dermis, visible capillaries, slick film catching light. Composition and grade INHERITED from `<<<video_1>>>`.
**The core rule — INPUT LOCK:** the entire source clip is preserved UNCHANGED. List every element of the plate (desk, devices, lighting, figures, grade, the exact handheld camera move with its framing/focal length/shake/timing). Do NOT re-grade, re-time, smooth, or re-frame. The ONLY additions are the new element + the light it casts + its contact shadows + any wet film + the host object's slight physical reaction.
**Camera:** INHERIT the source camera exactly. The added element is parallax-locked to its anchor plane so it tracks correctly; correct occlusion (limbs in front of objects they rest on, emerging from behind a bezel).
**Subject:** the added creature/element, anchored to a real object in the plate (e.g. emerging from a laptop screen treated as a physical liquid membrane that stretches and beads with surface tension around every limb).
**Constraints:** match source duration exactly; NO slow-motion (keep source real-time); NO eye glow; no CG/game look; scale anchored to a real object in the plate for believability.
**Audio:** NO MUSIC, SFX only — the new element's diegetic sounds layered over faint preserved room tone.

---

## Kaiju / creature cinematic (original design)

**Look:** 8K photoreal, anamorphic, original-creature blockbuster grade, fine grain, hyperdetailed.
**Structure:** sequence of cuts (often 6), may use OPTICS per-cut (focal length + angle per cut). Slow-motion on one beat only (e.g. the breach). Motion accelerating from stillness into violent combat.
**Character design:** ORIGINAL, not based on any franchise — describe hide, eye, fins, tentacles, mantle concretely.
**Continuity — critical:** the SAME creature/eye/environment across all cuts; the specific detail that opens CUT 1 (a closed eye) is the exact one zoomed into in CUT 2. State this explicitly and tell the model not to lose it.
**Containment rule:** keep the action within a believable envelope (the fight STAYS at the sea surface — creatures breach, dive, grapple, submerge, but NEVER fly or get carried into the air). This both grounds physics and avoids absurd outputs.
**Camera:** macro on detail → hard fast zoom → wide breach → handheld water-on-lens dive → surface grapple → high wide. Never static.
**Physics:** true mass and fluid dynamics — breach displaces a wall of water, dive collapses water inward, droplets cling to the lens, tentacles whip with drag.
**Audio:** diegetic only — ocean ambience, rising rumble, eye-snap sting, water-burst, roars, subsonic boom.

For a land titan (ice/stone giant + army): same DNA — crushing primordial scale, handheld shake on each cracking movement, snapping between the titan and tiny soldiers for scale, glowing runes as accent, vast snow plumes. Keep destruction in uninhabited/evacuated terrain (see content-policy.md).

---

## Composing a new style

If the request matches nothing above, build from `structure.md` directly:
1. Pick the render look and state what it is (and is NOT).
2. Choose oner vs multishot.
3. Decide the camera language and one signature move.
4. Populate three depth layers and a scale figure.
5. Lock any reference.
6. Add physics + practical light + audio.
7. Run the discipline checklist.
The section vocabulary is style-agnostic — it carries any genre.
