---
name: decision
description: Run a council vote when a looping or long-running agent hits a fork — continue vs stop vs ask vs narrow. Use for irreversible steps, scope changes, multi-hour work, go/no-go, strategy, pricing, launch, hire, pivot, "should we", and any choice that would waste the rest of a long run if wrong. Invoke as /decision.
license: MIT
metadata:
  version: "1.0.0"
  sources:
    - "https://github.com/harryvondiesel-web/5-persona-advisory-board"
    - "https://github.com/charlomrt-boop/claude-council-skill"
    - "https://github.com/v-khanna/claude-council"
---

# Decision

Interview only if a human is reachable and Halt fires. Otherwise state assumptions and vote. The loop continues from the verdict.

Do not impersonate named people. Seats are lenses.

## When

A fork the rest of the run depends on. User typed `/decision`. Irreversible write, scope change, security/trust, user-visible, strategy, or more than about an hour of remaining work.

Not for lookup, a typed-out implementation, or a choice already settled in `.decision/latest.md` with unchanged evidence.

Grill-me sharpens a plan. This skill votes and returns a verdict the loop can obey.

## Mode

**pulse** — default inside a loop. Seats: Ponytail, Evidence, Halt. Add Spec if a ticket/spec exists.

**board** — `/decision`, irreversible, scope change, security/trust, user-visible, strategy/pricing/launch/hire/pivot, or pulse cannot agree. Load [seats.md](seats.md). All default seats. One line each.

`--debate` only when the user asks: then spawn seats as parallel subagents. Default is in-process. A 10-hour loop cannot afford 25k tokens per fork.

## Steps

1. **Read last brief.** If `.decision/latest.md` exists, read it. Same decision + same evidence → reprint the old verdict and stop.
2. **Frame.** One sentence. Options as GO / STOP / ASK / NARROW. If a ticket exists, name it.
3. **Pick mode.** Pulse unless a board trigger above fired.
4. **Seat.** Pulse: the three (or four). Board: load `seats.md`, run every default seat. Summon Expansionist only when the live question is "too small / expand". Under `--debate`, seats vote **independently** — do not show one seat another's reasoning before it votes (anti-anchoring). Record the strongest dissent verbatim, and state after the block when dissent changed the verdict.
5. **Vote.** Each seated lens: `View / Veto? / Rec` — one line. Force at least one challenge to the preferred option. A veto is a hard no from that seat, not a preference.
6. **Verdict.** Apply the table. Done when the block below is printed and written to `.decision/latest.md`.

| Condition | Verdict |
|---|---|
| Halt vetoes and a human can answer | ASK |
| Halt vetoes and no human | STOP, state the missing human call |
| Two or more vetoes | STOP, or ASK if a human can unblock |
| Ponytail or Spec vetoes scope only | NARROW |
| Else | GO |

## Verdict block

Print this, then copy it to `.decision/latest.md`:

```
DECISION: <one sentence>
MODE: pulse|board
VERDICT: GO|STOP|ASK|NARROW
ACTION: <one next step the loop can do now>
DO_NOT: <one forbidden next step>
ASSUMPTIONS: <comma list, or none>
VETO: <seat names, or none>
```

After the block, at most five short lines: disagreement, then why. No essays.

ASK: one question, then wait. Do not keep looping.

NARROW: name the cut. The loop does only that.

GO / STOP: the loop obeys ACTION / DO_NOT without asking.
