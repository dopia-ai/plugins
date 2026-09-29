# Dopia

Find people who are already complaining, in public, about the problem your
product solves — and keep what you find.

Give it your website. It works out who buys your product and where those people
talk, reads what they have said, and comes back with a short list. Every row is a
real person or business with **what they said, the date they said it, a link that
opens the page, and a way to reach them** that someone published. Nothing is
guessed, and nothing ships without evidence.

## Use it

```
/find-prospects yourcompany.com
```

Or just ask: *"Find people complaining about the problem yourcompany.com
solves."* In Claude Code the command is `/dopia:find-prospects`.

A run is research, not a lookup — it takes a while and reads a lot of pages.
Before it starts it tells you where it will look and which places it cannot read,
so you can turn on a browser (such as Claude in Chrome) for pages that need one.

## What you get back

- **The list**, ordered by how likely each person is to buy: who they are, how to
  reach them and where that was read, their words or a dated event, the date, the
  link, and one line on why now.
- **How it read your product** — who it thinks buys and the test it used for a
  good fit, so you can correct it.
- **The buyers' own words**, grouped by the problem they describe.
- **What it searched**, including what found nothing, and the limits of the run.

A short list is normal: roughly nine in ten candidates are dropped because they
lack a dated quote, a working link or a real way to reach them.

## Connecting Dopia is optional

The skill works on its own and writes the list as a file. Connect your
[Dopia](https://dopia.ai) workspace and, when a run ends, it offers — once — to:

- **publish the list as a page** with its own link, private until you share it;
- **keep the people as records**, with the quote, date and link on each one.

Nothing is written until you say yes. Connecting is OAuth in your browser, where
you approve four permissions — read your CRM, create and update records, read the
pages in your library, and save a new page — and can revoke them from Dopia's
Settings at any time.

## What it will not do

- **Contact anyone.** No messages, connection requests, follows or comments.
- **Get around a login.** Public pages only; it never asks for or types a
  password, and takes another route when a page is gated. Sites that carry
  people's identities are read only through a browser you provide, at the pace a
  person reads.
- **Pad the list.** It never invents an address from a pattern.

## What it runs and sends

- **Web pages** it reads are fetched by your own agent, with its fetch, search
  and browser tools.
- **One MCP server**, `https://mcp.dopia.ai/mcp`, declared in `.mcp.json`. It is
  contacted only after you connect Dopia, and receives only the tool calls you
  approve — never your conversation.
- **No scripts, hooks or binaries.** The plugin is a skill written in Markdown
  plus that one server entry.

## Links

- [Guide](https://dopia.ai/help/integrations/find-prospects-plugin) — install,
  connect, run, troubleshoot
- [Privacy policy](https://dopia.ai/privacy) · [Terms](https://dopia.ai/terms)
- Support: [contact@dopia.ai](mailto:contact@dopia.ai)
- Source: [github.com/dopia-ai/plugins](https://github.com/dopia-ai/plugins) — MIT
