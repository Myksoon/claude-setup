# Claude Setup — migration kit

Snapshot of my Claude (desktop app + claude.ai account) setup, so a new laptop can be brought to the same state.

- **Snapshot date:** 2026-11-06
- **Source machine:** `hxkawindows` — Windows 11 x64, Claude Desktop 4.23118.0
- **Account:** claude.ai (personal)

## What's in here

| Path | What it covers |
|---|---|
| `setup.json` | Machine-readable inventory of everything below |
| `inventory/skills.md` | Skills on the account and their on/off state |
| `inventory/plugins-and-mods.md` | Plugins (e.g. Design) and mods |
| `inventory/mcp-and-connectors.md` | Local MCP servers, cloud connectors, browsers, computer use |
| `inventory/settings.md` | Account/app settings worth re-applying (memory, browser, network…) |
| `config/claude_desktop_config.template.json` | Template for the local MCP server config |
| `scripts/backup-config.ps1` | Run on the **old** laptop: copies the real MCP config into `config/` |
| `scripts/restore-config.ps1` | Run on the **new** laptop: installs the config into Claude |

## Migrating to the new laptop

1. **Install Claude Desktop** and sign in with the same account.
   Everything account-level (skills, plugins, connectors, memory, preferences) syncs automatically —
   use the inventory files only to *check* that it all came across.
2. **Install the apps the local MCP servers talk to:** Blender and Roblox Studio
   (see `inventory/mcp-and-connectors.md`), plus their MCP add-ons/plugins.
3. **Copy the MCP config:**
   - On the old laptop: `powershell -ExecutionPolicy Bypass -File scripts\backup-config.ps1`, then commit `config/claude_desktop_config.json`
     (check it for API keys/tokens first — see "Secrets" below).
   - On the new laptop: `git clone https://github.com/Myksoon/claude-setup.git`, then
     `powershell -ExecutionPolicy Bypass -File scripts\restore-config.ps1`, and restart Claude.
   - Fix any absolute paths in the config (e.g. `C:\Users\<old-user>\...`) to match the new machine.
4. **Re-enable per-device things** that don't sync: Claude in Chrome extension, computer-use app grants,
   built-in browser sign-ins, connected folders.
5. Walk through `inventory/settings.md` and tick each item.

## Secrets

Never commit API keys. If `claude_desktop_config.json` has `env` values with tokens, replace them with
`"<SET-ME>"` before committing, and keep the real values in a password manager.
`.gitignore` already blocks `*.local.json` and `.env` files.
