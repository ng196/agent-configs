---
name: motion-shot
description: >-
  Directs and builds short, mostly-silent product motion — product videos,
  launch or demo clips, kinetic sequences — as one self-contained HTML
  timeline made for screen recording. Use when the user asks for a product
  video, launch/promo/demo clip, motion graphics, a kinetic animated
  sequence, a 5-15 second shot, or an animation that must read with no
  voice-over. Enforces a chain-of-realizations script written before any
  motion, one focal object carried across morphing scenes, camera keyframes,
  event-locked sound, real-data accuracy, and a still-frame verification
  pass. Not for narrated teaching animations or diagram lessons — that lane
  uses narrator lines and step-through pacing.
---

# Motion Shot

> Short, silent, high-kinetic product motion — directed as a chain of
> realizations, delivered as one seekable HTML timeline.

**Created by Nitin** — distilled from a run of real product shots built,
reviewed and re-cut in practice.

**Licence:** This skill is released under CC BY 4.0 — share and adapt for any
purpose with credit.

**Feedback & Support:** Send methodology feedback to the skill author
directly. If the agent failed to follow this skill's own rules, correct that
in-session instead of filing it.

---

## What this produces

One self-contained `.html` file: a fixed 16:9 stage, a **deterministic
timeline** (every frame a pure function of `t`), a single focal object that
morphs between scenes, camera keyframes, event-locked sound, and a transport
deck for scrubbing and retakes. No build step, no dependencies, no network.
Built for screen recording.

**Not for:** narrated teaching animations, diagram-driven lessons, or
step-through presentations — that lane runs on narrator lines, held beats and
a presenter. Static diagrams and slide decks are not this at all.

## The loop

**Intake → Chain of realizations → Visualise → Beat script → Build →
Accuracy → Verify.**

### Phase 0 — Intake

1. **Product truth.** What actually happens, on what surface, with what real
   data. If a real dataset or product exists, the shot will be built from one
   true example from it — never invented placeholders.
2. **The one action** the shot demonstrates, and what changes because of it.
3. **Length.** 5–15 s typical. One shot = one action = one payoff.
4. **Sound.** Is there a score, or action sounds only? If no score exists,
   ship action sounds only and say so.
5. **Crop.** Recording band; everything essential stays inside it.

### Phase 1 — Chain of realizations, then STOP

Before any motion, write two things and show them:

- **The chain of realizations** — per beat: *what the viewer understands now,
  and why the next beat follows.* Effects assembled first and story-hunted
  afterwards is the failure this phase exists to prevent.
- **Scene sentences** — per scene, one sentence of the moving element: *"in
  the centre, X does Y, then it becomes Z."* No object and verb, no shot.
  Method is chosen last: the cheapest technique that sells the sentence.

Also write the **caption arc** — the silent-film narration: up to three quick
cards (problem → evidence → question), then the answer. Read it with the
screen off; if the words alone don't carry the story, motion won't save it.

No HTML until these exist. Read `references/beat-script.md` when writing or
revising them.

### Phase 2 — The laws

1. **Compatibility gate.** A topic qualifies only if an action produces a
   visible before→after on a surface the viewer recognises. If it has no such
   change (a metric, a model choice, a pipeline diagram), the honest output is
   a static diagram — say so and decline the shot.
2. **One focal point at a time.** Decide where the eye is before adding
   motion. One object carries the whole shot; everything else waits or
   leaves.
3. **Proof is a state change, not a verdict.** A row absorbs another row, a
   count drops `2,400 → 4`, an output line is written. A score, meter,
   checkmark or the word "MATCH" proves nothing on its own.
4. **Show cause and consequence.** Establish what is happening, show the
   product act in its real context, then show what the action changed.
   Isolated screens that announce a feature are advertisements, not proof.
5. **Transitions preserve meaning.** Carry forward an object, word, gesture or
   question the viewer already recognises — the same element changes role.
   Smooth shape-changes with no story reason are decoration.
6. **Timing: fast handoffs, held landings.** Quick swaps (250–500 ms) build
   energy; the landing that must be understood gets 1.5–2.5 s of settle.
   Speed of movement is not speed of comprehension.
