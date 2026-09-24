---
name: design
description: >
  Route visual work. Use when the user types /design, asks which diagram
  skill to use, or wants architecture / flowchart / sequence / data-flow
  diagrams. Also use for Lenis, smooth scroll, or scroll-snap on a long
  webpage. Not for phone-chrome mocks, short pages, or picking a TTS model.
---

# /design

Router. Load **one** child. Do not merge skill bodies.

## 1. Job

| Ask | Do |
| :--- | :--- |
| Pitch, PPT, SIH, brand, 39 types, mermaid redraw | Load `flow-chart`. Stop. |
| JSON → `archify.mjs`, theme toggle, 5 engineering types | Load `archify`. Stop. |
| Overlap (architecture / sequence / dataflow / workflow / state) | Load `flow-chart`. Stop. |
| Table or one sentence would do | Draw nothing. Stop. |

Done when exactly one of those rows ran.

## 2. Lenis — only when the page scrolls for real

**Use** when the deliverable is a long webpage with sectional scroll, snap, GSAP ScrollTrigger, or WebGL scroll sync.

**Native scroll** when it is a phone mock, one-screen UI, overflow hidden chrome, or a short page.

If using Lenis, add this and nothing else (CSS + init). Nested scrollables: `data-lenis-prevent`. Honor `prefers-reduced-motion` (default on).

```html
<link rel="stylesheet" href="https://unpkg.com/lenis@1.3.26/dist/lenis.css">
<script src="https://unpkg.com/lenis@1.3.26/dist/lenis.min.js"></script>
<script>new Lenis({ autoRaf: true, autoToggle: true, anchors: true, allowNestedScroll: true })</script>
```

Section snap → also `lenis/snap`. GSAP → `lenis.on('scroll', ScrollTrigger.update)` plus ticker `lenis.raf`. Do not npm-install Lenis for a static HTML file.

Done when Lenis is in the page **or** native scroll was chosen on purpose.

## 3. Both

Diagram first (step 1). Lenis only if step 2’s **Use** line matches. Never load `flow-chart` and `archify` together.
