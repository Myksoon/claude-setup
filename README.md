# claude-setup

Instructions for **Claude Code on a new device** to reproduce this setup. If you are Claude: read this file, then follow it step by step. Ask the user the question in step 4 before touching MCP.

Scope: skills, plugins, MCP only. Do not copy credentials, history, sessions or caches.

## 1. Add marketplaces
Run (or `/plugin marketplace add <repo>`):
```
claude plugin marketplace add anthropics/claude-plugins-official
claude plugin marketplace add gamedev-skills/awesome-gamedev-agent-skills
claude plugin marketplace add forrestchang/andrej-karpathy-skills
claude plugin marketplace add latent-spaces/brag
claude plugin marketplace add DietrichGebert/ponytail
claude plugin marketplace add johnnyvizz/claude-kit
claude plugin marketplace add bayramannakov/claude-reflect
```
(`claude-plugins-official` is usually preconfigured. `karpathy-skills` is registered but has no plugin enabled.)

## 2. Install plugins (user scope)
```
claude plugin install gamedev@awesome-gamedev-agent-skills
claude plugin install mattpocock-skills@claude-plugins-official
claude plugin install superpowers@claude-plugins-official
claude plugin install brag@brag
claude plugin install ponytail@ponytail
claude plugin install savvy-flow@claude-kit
claude plugin install savvy-progress@claude-kit
claude plugin install claude-reflect@claude-reflect-marketplace
```
Versions used are in `installed_plugins.json` (pinned by `gitCommitSha`; newer is fine unless the user wants exact).

Plugin options to set in `~/.claude/settings.json` under `pluginConfigs`:
```json
"ponytail@ponytail": {"options": {"ledger": true, "sendNames": true}},
"savvy-progress@claude-kit": {"options": {"language": "auto", "autoOpen": "savvy"}}
```
Optional: copy `ponytail-statusline.ps1` to `~/.claude/` and point `statusLine` at it (Windows/PowerShell only).

## 3. Local skills (not from a marketplace)
Copy every folder in `skills/` into `~/.claude/skills/`: `antislop*`, `graphify`, `unslop`, `roblox-dev-skill`.
Merge `CLAUDE.md` into `~/.claude/CLAUDE.md` (graphify trigger; append, do not overwrite an existing file).
graphify may need its Python package; follow `skills/graphify/SKILL.md` on first use.

## 4. MCP: ASK THE USER FIRST
Ask: "Do you want the MCP setup too (Roblox Studio)?" If no, stop here.

If yes:
- **Roblox_Studio** (user scope, stdio). Requires Roblox Studio installed; it ships `mcp.bat`.
  - Windows: `claude mcp add Roblox_Studio --scope user -- cmd.exe /c "cd /d %LOCALAPPDATA%\Roblox && .\mcp.bat"`
  - Other OS: not verified; check Roblox Studio's docs for the MCP launcher path.
- claude.ai connectors (Claude Docs, Figma, Linear, Notion, Slack, Atlassian, Intercom) are account-level. They appear after signing in to the same claude.ai account and enabling them in claude.ai Settings > Connectors; each needs its own OAuth. Nothing to install.

## 5. Verify
Restart Claude Code, run `/plugin` (8 plugins enabled) and check the skills list. With MCP: `claude mcp list` shows `Roblox_Studio`.

## Files here
`settings.json` (reference; has machine-specific Coucou hook paths, do NOT copy hooks), `installed_plugins.json`, `known_marketplaces.json` (reference), `skills/`, `CLAUDE.md`, `ponytail-statusline.ps1`.
