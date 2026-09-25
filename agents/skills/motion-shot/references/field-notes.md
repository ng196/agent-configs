# Field notes — earned cases, complaint lookup, re-cut recipes

> Load on the first "fix / redo / premium" request, and whenever a still
> frame looks wrong. Every case below came out of a real build being reviewed,
> rejected or re-cut — the symptom is what the reviewer actually said.

## Contents

Failure catalogue · Complaint → cause → exact location · Success patterns to
preserve · Re-cut recipes

## Failure catalogue

**1. "Very bad animation." — a diagram of computation.**
Two floating cards, mid-air evidence lines, a score meter filling, a verdict
word. Nothing was a surface anyone recognises; nothing the viewer could point
to changed; the answer was a gauge reading.
*Fix:* rebuilt around a real surface with one visible state change — a
duplicate row absorbed into the canonical row. *Rule: proof is a state
change, not a verdict.*

**2. Dashboard chrome and a locked camera.**
A logo bar and breadcrumb framed the content, and the camera never moved.
Review: *"we don't need a dashboard"*, *"never fix camera"*.
*Fix:* chrome deleted, content centred on a chrome-free stage, camera
keyframes added. *Location: stage markup + camera tracks.*

**3. "The black background takes it out of the immersion."**
A model panel went near-black in a light product because "black box" was
taken literally. It read as a different film.
*Fix:* the panel re-dressed in the product's own white-card language.
*Rule: theme is weather.* *Location: CSS custom properties.*

**4. "The camera is again in a single place — not dynamic enough."**
Three moves across 10.8 s reads as static even when each beat works.
*Fix:* one camera move per beat — push onto the search, reveal-pull as the
list lands, pull for the morph, push onto the panel, slow drift during the
comparison, chase onto the payoff — plus background parallax at ~0.4×.
*Location: camera track arrays.*

**5. "Include the scale of the problem — dotted lines to show there are many,
many more."**
More instance cards could not say "thousands".
*Fix:* a windowed list (5 real rows, dashed ghost rows above and below, CSS
mask), a dotted spine inside the panel, and a live count that drops with the
product's work (`2,400 → 4 → 1`). *Location: list markup, ghost offsets, count
thresholds.*

**6. "A little bit more about the problem and a tiny bit more technicality."**
One language layer (the caption) cannot carry both meaning and precision.
*Fix:* a small mono line under each caption — real source sizes, `join key:
none`, the match rate, the domain gloss for a renamed record.

**7. "To add more, you have to plan those things accordingly."**
Scope was being added as polish; the result reads as noise.
*Fix:* premium = planned beats, each with an idea, a camera move and a sound
event. See the premium pass in `beat-script.md`.

**8. Merge ghosting (double exposure).**
At the overlap instant both records were legible in a still — the merge
looked like a glitch.
*Fix:* the traveller lands ~8 px inset at 0.96 scale, the fade starts at the
dock and completes in ~220 ms. Check the dock still specifically.
*Location: traveller transform + fade window.*

**9. Dead frame — a container emptied by its own action.**
The merged chip faded out before the output row arrived, leaving an empty
panel as the penultimate frame.
*Fix:* the canonical record stays in the panel; the output row exists as the
copy written out, fading in only after it clears the container's edge.
*Location: chip fade removed, output opacity window.*

**10. Continuation rows that cannot be seen.**
A CSS mask faded the top ghost row into invisibility, so the list looked
like it just ended.
*Fix:* mask fade cut to ~14 px, ghost offsets moved inward, ghost border
strengthened to `#C7CFDA`. *Location: `#list` mask + ghost `top`s.*

**11. Stale labels and ghosts of finished elements.**
`blocking · 3 candidates` was still on screen after the match; the search bar
remained visible behind later scenes.
*Fix:* every element and label gets an end fade tied to the state it
describes — including the "empty space" left by its story.
*Location: label opacity conditions.*

**12. Layout errors that logic cannot catch.**
A meta line sat *above* the search bar instead of under it.
*Caught by:* the still-frame pass, not by reading the code. *Rule: freeze
stills at every beat boundary.*

**13. Syntax break from an edit.**
A dropped closing brace turned a render function into a nested clock.
*Caught by:* extract the inline script and `node --check` **before** any
browser check. This is step 1 of every verification pass.

**14. Invented data in a shot about a real system.**
Placeholder names and counts (`Acme`, `1,240 matches`) until the real data
landed. The fix was not cosmetic: one true example group that exercises the
method's real cases (a typo'd duplicate, a suffixed reorder, a renamed
record) and numbers computed from the data.
*Rule: real data or nothing.*

## Complaint → cause → exact location

| They say | Likely cause | Change exactly here |
|---|---|---|
| "very bad / doesn't communicate" | no visible state change, or no focal object | beat script first; rebuild the scene, never re-skin it |
| "it's a dashboard" | chrome framing the content | stage markup: delete bars, crumbs, side panels |
| "too static / camera is in one place" | fewer than one camera move per beat | camera track arrays; add bg parallax |
| "doesn't feel like the product" | palette flip or stock metaphor | CSS custom properties; re-dress in product palette |
| "can't tell what changed" | proof is a verdict, gauge or checkmark | make the object itself change state; carry the changed item forward |
| "show there are many more" | enumeration | windowed list + dashed ghosts + mask; dotted spine; live count |
| "more technicality / depth" | one language layer | mono line under the caption; one real rule, unit or threshold |
| "make it premium" | polish requested, scope needed | add planned beats (scale, depth, samples, camera), each with camera + sound |
| "too fast / can't read it" | landings not held | hold result frames 1.5–2.5 s; keep only the handoffs fast |
| "too busy" | more than one focal point | delete competing elements; one object carries the shot |
| "this number feels fake / it's wrong" | invented data | one true example + computed counts + the real output row |
| ghosting / double image | merge overlap window | land inset, shorten the fade, re-check the dock still |
| dead / empty frame | container emptied by its own action | keep the canonical element; overlap the traveller's fade-in |
| a label outlives its state | no end fade | tie every label's opacity to its state window |
| "cut N seconds" | landings held too long | shorten landings and caption dwell, never the handoffs |

## Success patterns to preserve

These survived review and re-cuts; keep them unless a rule says otherwise:

- **The absorb merge** — traveller moves in, lands inset, fades; survivor
  rings and squashes; the source chip lands on the survivor.
- **The caption arc** — up to three quick cards (problem → evidence →
  question) on one slot, words sliding in from below and leaving upward,
  then the answer card holds.
- **Evidence highlighted in place** — green on the tokens themselves; no
  connector lines in empty space.
- **The count as narrative** — the number drops at the moment the cause
  happens, and flashes.
- **The mono technical line** — one per caption, real values only.
- **Event-locked sound** — a whoosh into a dock plus bass at the merge, a
  confirm on the completed state, a write tick on the output. Muted pass
  first.
- **Camera drift + parallax** — content moves more than background.
- **Deterministic render(t) + `?t=` deep links** — retakes and reviews stay
  cheap; stills are the review medium.

## Re-cut recipes

- **Premium:** run the six-item premium pass in `beat-script.md`; every added
  beat gets its camera move and sound event; re-verify all stills.
- **More energy:** shorten handoffs (250–400 ms) and add a camera move; do
  not add elements.
- **Calmer:** lengthen landings, reduce camera amplitudes, keep one accent.
- **Shorter:** trim landings and caption dwell; drop a beat only when its
  realization duplicates another's.
- **New example, same story:** swap the true group, recompute counts, update
  the output row, keep the beat structure.
- **Rebrand:** change CSS custom properties and the surface styling only —
  never the beats.
