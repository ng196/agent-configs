# Orchestrator law (main session)

The **main agent session is ONLY the orchestrator.** It does not “be” S1–S12.

## Must

1. On `factory start` / `GO`: spawn a **new sub-agent** (fresh context) for **exactly one** stage.
2. Pass that sub-agent a **self-contained brief**: absolute paths, stage id, input artifact paths, output paths, verify checklist, forbidden actions, domain rules summary.
3. When the sub-agent returns: **verify** artifacts on disk (read files, run tiny checks). Do not re-do the stage.
4. If verify passes → update `job.md` → `status: waiting_go` → stop and ask user for `GO` (unless `GO autopilot`).
5. If verify fails → `status: blocked` → either re-spawn **same** stage sub-agent with failure notes, or ask user. Still do not perform the stage yourself.

## Must not

- Run research, design, scaffold, UI, features, SEO, ads, audits, fixes, or deploy **in the orchestrator session**
- Chain multiple stages in one sub-agent
- “Help finish” a stage by editing site code after a sub-agent (that is doing the stage)

## Allowed micro-work (orchestrator only)

Only if **all** are true:

- ≤ ~2 lines of config/path/typo fix, **or** a single status/command print
- Not a stage deliverable (no competitor reports, no components, no deploy)
- Logged in `job.md` under `orchestrator_micro`

Examples OK: fix `job.md` stage field; `mkdir` job folders; print `factory status`.  
Examples NOT OK: write opportunity report; add Astro page; run full wrangler deploy logic beyond invoking a deploy sub-agent.

## Sub-agent spawn formula (OpenCode Task / equivalent)

```
subagent_type: general   # or explore for read-only S1/S9/S10 if policy allows
description: SSM S<N> <agent-name>
prompt: |
  You are stage agent S<N> (<name>) for static-site-maker.
  Load skill if needed: C:\Users\nitin\.agents\skills\make-static-websites\SKILL.md
  Stage formula: C:\Users\nitin\.agents\skills\make-static-websites\references\stages.md
  Job: C:\Users\nitin\OneDrive\Documents\GitHub\Obsidian-Vault\static-site-maker\jobs\<job_id>\job.md

  YOUR ONLY JOB: <one sentence>
  FORBIDDEN: any other stage work

  INPUTS (read only):
  - <absolute paths>

  OUTPUTS (you must write):
  - <absolute paths>

  VERIFY before finish (you self-check, then stop):
  - <checklist>

  ABSOLUTE PATHS:
  - CTC: C:\Users\nitin\OneDrive\Documents\GitHub\sites\ctc
  - Open Design: C:\Users\nitin\OneDrive\Documents\GitHub\open-design-main
  - Secrets template: C:\Users\nitin\OneDrive\Documents\GitHub\Obsidian-Vault\static-site-maker\secrets\.secrets.example
  - Job secrets (gitignored): <job or site>/.secrets

  Return: short summary + list of files written + verify pass/fail.
```

## Session boundary

| Session | Role |
|---------|------|
| User ↔ Orchestrator | GO gates, status, policy, micro fixes |
| Orchestrator → Sub-agent N | One stage, new context |
| Sub-agent N | Dies after stage; no memory into N+1 except files on disk |

**Disk is the memory between stages.**
