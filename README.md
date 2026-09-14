# Dopia for Claude and Codex

Find potential buyers who are complaining about their problem, and keep what you find.

A contact database sells rows: a name, a title, a company. No date, no reason to
write, and no way to check whether any of it is still true. This plugin does the
opposite — it reads the live web for people saying the thing your product fixes,
and every row it keeps carries the quote, the date, and a link back to where they
said it.

Connect your [Dopia](https://dopia.ai) workspace and the result stops being a file
on your laptop: it becomes a page with its own URL that you can send to someone who
has no account, and the people you found sit next to everything that happens with
them afterwards.

---

## Install

### Claude Code

```
/plugin marketplace add dopia-ai/plugins
/plugin install dopia@dopia-plugins
```

### Claude Desktop, Claude web

Customize → Plugins → Personal → **+** → Add marketplace → `dopia-ai/plugins`, then
install **Dopia** from the list.

### Codex CLI

```
codex plugin marketplace add dopia-ai/plugins
```

Then `/plugins` to install.

### Any other MCP client

The skill needs no installation beyond copying
`plugins/dopia/skills/find-prospects/` where your agent looks for skills. For the
workspace half, add the server directly:

```
https://mcp.dopia.ai/mcp?via=plugin
```

---

## Use it

```
/dopia:find-prospects https://your-product.com
```

Or just say what you want:

> Find merchants publicly complaining about their storefront chat, and save the
> list to my Dopia workspace.

What comes back is a list where every name is joined to something that person
said, on a date, at a link that opens — grouped by what they did next, because
"still living with it", "switched to something that didn't fix it" and "gave up"
are three different conversations.

---

## Connecting Dopia is optional

The skill runs on its own and writes a local report. Connecting adds three things:

| | |
|---|---|
| **A page you can send** | The list becomes a URL. No account needed to read it, and you can see who opened it. |
| **The people, kept** | Rows can become records — with the quote, its date and its link on them, not just a name and a company. |
| **It is still there next month** | An artifact outlives the conversation that made it. |

Sign-in is OAuth in your browser. You approve three things in plain words and can
take any of them back from Settings at any time:

- `crm:read` — look up companies, contacts and deals
- `crm:write` — create and update records
- `artifacts:write` — publish a finished piece of work as a page. It can create
  new ones; it cannot read or change the ones you already have.

Dopia never sees a password, and the plugin sends nothing to Dopia unless you ask
it to.

---

## What it will not do

- **It does not write or send outreach.** The output is a list and the buyer's own
  vocabulary. Judge it on list quality, never on reply rate.
- **It does not handle credentials or defeat a login wall.** Public sources are the
  default lane. If a page will not load, it takes another lane.
- **It does not pad a list to reach a number.** No dated, linked quote means no
  row. A short honest list is the product.

---

## What's inside

```
plugins/dopia/
├── .claude-plugin/plugin.json
├── .mcp.json                        → https://mcp.dopia.ai/mcp?via=plugin
└── skills/find-prospects/
    ├── SKILL.md
    └── references/
        ├── derivation.md            deriving what to qualify on, from your product
        ├── channels.md              where a given pain actually gets said out loud
        ├── gates.md                 what keeps a row, and what disqualifies one
        ├── extraction.md            reading pages, and what to do when one won't load
        └── artifact-schema.md       the shape of a published list
```

The part that makes the output non-generic is not the searching. It is deriving
*what to qualify on* from *what your product is worth* — a check hardcoded into a
tool only works for products that happen to share it.

---

## Links

- [Dopia](https://dopia.ai)
- [Run it from Claude](https://dopia.ai/features/agentic-platform/claude)
- [Run it from Codex](https://dopia.ai/features/agentic-platform/codex)
- [What Dopia exposes to agents](https://dopia.ai/features/agentic-platform)

Issues and pull requests welcome.

## License

MIT — see [LICENSE](LICENSE).
