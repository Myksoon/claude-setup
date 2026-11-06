# MCP servers, connectors & device tools

## Local MCP servers (in `claude_desktop_config.json` on the laptop)

| Server | State on 2026-11-06 | Needs on the new laptop |
|---|---|---|
| **Blender** | ✅ Running (tools announced) | Blender installed + its MCP add-on enabled. Tools: run Blender Python, blend-file summaries, screenshots, viewport/thumbnail renders, API & manual docs search. |
| **Roblox_Studio** | ✅ Running (tools announced) | Roblox Studio installed + its MCP plugin. Tools: run Luau, script read/grep/search, game-tree search, insert/search assets, generate mesh/material/texture, play start/stop, console output, screen capture. |

The exact `command` / `args` / `env` for each are in `claude_desktop_config.json`, which the desktop app keeps in a
protected folder. Run `scripts/backup-config.ps1` on the old laptop to copy it here.

## Cloud connectors (claude.ai → Settings → Connectors)

None installed at the org/account level.

## Built-in device tools

| Tool | State | Notes |
|---|---|---|
| **Built-in browser** (desktop app pane) | ✅ Available — **preferred browser** | Sign-ins inside the pane don't migrate; sign in again. |
| **Claude in Chrome** extension | ⏸️ Available but off by default per chat | Install the extension in Chrome on the new laptop and sign in. |
| **Computer use** | ⏸️ Available but off by default per chat | App access grants are per-device; re-approve apps when first used. |
| **Device bridge / folders** | No folders connected | Re-add folders with "Add folder" as needed. |
| **Memory** | ✅ On | Account-level, syncs. |
| **Artifacts / Docs** | ✅ On | Account-level, syncs. |

## Other AI tooling found on this machine (not Claude, FYI)

`~/.gemini`, `~/.copilot`, `~/.agents`, `~/.antigravity-ide`, `~/.vscode` — migrate separately if needed.
No `~/.claude` folder (Claude Code CLI) exists on this laptop.
