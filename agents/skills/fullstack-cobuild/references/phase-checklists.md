# Phase Checklists & Question Banks

## Phase 0 — Kickoff Checklist

- [ ] One-sentence vision captured
- [ ] Primary success metric defined
- [ ] Primary user + JTBD identified
- [ ] Hard constraints listed (tech, budget, compliance, timeline)
- [ ] Greenfield / rewrite / extension confirmed
- [ ] Scope Contract approved by user

### Starter Questions
- In one sentence, what is this product and who is it for?
- How will we know it is successful six months after launch?
- What is the single most painful problem it solves?
- Are there any technologies you must use or must avoid?
- Is there an existing system this replaces or sits beside?

## Phase 1 — Requirements Checklist (per feature)

- [ ] Problem statement clear
- [ ] Happy path written as steps
- [ ] Unhappy / edge / empty / error paths listed
- [ ] Data inputs and outputs identified
- [ ] Roles and permissions sketched
- [ ] Acceptance criteria written as testable statements
- [ ] Priority (Must/Should/Could/Won't) assigned

### Grilling Questions
- Walk me through exactly what the user does, click by click.
- What happens when the data is missing / invalid / too large?
- Who is allowed to do this and who is not?
- What should the system do if the external service is down?
- How would you test that this feature works correctly?

## Phase 2 — Schema Checklist (per entity)

- [ ] All fields named with types, nullability, defaults
- [ ] Primary key and unique constraints defined
- [ ] Foreign keys and relationship cardinality clear
- [ ] Cascade / restrict / set-null behavior decided
- [ ] Soft delete or hard delete decided
- [ ] Indexes for expected query patterns listed
- [ ] Multi-tenancy / ownership model clear
- [ ] Audit fields (created_at, updated_at, created_by…) decided

### Grilling Questions
- Can two users ever share this record? How?
- What happens to child records when the parent is deleted?
- Which fields will be searched or filtered most often?
- Do we need history of changes for compliance?
- What is the expected row count after one year / five years?

## Phase 3 — UI Page Checklist (per screen)

- [ ] Purpose and entry points stated
- [ ] Layout zones described
- [ ] Every data element listed
- [ ] Every interactive control listed with behavior
- [ ] Empty / loading / error / success states specified
- [ ] Mobile / responsive notes added
- [ ] Navigation to and from other screens mapped

### Grilling Questions
- What is the first thing the user should notice on this screen?
- What happens if the list is empty?
- Which actions are primary vs secondary?
- Does this screen need to work offline or with poor connectivity?
- How does a screen-reader user experience this page?

## Phase 4 — Rules & Auth Checklist

- [ ] Auth method chosen (email/password, magic link, OAuth, SSO…)
- [ ] Session / token strategy decided
- [ ] Full role × action × resource matrix written
- [ ] Validation rules for every critical field
- [ ] Business invariants listed (things that must never be true)
- [ ] Error message philosophy agreed
- [ ] Rate limiting and abuse prevention notes
- [ ] Logging and audit requirements captured

## Phase 5 — Tech Stack Checklist

- [ ] Frontend framework and styling approach
- [ ] Backend language / framework and API style
- [ ] Database and ORM
- [ ] Auth provider / library
- [ ] Hosting and deployment target
- [ ] File storage, email, background jobs if needed
- [ ] Monorepo vs separate repos
- [ ] Any forbidden libraries or patterns

## Phase 6 — Blueprint Freeze Checklist

- [ ] All previous phases complete and approved
- [ ] Single Blueprint document produced
- [ ] Open questions reduced to zero or explicitly deferred
- [ ] User has said the equivalent of "Blueprint approved — start coding"