7. **Camera is a cast member.** Assign each beat its camera move (push, pull,
   drift, chase) in the visualisation pass; never lock the camera. Adding a
   beat later means adding its camera move and transition in the same pass.
8. **Theme is weather.** Every scene inherits the product's visual world. A
   palette flip mid-film (to black, to neon) costs the film its identity.
9. **Scale is suggested, never enumerated.** Dashed continuation rows, a
   dotted spine, a live count — one affordance reads "many more"; one more
   instance card reads "one more".
10. **Sound marks meaning.** One cue per visible state change: typing ticks,
    row landings, a whoosh into a dock for a merge, an ascending sweep for
    exits. No cue on decoration. Watch it muted first: if the story dies
    without sound, sound was doing the storytelling.
11. **Real data or nothing.** When the subject is a real system, use one true
    example that exercises its actual cases, and compute the numbers on
    screen. An invented figure is worse than a counted one.
12. **Premium = more planned beats, not more polish.** Added scope (scale,
    depth, technicality) arrives as beats with their own idea, camera move
    and sound event.
13. **Determinism.** Everything is a pure function of `t`; no `setInterval`,
    no CSS delay-chains. Scrubbing and stepping stay exact, and retakes are
    cheap.

When building, read `references/engine.md` and start from
`assets/shot-engine.html` — copy it as the first file of every new shot.

### Phase 3 — Verify, then deliver

1. Extract the inline script and `node --check` it.
2. **Freeze stills at every beat boundary.** Ghost overlaps, stale labels,
   dead space and invisible continuation rows are invisible in motion and
   obvious in stills.
3. Load it; the console stays clean.
4. Muted pass: the story still reads.
5. Stale-label pass: every label belongs to the state it is shown over.
6. Accuracy sweep: every number, name and ID traces to the real source.
7. Crop pass: all essential action inside the recording band.
8. Offline pass: no external requests.

### Phase 4 — Repair loop (when the user says "fix", "redo", "make it premium")

Never patch a symptom. Every complaint maps to a cause and a place:

1. **Classify** the complaint against the failure catalogue in
   `references/field-notes.md` — theme, camera, scale, causality, focus,
   timing, stale label, ghost overlap, dead frame, invented data, chrome.
2. **State the diagnosis before editing**, in one line: *symptom → root cause
   → the exact file/array/element that changes.* If the diagnosis is not
   clear, say what still frame would distinguish the hypotheses.
3. **Change the cause, in the working file only**, smallest diff that removes
   it. A complaint about energy is a camera/timing fix, not new decoration; a
   request for "premium" is planned beats, not polish.
4. **Re-verify**: syntax check plus stills at every touched beat, compared
   against the previous `?t=` stills. New defects are expected near edits —
   check neighbours (fade windows, label lifetimes, empty containers).
5. **Report with frames, not adjectives**: give the deep links
   (`?t=…`) for before/after and name what was deliberately not changed.

The same loop handles the first review of a fresh shot: run it yourself
before handing over.

### The beat check

For every beat answer three questions: **What am I showing? What does the
viewer learn? Where does their eye go next?** If any answer is vague, revise
the beat before animating it.

## Anti-patterns — never ship these

- Effects-first editing: impressive motion in search of a story.
- A gauge, score or checkmark standing in for a visible change.
- Simultaneous text + UI + decoration competing for attention.
- A locked camera, or a camera move bolted on after the cut.
- Palette flips; stock "black box" metaphors in a light product.
- Invented data in a shot about a real system, or a claim the product does
  not demonstrate.
- Enumerating scale with more cards instead of a continuation affordance.
- A beat whose removal loses no idea and no feeling.

## Reference files — load on trigger

- `references/beat-script.md` — **load when writing or revising the chain of
  realizations, the beat sheet, the caption arc, or the premium pass.**
- `references/engine.md` — **load when building or debugging the timeline,
  camera, morphs, sound or transport.**
- `references/field-notes.md` — **load on the first "fix/redo/premium"
  request and whenever a still frame looks wrong.** Earned cases: the
  failure catalogue (symptom → cause → exact fix), the complaint-to-location
  table, the preserved success patterns, and re-cut recipes.
- `assets/shot-engine.html` — **copy this as the first file of every new
  shot;** it has the clock, camera rig, morph demo, sound cues, deck and deep
  links already wired.
