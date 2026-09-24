---
name: make-static-websites
description: >-
  Multi-agent factory workflow to research, design (Open Design only — no hand
  mockups), scaffold Astro+Tailwind MPA static sites, implement UI/features,
  SEO/AdSense compliance, audit, fix, and Wrangler-deploy. Use when user says
  make static website(s), static-site-maker, ship a tool site, run factory
  pipeline, opportunity research, or enqueue a site job. One agent per stage;
  hard GO gate before every next stage. Domains: cityexpenses.com (CTC niche
  only) and nitingoyal.app.
version: 1.1.0
license: Apache-2.0
compatibility: >-
  Astro static MPA, Tailwind, Cloudflare Wrangler Pages, GitHub, MCP
  (agent-reach). Open Design via local design-templates/design-systems
  files or od CLI/MCP. Human connects custom domain/subdomain after deploy.
  Main session = orchestrator only; each stage = new sub-agent context.
metadata:
  project: static-site-maker
  owner: nitin
  domains: cityexpenses.com, nitingoyal.app
  root: C:\Users\nitin\OneDrive\Documents\GitHub\Obsidian-Vault\static-site-maker
  ctc_path: C:\Users\nitin\OneDrive\Documents\GitHub\sites\ctc
  open_design_local: C:\Users\nitin\OneDrive\Documents\GitHub\open-design-main
  secrets_example: C:\Users\nitin\OneDrive\Documents\GitHub\Obsidian-Vault\static-site-maker\secrets\.secrets.example
  skill_install: C:\Users\nitin\.agents\skills\make-static-websites
---

# Make Static Websites

Portable **skill** for the static-site-maker factory. Import this folder into any agent host (OpenCode, Claude Code, Cursor, etc.).

**Product reminder:** this skill runs the **system** that ships sites. Sites are outputs. Prefer unattended work inside a stage; **never** cross stages without **GO**.

## YOU ARE THE ORCHESTRATOR (main session)

Full law: [`references/orchestrator.md`](references/orchestrator.md).

| Role | Who | Does |
|------|-----|------|
| **Orchestrator** | This chat / main agent | Job folders, GO gates, **verify on disk**, spawn sub-agents, tiny micro-edits only |
| **Stage agent** | **New sub-agent, new context, one stage** | All real research/design/code/deploy work |

**Rules:**

1. **Do not perform S1–S12 yourself** in the orchestrator session.
2. On every stage: **Task / sub-agent** with a full brief (absolute paths, inputs, outputs, verify, forbidden).
3. After sub-agent returns: orchestrator **only verifies** artifacts (read files / tiny commands). Re-spawn same stage if fail.
4. **Exception:** micro-work ≤ ~2 lines or pure status — see orchestrator.md. Never “just finish the stage.”
5. **Disk is memory** between stages. Sub-agents do not share chat history.
6. **One stage per sub-agent.** Never bundle S1+S2.

## When to use

- User wants a new static/tool/content site end-to-end
- User says `make static websites`, `static-site-maker`, `run factory`, `next stage`, or `GO`
- Opportunity / keyword / competitor research for a shippable web property

## When not to use

- Editing CTC core calculator engine without a factory job
- Non-web projects
- Skipping research to “just code a landing page” unless user explicitly bypasses with `GO skip-to:<stage>`

---

## Global laws (all agents)

1. **One agent = one responsibility.** Do not implement, design, or deploy outside your stage table row.
2. **GO gate.** After your stage: write artifacts → run **Verify** checklist → stop and ask:  
   `Stage <N> complete. Artifacts: …. Reply GO to run <next agent>.`  
   Proceed only on explicit `GO` / `GO <stage-id>` / `GO skip-to:<stage-id>`.
