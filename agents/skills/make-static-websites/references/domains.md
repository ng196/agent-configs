# Domains & CTC

## Owned domains

| Domain | Niche lock | Typical placement |
|--------|------------|-------------------|
| `cityexpenses.com` | City expenses, CTC/salary, COL, relocation, offer comparison (India-focused money) | `ctc-page`, `ctc-subdomain`, rare `apex-adsense` |
| `nitingoyal.app` | Personal/brand/tools/experiments | `ng-subdomain`, `pages-dev-only` |

## CTC codebase

- Path: `C:\Users\nitin\OneDrive\Documents\GitHub\sites\ctc`
- Product: reverse CTC / lifestyle calculator (Astro + CF Workers hybrid)
- Factory note: pure static MPA skill defaults still apply for **new** `ssm-site-*` repos; **ctc-page** mode must follow existing CTC stack (may be hybrid) — do not downgrade CTC to static-only without GO.

Before any `cityexpenses.com` job:

1. Read `ctc/README.md`
2. List existing `src/pages` routes — avoid duplicates
3. Prefer additive pages that link into calculator funnels

## AdSense

- Approval path: **apex/www**, not subdomain-only
- Subdomain ships: OK without AdSense (`adsense: false`)
- `public/_headers`: noindex `*.pages.dev` so Google does not split index with future custom domain

## Human domain step (after S12)

Agent outputs:

```text
pages_url: https://<project>.pages.dev
suggested_host: <sub>.cityexpenses.com | <sub>.nitingoyal.app | www...
status: live_awaiting_domain
action_for_nitin: Cloudflare Pages → Custom domains → add host
```

User connects subdomain themselves.
