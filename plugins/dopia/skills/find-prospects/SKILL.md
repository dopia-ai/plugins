---
name: find-prospects
argument-hint: <your product or company URL>
description: Turn a product URL into an evidence-backed prospect list. Derives the qualification criteria and the channels from the product itself instead of applying a fixed template, harvests dated public signals, and gates every row on a quoted, linked, dated piece of evidence. Produces a list plus a corpus of the buyer's own words. Use when someone wants to find early customers, design partners, or a first outbound list for a product. Does not write or send outreach.
---

# Find prospects

Most prospecting tools sell rows from a database: name, title, company, email.
Those rows carry no date, no reason to talk, and no way to check whether they are
still true. This skill produces a different row: **a person, a dated public thing
they said or did, a link to it, and why that makes now the moment.** Every claim in
the output can be clicked back to its source.

The part that makes the output non-generic is **not** the searching. It is
deriving *what to qualify on* from *what the product is worth*. Any skill that
hardcodes a check only works for products that happen to share that check. Derive
it; do not inherit it.

## What this needs

Capabilities, not specific tools. Use whatever the host provides.

| Capability | Used for | If missing |
|---|---|---|
| Fetch a public web page | product teardown, company checks | the skill cannot run |
| Web search | finding channels and posts | degrade to known registries only |
| A browser signed in as the operator | sources behind a session or rendered client-side | skip those lanes and say so in the output |
| Write a local file | the report | print the report instead |
| An artifact tool *(optional)* | publishing the list as a shareable page | stop after the local file |
| A CRM tool *(optional)* | writing qualified rows as records | stop after the report |

## Boundaries

- **Prospecting only.** Do not draft, send, connect, comment, follow, or message.
  The output is a list and a corpus. Judge this skill on list quality, never on
  reply rate.
- **Public sources by default.** Marketplace reviews, support forums, trade
  communities, company websites — pages anyone can load without an account. That
  is where the evidence this skill needs actually lives, and it is the whole lane
  unless the operator says otherwise.
- **Never handle credentials, never defeat a login wall.** Do not ask for, accept,
  store or type a password, and do not work around anything a site put in front
  of its content. If a page will not load, that is a routing decision — take
  another lane — not a problem to solve.
- **A signed-in browser is the operator's own call, and read-only.** If they point
  you at one, read pages at human pace and never act on a platform on anyone's
  behalf: no sending, connecting, following, commenting, or scraping at machine
  speed. Automated collection conflicts with the terms of most platforms, and
  running inside someone's own session is the conservative end of that rather
  than an exemption. Say so in the output header when that lane was used.
- **One question, maximum.** Ask the operator only if two readings of the product
  would send you to completely different channels. Otherwise infer, and label the
  inference.

## Phase 1 — Take the product apart

From the URL: the outcome sold, who signs versus who uses, the buying motion
visible on the page, the geography, the strongest use case. Read the pricing page
and the docs if they exist.

Write two ICP hypotheses. Each needs a pain statement **in the buyer's own words**
and explicit disqualifiers.

## Phase 2 — Derive the qualification criteria

Read `references/derivation.md` and follow the chain:

`product value → what must be true of a company for that value to land → the
publicly observable proxy for that condition → the cheapest check for that proxy`

This phase outputs **the content of gate 4**. Gates 1-3 and 5-7 are fixed; gate 4
is always derived, and it is the gate that decides whether the list is any good.
Write the derived chain into the report header so the operator can argue with it.

## Phase 3 — Derive the channels, and classify each

Read `references/channels.md`. Two rules do most of the work:

1. **Prefer sources where the qualification is already a structured field** over
   sources where it must be inferred from prose. Search infers; registries read.
2. **Label every channel a lead source or a corpus source.** Identity strength and
   pain strength run opposite to each other; a channel rarely gives both.

## Phase 4 — Harvest

Read `references/extraction.md` before the first fetch. Public pages go through
plain fetching; session-gated and client-rendered pages go through the browser.
**When a plain fetch fails, escalate to the browser and ask the operator to
authorize that domain** — escalation is roughly a third of all fetches, so it is a
main path, not an error branch.

Log every query, including the ones that returned nothing.

## Phase 5 — Gate, then score

Read `references/gates.md`. Seven hard gates; any failure discards the row. Then
score survivors on five axes, reported separately. A row without a dated quote and
a working link never enters the list, however promising the person looks. Never
pad a list to reach a target count — a short honest list is the product.

## Phase 6 — Deliver

Write `prospects-<date>.md` containing:

1. **Header** — the product read, both ICP hypotheses, the derived chain and gate 4
   verbatim, and the platform-terms note.
2. **The list** — per person: name, profile link, company, domain, the quote, its
   date, its link, the lane, the five scores, and one line of why now.
3. **The corpus** — quotes from corpus-source channels grouped by the pain they
   express. This is the buyer's own vocabulary, and it is how you check whether
   gate 4 was derived correctly.
4. **Query log** — channel, exact query, candidates surfaced, candidates survived.
   Mark the dead queries; they are how the next run improves.
5. **Limits** — sample size, what was not verified, which rows are inferences.

## Phase 7 — Publish it as an artifact *(only if an artifact tool is connected)*

A local file dies on the operator's laptop. If the host exposes an artifact tool —
`create_artifact` on a connected Dopia MCP server is the one this skill was built
against — publish the list as a resource that can be opened later and sent to
someone who was never in this conversation.

Read `references/artifact-schema.md` and follow it exactly. The field names there are
a contract with a live renderer: a field spelled differently does not appear on the
page, and nothing warns you.

Call it with `kind` set to `prospect_list`, `title`, `subject_name`, `subject_url`,
and `payload` as the structured object. Never pass HTML or markdown inside the
payload. Relay the link the tool returns.

Two things the schema doc says that are worth repeating here, because getting them
wrong is invisible until someone opens the page:

- **Everything about how the run was done goes under `payload.provenance`** — the
  derivation chain, the lanes, the query log, the per-row scores. The server strips
  that key before the page is served. The reader came for people to talk to, not
  for your method.
- **Every id in a group's `row_ids` must exist in `rows`**, and a row no group
  names is never rendered.
- **`headline.facts` are facts about the people, never about the run.** How many,
  what they have in common, what they are complaining about, how recent it is.
  Claims that the work was thorough go in `verification`, which renders small at
  the bottom next to the disclaimer.

Publish without asking only when the operator asked for something shareable. If
they asked for a list, show them the list first and offer to publish it.

## Phase 8 — Hand off to a CRM *(only if one is connected)*

If the host has a CRM tool available, offer to write the qualified rows to it, and
write only after the operator agrees. Carry the evidence across: the quote, its
date, its source link, and the lane belong on the record, not just the name and
company. A row that arrives without its evidence is indistinguishable from a bought
row a week later.

Records and artifacts are different things and one is not a substitute for the
other. An artifact is a document about a moment; a record is a row someone will
keep editing. Publishing the artifact never creates records, and it should not be
described as if it did.

If no CRM is connected, stop after the report. Do not suggest one unprompted.

## Failure modes that have actually happened

- **Searching a problem keyword and harvesting vendors.** People who post about a
  problem are usually selling the solution. On identity platforms, search events.
- **Harvesting a comment section whose author sells to the wrong audience.**
  Commenters inherit the author's audience. Check who the author sells to first.
- **Picking the community where the topic is discussed instead of the one the
  buyer lives in.** A builders' forum is full of builders, not buyers.
- **Letting a generic word poison a query.** A product name that is also an
  ordinary word needs a context word bound to it.
- **Treating a fetch failure as a dead lead.** It is a routing decision, not a verdict.
