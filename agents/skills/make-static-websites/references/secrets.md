# Secrets — placeholders, embed at build/deploy

## Policy

- **Never** commit real GA / AdSense / API tokens.
- Sites ship with **placeholder** IDs in source.
- Real values live in a **`.secrets`** file (gitignored), injected at **build** and **deploy** time.

## Files (absolute roots)

| File | Purpose |
|------|---------|
| `C:\Users\nitin\OneDrive\Documents\GitHub\Obsidian-Vault\static-site-maker\secrets\.secrets.example` | Committed template |
| `C:\Users\nitin\OneDrive\Documents\GitHub\Obsidian-Vault\static-site-maker\secrets\.secrets` | Optional factory-level defaults (gitignored) |
| `<site-repo>\.secrets` | Per-site overrides (gitignored) |
| `<site-repo>\.gitignore` | Must include `.secrets` |

## `.secrets` format (dotenv)

```bash
# Google Analytics (Measurement ID)
PUBLIC_GA_MEASUREMENT_ID=G-XXXXXXXXXX

# Google AdSense
PUBLIC_ADSENSE_CLIENT=ca-pub-XXXXXXXXXXXXXXXX
PUBLIC_ADSENSE_ENABLED=false

# Cloudflare (deploy agent / CI)
CLOUDFLARE_API_TOKEN=
CLOUDFLARE_ACCOUNT_ID=
```

Placeholders in repo source / example:

```bash
PUBLIC_GA_MEASUREMENT_ID=G-PLACEHOLDER
PUBLIC_ADSENSE_CLIENT=ca-pub-PLACEHOLDER
PUBLIC_ADSENSE_ENABLED=false
```

## Embed at build time

Astro/Vite: load env before `astro build`.

**S8 agent** implements pattern (conceptually):

1. Scripts reference `import.meta.env.PUBLIC_GA_MEASUREMENT_ID` only.
2. Build wrapper (npm script `build:release`):

```bash
# PowerShell example — deploy/build sub-agent runs this
# Load .secrets into env then build
Get-Content .secrets | ForEach-Object {
  if ($_ -match '^\s*#' -or $_ -match '^\s*$') { return }
  $k,$v = $_ -split '=',2
  Set-Item -Path "Env:$k" -Value $v
}
npm run build
```

3. If `.secrets` missing → build with placeholders; ads/GA no-op or stub comments when ID contains `PLACEHOLDER`.

## Embed at deploy time

S12 deploy sub-agent:

1. Load `<site>\.secrets` or factory `secrets\.secrets`.
2. `npm run build` (with env).
3. `npx wrangler pages deploy dist --project-name <name>`  
   (Wrangler token from env `CLOUDFLARE_API_TOKEN`, not from git).

## AdSense gate

- `PUBLIC_ADSENSE_ENABLED=true` only when placement is apex-capable and user set real client id.
- Subdomain / pages.dev jobs: keep `false`; still generate `ads.txt` only if enabled.

## Orchestrator

Never print full `.secrets` contents into chat logs. Sub-agents may read the file locally; summaries say “loaded” / “using placeholders” only.
