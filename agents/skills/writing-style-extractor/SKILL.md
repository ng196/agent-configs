---
name: writing-style-extractor
description: Extracts a structured "style DNA" profile from written content and turns it into a reusable guide for writing in that voice. Use whenever the user wants to write "in the style of" someone or something, asks to analyze, extract, capture, clone, or mimic a writing style, tone, or voice, wants Claude to match the feel of a document, book, novel, blog, author, or their own past writing, or wants a portable style profile built from reference material. Accepts three kinds of input — pasted or uploaded content, a linked resource (URL), or a named book/author/work to research online — and works with any subset of them, not all three at once. Also accepts explicit exclusions (sources or traits to ignore) and bad examples (patterns to actively avoid). Trigger this any time the user mentions matching, replicating, or extracting a "voice," "tone," or "style" from something, even if they don't say the word "skill" or "style profile."
---

# Writing Style Extractor

Turns writing samples into a structured, reusable style profile that Claude can apply on later writing tasks. Works from any combination of three input types, plus optional negative examples.

## Step 1 — Gather inputs

Ask only for what's missing. The user may supply just one of these, or several combined:

- **Direct content** — pasted text, or an uploaded file.
- **Resource link(s)** — a URL to fetch and read (blog post, Webnovel/AO3 chapter, article, etc.). Use `web_fetch`.
- **Named work** — a specific book, novel, story, or author to research online rather than being given text directly. Use `web_search` + `web_fetch`.

Also ask if they want to supply, since these sharpen the profile a lot:

- **Exclusions** — sources, chapters, eras of an author's work, or specific traits to explicitly leave out of the analysis.
- **Bad examples** — passages or traits to treat as anti-patterns. These get written into the profile as an explicit "avoid" list, not folded into the "do" list.

Don't require all of these — proceed with whatever subset is given.

## Step 2 — Gather source material responsibly

This step has hard limits, not guidelines:

- For a **named book/author**, search for and read reviews, craft essays, interviews, and style analyses about the work — never pirated full-text sources, scanned book archives, or fan-upload sites. If you can't find enough reliable secondary material, say so and ask the user to paste a few excerpts instead of guessing.
- **Never quote more than 15 words verbatim from any single source, and never more than one quote per source.** Describe patterns in your own words — that's the actual deliverable here, not the source text.
- **Never reproduce or closely paraphrase whole passages, scenes, or chapters.** A style profile describes the style; it does not recreate the content. If you catch yourself mirroring the source's actual sentences, stop and rewrite as analysis instead.
- User-provided direct content (their own writing, or text they pasted themselves) isn't subject to the quoting limit in the same way — you can reference it more freely since analyzing your own material for your own use isn't the concern quoting limits exist for. Still keep any illustrative fragments short in the final profile; the profile should be a description, not a transcript.

## Step 3 — Analyze across dimensions

Read `references/analysis-framework.md` for the full rubric with examples before writing the profile. In brief, cover:

1. Sentence architecture — length, rhythm, complexity, fragment use
2. Vocabulary & diction — register, specificity, recurring word choices
3. POV, tense, and narrative distance
4. Dialogue conventions — tags, punctuation, rhythm, interruption style
5. Pacing & structure — how scenes/paragraphs open and close, transitions
6. Imagery & figurative language patterns
7. Tone & emotional register
8. Punctuation and formatting quirks (em dashes, fragments, paragraph length, etc.)

For each dimension, write 1–3 sentences describing the pattern. Use at most one short illustrative fragment (well under 15 words) if it genuinely clarifies something — paraphrase first, quote only as a last resort.

## Step 4 — Apply exclusions and bad examples

- If exclusions were given, filter that material out before analyzing, or note in the profile that certain sources were deliberately left out and why.
- If bad examples were given, build an explicit **Avoid** section describing those patterns in contrast to the **Do** section — this is often the most useful part of the profile, since "sounds like X but not like Y" is more actionable than "sounds like X" alone.

## Step 5 — Produce the style profile

Write a single markdown file with:

- **Summary** — 2–3 sentences capturing the gist of the voice
- **Do** — the 8 dimensions above, described concretely
- **Avoid** — anti-patterns from bad examples/exclusions, plus generic AI-writing tics worth flagging if they clash with this voice (e.g. hedging qualifiers, "in conclusion," uniform sentence length) — only include ones that actually conflict with the extracted style
- **Quick checklist** — 5–8 short bullet reminders for applying the style while actually writing

Save it as `<slug>-style-profile.md` (e.g. `my-webnovel-style-profile.md`, `bradbury-style-profile.md`) using the file-creation tools so it persists and can be reloaded later. If the user is building a library of profiles, keep filenames source-specific so they don't collide.

## Step 6 — Offer to apply it

After the profile is ready, offer to draft something in that voice as a demonstration, or ask what they want to write next using it. Don't just hand over the file and stop — the profile is only useful once it's been tested against real output.

## Notes

- Style mimicry (structure, rhythm, diction, pacing) is different from impersonation. When the source is a real, living, named author, stay in the lane of matching craft technique — never fabricate quotes and attribute them to that person, and never reproduce their actual text. That boundary doesn't change even if the user asks for it directly.
- If the same source keeps coming up across sessions, suggest turning the profile into its own dedicated skill (via skill-creator) so it triggers automatically instead of needing to be re-loaded by hand each time.
