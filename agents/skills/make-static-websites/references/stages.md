# Stage formulas (detailed)

Each stage is a **closed agent**. Inputs only from prior artifacts + `job.md`.

## Shared verify footer

Every stage ends with:

```markdown
## Verify
- [ ] ...
## Handoff
Stage SX complete. Waiting for GO → SY (<agent>).
```

---

## S1 opportunity

### Mission

Decide **what** to build and **why**. Play **two fields** (can pick one winner, but always scan both):

| Field | What “good” looks like | Notes |
|-------|------------------------|--------|
| **A · Cool / unique** | Small but delightful; trend or sharp usability twist; people say “wait that’s clever” | Need not be big |
| **B · Max utility / niche** | High pain, **thin or no good free tool**, clear repeat use | Prefer low SERP competition |

**Placement why** (domain fit) and **ROI why** still required for the winner.

### Research method (social-first — mandatory)

Do **not** start from “what calculator already ranks.” Start from **human friction**:

1. **Mine wishes & pain** (agent-reach / Reddit / X / HN / V2EX / indboards as available):  
   queries like `I wish there was`, `why isn't there a`, `so annoying that I have to`, `does anyone know a simple tool`, `SomebodyMakeThis`, Ask HN pain.  
2. Cluster into **jobs**: “I need to X without Y.”  
3. For each cluster score: frequency · intensity · can it be a **single-page client tool** · niche lock (cityexpenses vs nitingoyal).  
4. **Only then** SERP-check the top 1–2: if giants dominate with good UX → drop or find a sharper angle.  
5. Prefer **no/weak competition** over crowded “me too” tools (json formatter, generic salary calc, etc.).  
6. CTC path check only if money/city niche.

### Procedure (compressed)

1. Social pain scan (both fields A + B).  
2. Shortlist 3–5 → pick 1 winner.  
3. Light competitor pass on winner only.  
4. Placement + ROI + go/no-go.

### Forbidden

Coding, mockups; starting from saturated tool keywords with no pain evidence; multi-page products as default.

---

## S2 product-spec

### Mission

From **user perspective**: MVP, routes, layout IA, repo folder structure, content.

### Procedure

1. List user jobs and success moments.  
2. Cut to MVP (ship-now vs later).  
3. MPA route table: path, intent, primary keyword, components needed.  
4. Propose `src/` tree.  
5. Content inventory (headings, FAQs from S1).  
6. Acceptance criteria bullets (testable).

### Forbidden

Visual styling decisions beyond layout names; implementation.

---

## S3 design

### Mission

Production-usable mockups from **Open Design design files**, not freehand Astro.

### Procedure

1. Brief from S2 → `03-design/brief.md`.  
2. **Default:** read OD repo templates + design-systems + craft (absolute paths in `open-design.md`); write HTML mockups + copy DESIGN.md/tokens into job `03-design/`.  
3. Optional: `od` CLI/MCP or user Studio export into same folder.  
4. `design-notes.md` + `source.json` (template id + system id).

### Forbidden

Implementing the Astro site; ignoring OD template/system files; empty mockups folder.

---

## S4 scaffold

### Mission

Empty correct Astro+Tailwind **MPA** shell only.

### Procedure

1. Create dir from `project_name` / placement path.  
2. Run create astro minimal + tailwind.  
3. Ensure `output: 'static'`.  
4. Smoke build.

### Forbidden

Adding marketing sections, tools, legal pages (those are later stages).

---

## S5 ui-build

### Mission

Pixels matching mockups: layout, components, responsive, dark mode.

### Procedure

1. Global Layout + nav/footer shells (footer legal links may be placeholders until S7).  
2. Page shells per routes.  
3. Dark: `prefers-color-scheme` + toggle persisted.  
4. Tailwind only (utility-first).

### Forbidden

Deep calculator/tool algorithms (S6); JSON-LD/ads (S7–S8).

---

## S6 feature-build

### Mission

Core interactive/value features; close S1 gaps.

### Procedure

1. Implement MVP features only.  
2. Client islands only where needed; prefer MPA forms/pages.  
3. Match acceptance criteria.

### Forbidden

SEO dump, new routes not in S2 without job.md amendment + GO.

---

## S7 seo-legal

### Mission

Crawl/compliance surface for launch + AdSense footer requirements.

### Required routes

- `/privacy-policy`
- `/terms-and-conditions`
- `/about`
- `/contact`
- custom `404`

### Required files

- sitemap, robots, favicon.svg  
- head: title, description, canonical per page  
- homepage FAQ JSON-LD if FAQs exist  

Footer must show visible links to all legal pages.

---

## S8 scripts-ads

### Mission

Third-party tags + ads.txt only; **secrets pattern**.

- Source uses PLACEHOLDER defaults via `import.meta.env.PUBLIC_*`  
- Real values only in gitignored `.secrets`, loaded at build/deploy (see `secrets.md`)  
- GA measurement + AdSense client; AdSense only if placement allows and enabled  
- `public/ads.txt` stub when adsense planned  
- Ensure `.gitignore` includes `.secrets`

---

## S9 ui-audit

Read-only. Checklist: contrast, focus, tap targets, overflow at 320/375/768, dark mode regressions, mockup drift, broken UI states.

Output: severity S0–S3 list. **No edits.**

---

## S10 logic-audit

Read-only. Checklist: wrong calculations, empty states, validation, dead CTAs, SEO route mismatches vs S2, missing acceptance criteria.

**No edits.**

---

## S11 fix

Only issues in S9+S10 reports. Group commits/changelog. Re-build.

---

## S12 deploy

1. `_headers` noindex on pages.dev hosts.  
2. Build + wrangler pages deploy.  
3. Record URL.  
4. `human_domain_status: not_connected`.  
5. Print DNS cheat sheet for user (subdomain CNAME to pages.dev per CF docs).

**Never** mark custom domain connected without user confirmation.