3. **Verify before handoff.** If any verify item fails, fix within your stage or escalate — do not soft-pass.
4. **MPA only.** Astro multi-page. **SPA architecture prohibited.**
5. **No freehand final mockups.** S3 must ground in Open Design **repo design files** (templates + design-systems + craft) at `open_design_local`, or `od`/MCP, or user Studio export. See [`references/open-design.md`](references/open-design.md).
6. **Domain match (hard):** absolute CTC path `C:\Users\nitin\OneDrive\Documents\GitHub\sites\ctc`. cityexpenses = that niche only; nitingoyal.app = broader. AdSense = apex/www only.
7. **Deploy boundary:** Wrangler → `*.pages.dev` → `awaiting_domain_by_human`. User connects DNS.
8. **Secrets:** placeholders in git; real IDs in **`.secrets`** (gitignored); **embed at build + deploy**. See [`references/secrets.md`](references/secrets.md). Template: `C:\Users\nitin\OneDrive\Documents\GitHub\Obsidian-Vault\static-site-maker\secrets\.secrets.example`
9. **Stack defaults:** Astro static + MDX (as needed) + Tailwind + Wrangler Pages.
10. **Research online:** **agent-reach** when available.
11. **Absolute paths only** in job.md, briefs, and artifacts (no “the ctc folder” without full path).

### Placement decision (every job must pick one)

| Mode | When | Where code lives |
|------|------|------------------|
| `ctc-page` | Complements cityexpenses / CTC | PR into `sites/ctc` (new routes/pages) |
| `ctc-subdomain` | Same niche, separate small property | New `ssm-site-*` repo; human maps `*.cityexpenses.com` |
| `ng-subdomain` | Cool / high-ROI / brand experiment | New `ssm-site-*`; human maps `*.nitingoyal.app` |
| `pages-dev-only` | Preview / no custom domain yet | Deploy only; noindex on `*.pages.dev` |
| `apex-adsense` | Monetize with AdSense | Apex/www only on owned domain — rare; needs explicit GO |

---

## Commands (invoke)

| User says | Action |
|-----------|--------|
| `make static websites` / `factory start <seed>` | Create job folder → run **S1 opportunity** only |
| `GO` | Run next stage in sequence |
| `GO <stage-id>` | Run that stage if prior artifacts exist |
| `GO skip-to:<stage-id>` | Skip forward only if user accepts risk; note skips in `job.md` |
| `factory status` | Print job stage, artifacts, last verify |
| `factory abort` | Mark job aborted; no further stages |

---

## Job folder formula

For each job create:

```text
C:\Users\nitin\OneDrive\Documents\GitHub\Obsidian-Vault\static-site-maker\jobs\<job_id>\
  job.md
  01-opportunity\ … 12-deploy\
```

`job.md` frontmatter template:

```yaml
id: job_YYYYMMDD_<slug>
seed: "<keyword or idea>"
stage: s1_opportunity   # current
status: running | waiting_go | blocked | live_awaiting_domain | done | aborted
placement: ctc-page | ctc-subdomain | ng-subdomain | pages-dev-only | apex-adsense
domain_intent: cityexpenses.com | nitingoyal.app | pages.dev
adsense: false
secrets_file: ""           # absolute path to site or factory .secrets
project_name: ssm-<slug>
site_repo: ""              # absolute path
pages_url: ""
human_domain_status: not_connected
orchestrator_micro: []
```

---

## Pipeline (strict order)

```text
S1 opportunity → GO →
S2 product-spec → GO →
S3 design → GO →
S4 scaffold → GO →
S5 ui-build → GO →
S6 feature-build → GO →
S7 seo-legal → GO →
S8 scripts-ads → GO →
S9 ui-audit → GO →
S10 logic-audit → GO →
S11 fix → GO →
S12 deploy → STOP (human domain)
```

| Ref | Path |
|-----|------|
| Orchestrator | [`references/orchestrator.md`](references/orchestrator.md) |
| Stages | [`references/stages.md`](references/stages.md) |
| Domains/CTC | [`references/domains.md`](references/domains.md) |
| Artifacts | [`references/artifacts.md`](references/artifacts.md) |
| Open Design | [`references/open-design.md`](references/open-design.md) |
| Secrets | [`references/secrets.md`](references/secrets.md) |
| Video map | [`references/video-mapping.md`](references/video-mapping.md) |

