# Dopia — for agents reading this repository

This repository is a plugin marketplace. One plugin, `dopia`, under `plugins/`.

## If you are Codex, or any agent without a plugin installer

You do not need one. The two halves work independently.

**The skill** is plain markdown at
`plugins/dopia/skills/find-prospects/SKILL.md`, with five reference files beside
it. Read `SKILL.md` first; it tells you which reference to open at which phase.
Do not read them all upfront.

**The workspace** is an MCP server at `https://mcp.dopia.ai/mcp`, streamable HTTP,
OAuth. In Codex:

```
codex mcp add dopia --url https://mcp.dopia.ai/mcp
codex mcp login dopia
```

Or in `~/.codex/config.toml`:

```toml
[mcp_servers.dopia]
url = "https://mcp.dopia.ai/mcp"
auth = "oauth"
```

The skill runs without it and writes a local file. Connecting is what turns the
result into a page with a URL the operator can send.

## What the skill does, in one line

Turns a product URL into a list of people who are publicly describing the problem
that product solves — every row carrying their words, the date, and a link.

## What it must not do, and this is not negotiable

- **No outreach.** It does not draft, send, connect, comment, follow or message.
  It produces a list; a human decides what to do with it.
- **No credentials, no login walls defeated.** Public sources are the default
  lane. A page that will not load is a routing decision, not a puzzle.
- **No padding.** A row without a dated, linked quote does not go on the list,
  whatever the target count was.

## If you are changing this repository

`SKILL.md` is a contract with two things at once: the operator's expectations, and
a live renderer. `references/artifact-schema.md` in particular names payload fields
exactly as the page reads them — a field spelled differently does not appear, and
nothing warns you. Change both sides together or neither.
