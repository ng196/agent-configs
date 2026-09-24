---
name: implement
description: "Implement a piece of work based on a spec or set of tickets."
disable-model-invocation: true
---

Implement the work described by the user in the spec or tickets.

Use /tdd where possible, at pre-agreed seams.

Run typechecking regularly, single test files regularly, and the full test suite once at the end.

Once done, use /code-review to review the work.

Work in thin **vertical slices**: each slice cuts a narrow but complete path, leaves the tree buildable, and is verifiable on its own. After each code-changing slice run the narrowest relevant check; run the full suite once at the end. Do not re-run an unchanged verification command. Commit only when explicitly asked or when the repo's workflow requires it — otherwise stop and ask.