---

## Stage index (one agent each)

| ID | Agent name | Single job | Must NOT do |
|----|------------|------------|-------------|
| **S1** | `opportunity` | Answer **what** to make and **why** (placement fit + ROI). Competitor top-5, PAA, gaps. | Spec UI, code, design |
| **S2** | `product-spec` | User-perspective MVP, page list, layout wire IA, folder structure, content inventory | Code, visual design, deploy |
| **S3** | `design` | Mockups from OD **design-templates + design-systems + craft** files (or od CLI); write `03-design/` | Skip OD files; implement Astro site |
| **S4** | `scaffold` | `npm create astro@latest` minimal + `astro add tailwind`; MPA config only | Features, copy, SEO pages |
| **S5** | `ui-build` | Astro components/pages from mockups; responsive Tailwind; dark mode | Business logic depth, SEO legal dump, deploy |
| **S6** | `feature-build` | Core tool/feature behavior to beat competitor gaps | Restyling whole site, AdSense |
| **S7** | `seo-legal` | Meta, canonical, FAQ JSON-LD, legal pages, footer links, 404, sitemap, robots, favicon | Tool logic, ads scripts |
| **S8** | `scripts-ads` | GA + AdSense via placeholders + `.secrets` load at build; `ads.txt` | Real secrets in git; layout redesign |
| **S9** | `ui-audit` | UI-only audit report (a11y, responsive, dark mode, visual bugs) | Fix code (report only) |
| **S10** | `logic-audit` | Logic/QA report (tool correctness, edge cases, broken flows) | Fix code (report only) |
| **S11** | `fix` | Implement fixes from S9+S10 (and only those) | New features |
| **S12** | `deploy` | `public/_headers` noindex for pages.dev; build; `wrangler pages deploy`; mark `awaiting_domain_by_human` | Cloudflare DNS/custom domain attach |

---

## Orchestrator behavior (main session only)

```
on factory start <seed>:
  read C:\Users\nitin\OneDrive\Documents\GitHub\Obsidian-Vault\static-site-maker\CONTEXT.md
  create jobs\<id>\ tree + job.md
  SPAWN sub-agent S1 (new context)  ← do not do S1 yourself
  VERIFY artifacts on disk
  status=waiting_go → stop → ask GO

on GO:
  advance stage in job.md
  SPAWN sub-agent for that stage only (new context)
  VERIFY on disk
  waiting_go or blocked → stop

on factory status:
  read job.md + list artifact files (orchestrator OK)
```

`GO autopilot`: still **one sub-agent per stage**, sequential; halt on blocked. Never one mega-agent for all stages.

---

## S1–S12 quick cards

### S1 · opportunity

**In:** seed keyword/idea.  
**Out:** `01-opportunity/report.md` with:

1. **What** — one-sentence product + primary keyword + secondary/PAA list  
2. **Why-A Placement** — `ctc-page` | `ctc-subdomain` | `ng-subdomain` | … with evidence (read CTC README/routes if city niche)  
3. **Why-B ROI** — demand, competition weakness, build effort, monetization path (AdSense only if apex plan)  
4. Top 5 SERP competitors: URL, features, UI notes, gaps (dark mode, mobile, config, trust)  
5. Go / no-go recommendation  

**Verify:** both WHYs answered; placement matches domain rules; ≥5 competitors or explicit SERP scarcity note; sources listed.  
**Next:** S2

### S2 · product-spec

**In:** S1 report.  
**Out:** `02-product-spec/spec.md` — personas, jobs-to-be-done, **MVP only**, full page list (MPA routes), per-page purpose, folder structure proposal, content outline, out-of-scope.  
**Verify:** every MVP story maps to a route; no SPA; folder tree listed; acceptance criteria testable.  
**Next:** S3

### S3 · design

