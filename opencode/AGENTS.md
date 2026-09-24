# Global OpenCode instructions

Ponytail is always on for every repo (`@dietrichgebert/ponytail`, `defaultMode: full`). Do not add per-repo copies. Off only if the user says `stop ponytail` / `normal mode`.

> Task Observer (https://github.com/rebelytics/one-skill-to-rule-them-all) — Eoghan Henn / rebelytics.com, CC BY 4.0.

Before the first tool call of any session — and before writing or proposing a plan, not merely before executing one — invoke the `task-observer` skill AND execute its Session Start Protocol (storage check, frontmatter scan, review trigger). Loading the skill and running the protocol are separate steps; a session that loads the file and stops has activated nothing. Any turn that will involve a tool call counts; do not classify the session as "too simple" from its opening message.

After completing each task, check the observation records written this session and report a one-line summary (ids and titles, or "none logged and why"). This is the activation backstop: it forces a look at the log, so a session that silently skipped the protocol is discovered at the first task boundary instead of never.

Loading a skill is not complete until you have queried the observation log for OPEN observations naming it and read their bodies:

```
grep -l "skill:.*<skill-name>" C:/Users/nitin/.task-observer/skill-observations/observation-log/*.md
```

Apply their insights to the current work, even if the skill file hasn't been updated yet. Run this at every skill load, however many skills load in one session.

The task-observer workspace for this machine is:

`C:/Users/nitin/.task-observer`

Every path the skill uses derives from that root and nothing else:

- `C:/Users/nitin/.task-observer/skill-observations/observation-log/`
- `C:/Users/nitin/.task-observer/skill-observations/cross-cutting-principles.md`
- `C:/Users/nitin/.task-observer/skill-updates/`
- `C:/Users/nitin/.task-observer/skill-updates/PENDING.md`

Never resolve any of them from the current working directory. Never place the workspace inside a skills-discovery directory.
