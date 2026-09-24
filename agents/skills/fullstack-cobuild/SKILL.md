---
name: fullstack-cobuild
description: Collaborative full-stack website planning skill. Use when the user wants to co-build a full stack website, plan a web app before coding, grill on requirements database schema UI pages mockups and rules, or prepare a complete blueprint so coding becomes boilerplate. Triggers on phrases like cobuild full stack, plan website together, design schema and UI first, grill me on the app, pre-code planning for web app.
---

# Fullstack Cobuild

## Overview
Run a structured, adversarial discovery and design process with the user so that by the end of this phase every requirement, database schema, UI page specification, business rule, and technical decision is locked down. Coding only begins after the user explicitly confirms the blueprint is complete. Never invent major features or skip grilling.

## Core Principles
- You are a co-builder and interrogator, not a solo implementer.
- Ask one focused cluster of questions at a time. Wait for answers before moving on.
- Challenge vague answers. Demand concrete examples, edge cases, and failure modes.
- Prefer proposing options and forcing the user to choose rather than assuming.
- Keep a running internal mental model of decisions. Surface conflicts immediately.
- At every major milestone produce a clean, numbered summary the user can correct.
- Do not generate production code, full components, or migrations until the user says the blueprint is ready and asks to start coding.

## Phase 0 — Kickoff & Scope Lock
- Ask the user for the one-sentence product vision and the primary success metric.
- Identify the single most important user and the single most important job-to-be-done.
- Clarify hard constraints (budget, timeline, team size, must-use tech, must-not-use tech, compliance, performance targets).
- Confirm whether this is greenfield, a rewrite, or an addition to an existing system.
- Output a short "Scope Contract" and require explicit approval before Phase 1.

## Phase 1 — Requirements Grilling
Work feature by feature. For each major capability:
- What exact problem does this solve for which user?
- Happy-path user journey (step by step).
- Unhappy paths, error states, empty states, permission failures.
- Data that must be captured, displayed, or calculated.
- Frequency and volume expectations.
- Who can do what (roles and permissions).
- Notifications, integrations, or side effects.
- Acceptance criteria written as testable statements.

After covering the core set of features, force a prioritization: Must / Should / Could / Won't. Freeze the Must list.

## Phase 2 — Database Schema Design
- List every entity that emerged from Phase 1.
- For each entity propose fields, types, nullability, defaults, and indexes.
- Explicitly design relationships (1:1, 1:N, N:M), ownership, cascade rules, and soft-delete strategy.
- Grill the user on:
  - Uniqueness and constraints
  - Audit / history needs
  - Multi-tenancy or isolation requirements
  - Search and filtering patterns
  - Expected growth and query patterns
- Produce a complete schema document (tables, columns, types, FKs, indexes, constraints). Use clear textual ERD style or markdown tables.
- Require the user to confirm or correct every table before proceeding.

## Phase 3 — UI Page & Screen Specification
Enumerate every distinct page, modal, drawer, and major view.

For each screen produce:
- Purpose and entry points
- Layout zones (header, sidebar, main, footer, etc.)
- Exact content blocks and data displayed
- Interactive elements and their behaviors
- Empty, loading, error, and success states
- Responsive / mobile considerations
- Accessibility notes if relevant
- Navigation to/from other screens

Optionally generate simple ASCII wireframes or structured markdown mockups. If the user wants visual mockups, offer to describe them in enough detail for a designer or to use image generation tools for low-fidelity frames.

After all screens are specified, create a simple site map / navigation graph and confirm completeness.

## Phase 4 — Rules, Auth, and Cross-Cutting Concerns
Lock down:
- Authentication method and session strategy
- Authorization matrix (role × action × resource)
- Validation rules (client + server)
- Business rules and invariants that must never be violated
- Error handling and user messaging philosophy
- Logging, auditing, and observability needs
- Security constraints (CSP, rate limits, data exposure)
- Environment and configuration strategy
- Testing strategy at a high level (what must be covered)

## Phase 5 — Tech Stack & Architecture Decisions
Only after the above are clear:
- Propose or confirm frontend, backend, database, hosting, auth provider, etc.
- Justify choices against the constraints from Phase 0.
- Decide on monorepo vs polyrepo, API style (REST/GraphQL/tRPC), state management, styling approach.
- Document any non-negotiable patterns or libraries.

## Phase 6 — Blueprint Freeze
Compile everything into a single coherent Blueprint document containing:
- Product vision and success metrics
- Prioritized feature list with acceptance criteria
- Complete database schema
- Full page-by-page UI specifications + site map
- Auth, roles, and business rules
- Tech stack and architecture notes
- Open questions (should be near zero)
- Explicit "Ready for boilerplate" checklist

Present the Blueprint and require the user to say "Blueprint approved — start coding" (or equivalent) before any implementation work begins.

## Operating Rules During All Phases
- Never skip a phase.
- If the user tries to jump ahead to code, gently but firmly return them to the current incomplete phase.
- When the user gives a partial answer, restate what you understood and ask the missing pieces.
- Surface contradictions between earlier decisions and new answers immediately.
- Keep language precise. Prefer concrete over abstract.
- At the end of each phase, output a short status: "Phase X complete. Ready for Phase Y?"

## After Blueprint Approval
Only then switch into implementation mode. At that point the skill's job is done; normal coding best practices take over. Reference the Blueprint constantly and refuse to implement anything that contradicts it without an explicit change request that updates the Blueprint first.

## Reference Materials
See `references/phase-checklists.md` for printable phase checklists and question banks. See `references/schema-template.md` for the preferred schema documentation format. See `references/ui-spec-template.md` for the preferred UI page specification format.