**In:** S2 spec.  
**Out:** `03-design\mockups\*.html`, `DESIGN.md`, `tokens` if any, `design-notes.md`, `source.json`.  
**Method (default):** read OD repo files under  
`C:\Users\nitin\OneDrive\Documents\GitHub\open-design-main\design-templates\` + `design-systems\` + `craft\`  
→ produce HTML mockups into job `03-design` (see open-design.md). Optional: `od` CLI/MCP or user Studio.  
**Verify:** mockups exist on disk; `source.json` names real template+system ids; DESIGN notes present.  
**Next:** S4

### S4 · scaffold

**In:** placement + project_name.  
**Commands (adapt path):**

```bash
npm create astro@latest <dir> -- --template minimal --install --yes
cd <dir> && npx astro add tailwind --yes
```

Force static MPA (`output: 'static'`). No view-transitions SPA pattern as primary IA.  
**Out:** repo path, `04-scaffold/notes.md`.  
**Verify:** `npm run build` green; Tailwind works; multiple `src/pages` ready.  
**Next:** S5

### S5 · ui-build

Implement layout/components/pages per mockups + Tailwind responsive + system-aware **and** toggle dark mode.  
**Verify:** key routes render; 320–768 widths sane; dark toggle works; no tool business logic beyond UI shells if S6 owns logic.  
**Next:** S6

### S6 · feature-build

Implement core tool/features from gap analysis; outperform competitors on stated gaps.  
**Verify:** acceptance criteria from S2 pass manually or scripted; edge cases listed.  
**Next:** S7

### S7 · seo-legal

Meta title/description/canonical all pages; FAQ JSON-LD on home; pages `/privacy-policy`, `/terms-and-conditions`, `/about`, `/contact`; footer links to all legal (AdSense hard req); `404.astro`; `sitemap.xml`; `robots.txt`; `favicon.svg`.  
**Verify:** curl/build contains meta; footer links resolve; robots points to sitemap.  
**Next:** S8

### S8 · scripts-ads

Wire `import.meta.env.PUBLIC_GA_MEASUREMENT_ID` / `PUBLIC_ADSENSE_*` with **PLACEHOLDER** defaults. Ensure site `.gitignore` has `.secrets`. Document build loads `.secrets` (see secrets.md). `public/ads.txt` stub when adsense planned.  
**Verify:** no real pub ids in tracked files; placeholders work; build script or notes for secrets embed.  
**Next:** S9

### S9 · ui-audit

**Report only** → `09-ui-audit/report.md` (severity-tagged issues).  
**Verify:** report has pass/fail summary; no code edits.  
**Next:** S10

### S10 · logic-audit

**Report only** → `10-logic-audit/report.md`.  
**Verify:** report only; no code edits.  
**Next:** S11

### S11 · fix

Fix S9+S10 items only; note `11-fix/changelog.md`.  
**Verify:** re-check closed issues; build green.  
**Next:** S12

### S12 · deploy

1. `public/_headers` — noindex for `*.pages.dev`.  
2. Load `.secrets` into env (if present) → `npm run build`.  
3. `npx wrangler pages deploy dist --project-name <TARGET_PROJECT_NAME>`.  
4. `status: live_awaiting_domain`, `human_domain_status: not_connected`.  
5. Suggest hostname — **human** connects DNS.  

**Verify:** live URL 200; secrets not echoed; no false custom-domain claim.  
**Next:** human DNS

---

## Autopilot (optional)

Only if user: `GO autopilot`. Still write every stage artifact + verify log. Halt autopilot on `blocked` or domain-rule conflict.

---

## Clarifications to ask if missing

- Seed keyword / idea (none required until first job)  
- Placement if S1 ambiguous  
- Real IDs only when user fills `.secrets` (default placeholders)  

---

## Portable install

Canonical copies (keep in sync):

- `C:\Users\nitin\OneDrive\Documents\GitHub\Obsidian-Vault\static-site-maker\skills\make-static-websites\`
- `C:\Users\nitin\.agents\skills\make-static-websites\`

Also valid: project `.agents/skills\`, `.claude\skills\`. Keep `references\` beside `SKILL.md`.
