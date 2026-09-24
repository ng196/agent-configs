# Open Design — how designs are made + what S3 consumes

**Repo (absolute):** `C:\Users\nitin\OneDrive\Documents\GitHub\open-design-main`

## Mental model

Open Design does **not** paint a Figma canvas. It:

1. Picks a **shape** = `design-templates/<id>/SKILL.md` (+ `assets/`, `references/`)
2. Picks a **brand** = `design-systems/<id>/DESIGN.md` (+ tokens)
3. Injects **craft** rules from `craft/*.md`
4. Spawns a **coding agent** that writes real files (usually **`index.html`**) into a project
5. Preview/export via daemon (`od` CLI / MCP / Studio UI)

**Design outputs we care about:** HTML mockups (+ assets), optional export PNG/PDF, and a copied `DESIGN.md` / tokens for the UI agent.

## Preferred S3 path for static-site-maker (no GUI required)

### A. File-based (default — always available)

S3 **sub-agent** works entirely from OD repo files + writes into the job folder:

```text
C:\Users\nitin\OneDrive\Documents\GitHub\Obsidian-Vault\static-site-maker\jobs\<job_id>\03-design\
  brief.md                 # from S2
  DESIGN.md                # copied/adapted from a design-system
  tokens.css               # if present in that system
  mockups\
    index.html             # primary mockup (MPA home)
    tool.html              # primary tool page if any
    mobile-notes.md        # mobile breakpoints notes
  design-notes.md          # handoff for S5
  source.json              # which template + system ids used
```

**Procedure for S3 sub-agent:**

1. Read S2 spec.  
2. Choose template under:  
   `C:\Users\nitin\OneDrive\Documents\GitHub\open-design-main\design-templates\`  
   Common picks:
   - `web-prototype` — generic multi-screen HTML
   - `saas-landing` — marketing landing
   - `dashboard` — dense tool UI
   - `mobile-app` — mobile-first  
3. Choose design system under:  
   `C:\Users\nitin\OneDrive\Documents\GitHub\open-design-main\design-systems\<brand>\`  
   Read that folder’s `DESIGN.md` (+ `tokens.css` / `design-tokens.json` if any).  
4. Read craft constraints (anti-slop, type, a11y), e.g.:  
   `C:\Users\nitin\OneDrive\Documents\GitHub\open-design-main\craft\`  
5. Follow the template’s `SKILL.md` instructions to **produce HTML mockups** in `03-design/mockups/` (this is the design stage deliverable — still **not** the Astro site).  
6. Copy/adapt `DESIGN.md` + tokens into `03-design/`.  
7. Write `design-notes.md` + `source.json`.

**Do not** skip reading real OD template/system files and freehand a purple SaaS page.

### B. Daemon / CLI (when `od` works)

```bash
cd C:\Users\nitin\OneDrive\Documents\GitHub\open-design-main
# daemon headless, then:
od project create --name "..." --skill web-prototype --design-system <id> --json
od run start --project <PID> --message "..." --follow
od files read <PID> index.html
```

Copy harvested files into `03-design/mockups/`.

MCP: `od mcp` / `od mcp install opencode` — tools `create_project`, `start_run`, `list_files`, `get_file`.

### C. User runs Studio

Orchestrator asks user to run Open Design with `03-design/brief.md`; user drops exports into `03-design/mockups/`; S3 sub-agent only validates + writes `design-notes.md`.

## Key absolute paths

```
C:\Users\nitin\OneDrive\Documents\GitHub\open-design-main\design-templates\
C:\Users\nitin\OneDrive\Documents\GitHub\open-design-main\design-systems\
C:\Users\nitin\OneDrive\Documents\GitHub\open-design-main\craft\
C:\Users\nitin\OneDrive\Documents\GitHub\open-design-main\skills\
C:\Users\nitin\OneDrive\Documents\GitHub\open-design-main\plugins\_official\
C:\Users\nitin\OneDrive\Documents\GitHub\open-design-main\docs\architecture.md
C:\Users\nitin\OneDrive\Documents\GitHub\open-design-main\design-templates\web-prototype\
```

## What S5 must consume

| From S3 | Use in Astro |
|---------|----------------|
| `mockups/*.html` | Structure, section order, component breakdown |
| `DESIGN.md` / `tokens.css` | Colors, type, radius → Tailwind theme |
| `design-notes.md` | Explicit component list + dark mode |

S5 implements Astro+Tailwind **from these files**, not from imagination.
