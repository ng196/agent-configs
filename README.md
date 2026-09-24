# agent-configs

> Personal source of truth for AI-agent harness configuration — skills, instructions, MCP servers and settings — so the setup can be reinstalled anywhere.
> (Original note: "for personal use of storing ai-agent relating skills, configs, mcps and all other related settings on GitHub".)

---

## Layout

| Path | What it is |
| :--- | :--- |
| `opencode/` | The opencode harness: `opencode.json(c)`, global `AGENTS.md`, plugin deps, and its bundled skills root |
| `opencode/skills/` | Skills that live in `~/.config/opencode/skills` (harness-bundled set) |
| `agents/skills/` | The main skill library that lives in `~/.agents/skills` |
| `install.ps1` | Applies this repo to the machine: copies config files, links the two skills roots as junctions |
| `.gitignore` | Keeps backups and secrets out of the repo |

## Install (new machine)

```powershell
git clone https://github.com/ng196/agent-configs.git
cd agent-configs
.\install.ps1 -DryRun   # preview every action
.\install.ps1           # apply (existing targets are backed up first)
```

The installer:

1. copies `opencode/AGENTS.md`, `opencode/opencode.json`, `opencode/opencode.jsonc`, `opencode/package.json`, `opencode/package-lock.json` into `~/.config/opencode/`;
2. replaces `~/.config/opencode/skills` and `~/.agents/skills` with directory junctions into this repo, so the repo is the single source of truth and the old mirror-drift problem cannot recur.

Existing real directories are renamed to `*.backup-<timestamp>` (never deleted). Restore by removing the junction and renaming the backup back.

## Secrets and machine-specific values

- `opencode.json` keeps a `${STITCH_API_KEY}` placeholder where the live config had a key. Put the real key back in the live copy after install, or supply it via environment.
- Supabase MCP URLs carry project refs (identifiers, not secrets) — keep them private anyway; this is a private repo.
- `kapture` and `open-design` MCP entries contain absolute machine paths; adjust per machine.
- Never commit `.env`, tokens, or anything produced by `*.backup-*`.

## Known follow-ups

- The live opencode config has **both** `opencode.json` and `opencode.jsonc`; opencode's precedence between them should be settled and the two merged into one file.
- `opencode.jsonc` lists `~/.claude/skills` in `skills.paths` (Claude Code is out of scope here); decide whether to drop that path.
- The config directory's own `.gitignore` ignores `package.json`/`package-lock.json`; this repo deliberately tracks them so plugins reinstall reproducibly.
