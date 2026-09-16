# Phase 4 — Fetching and extracting

## Ask a source for its feed before you read its pages

A registry that publishes for machines publishes better than it renders for
people. Job boards expose posting APIs, regulators publish downloadable
registers, exchanges and trade press run RSS, marketplaces expose listing feeds.
Look for one before writing a single extraction: check `robots.txt` for sitemaps,
look for an RSS or JSON link in the page head, try the documented API of whatever
software the source runs on.

**The reason is gate 1, not convenience.** A rendered page and a search result
cannot tell you whether the thing is still true. A feed can: it carries the real
timestamp, and a feed of *currently listed* items proves live-state by omission —
what is gone is gone. In one run, checking the feed instead of the page showed
that 14 of 40 candidates had quietly dropped the signal that qualified them, and
three search summaries said the opposite of what the live record said.

Examples, not a list to copy: applicant-tracking systems used by small employers
each expose a public board endpoint (Ashby, Lever and Greenhouse all do, and the
one your buyers use depends entirely on the market they hire in); company
registries publish officer and licence data; exchanges publish announcement
feeds. **Find the feed the way you would find any other fact about the source.**

Two habits that go with feeds:

- **Trust the URL, not the summary.** A search tool may silently drop a host
  restriction and hand back something that reads right from somewhere else, and a
  summariser will happily paraphrase a stale page into the present tense. Check
  the host and the date at the source before a row carries them.
- **Convert timestamps in code, not in prose.** Epoch milliseconds read back
  through a summarising model come out as plausible, wrong dates — one run nearly
  shipped a date three months in the future.

## Two paths, and the escalation between them

- **Public marketing pages** → plain fetch. Cheap, no permission, no session.
- **Anything behind a session, or rendered entirely on the client** → the
  operator's own browser.

**Plain fetch fails often enough that the browser is a main path, not an error
branch.** In testing, roughly a third of ordinary "open the company homepage"
attempts failed, split between 403 responses, TLS handshake failures behind a
redirect, and domains that did not resolve. Review sites and large social sites
returned 403 to plain fetch and opened normally in the browser. Client-rendered
job boards returned an empty body to plain fetch and rendered fully in the browser.

So: **on any fetch failure, escalate to the browser and ask the operator to
authorize that domain.** Browser extensions restrict navigation to authorized
sites; requesting authorization is expected and is the reason the extension
exists. Do not discard a candidate because a fetch failed.

## A budget per lane, and lanes in parallel

**Give every lane a probe budget before you open it** — a handful of queries, or
one page of results — and when the budget is spent with nothing surviving, write
the lane down as dead and leave. Lanes that sound perfect are the expensive ones:
a run once spent its remaining time on public-sector audit filings because the
idea was too good to abandon, and returned nothing. The dead lanes in the query
log are worth more than the time it costs to keep poking them.

**Run the lanes in parallel when the host can.** Three lanes explored at once,
each with its own budget, is most of the difference between a thin list and a
good one, and it is a scheduling decision rather than a smarter search. Where the
host offers sub-agents or parallel tasks, give each lane one and merge the
survivors; where it does not, run them in sequence and say so in the output.

**Pin the geography before the first query when the product serves one market.**
A search index skews to the US whatever the query says. A rehearsal for a UK-only
product got the subject's own homepage back from an unrestricted query, then
collapsed entirely into US salary pages when it tried to exclude aggregators. For
a single-market product, restrict searches to that market's registries, boards
and trade press from the first query, and treat unrestricted search as a probe
for vocabulary rather than for candidates.

**A browser is also a way to search, not only a way to read.** Search operators a
built-in search tool cannot express — a file type, a date range, a single site —
often turn a dead lane into a live one. The boundaries do not change: read at
human pace, and if a search engine puts up a bot check, stop and take another
lane rather than work around it.

## Domain fallback chain

Before failing gate 2, try in order: the bare domain, `www.`, plain `http`, the
company's page on the registry that surfaced it, then a search for the company
name. Log which step succeeded — a high escalation rate usually means the ICP
skews to companies with weak web presence, which is itself a finding.

## Reading a page

Prefer whole-page text over selectors. Modern social and review sites ship hashed,
build-generated class names; any selector you write is correct for one deploy.
Slicing the page's rendered text at increasing offsets is slower to write and far
more durable.

Where a site virtualises its feed, only a handful of items exist in the DOM at any
moment. Scroll with real wheel events, extract after each scroll, and accumulate
on your side. Accumulating inside the page does not work: script state does not
survive between calls, and nodes appended to the document get cleared by the
site's own renderer.

Keep each extracted item short. Extraction calls truncate their return value, so
pull a leading slice of each item plus a short trailing slice, which is usually
where the engagement counters live.

## Fingerprinting a company's site

When gate 4 is a technical fact about the prospect's site — what it is built on,
what it already loads — read it off the resources the page requests, never off the
page text.

**Match on the host of each `script[src]` and `link[href]`, not on a substring of
the whole document.** A naive search of the rendered HTML for vendor names
returned five chat vendors on a site that loaded none of them: vendor strings
appear in bundled code, in content-security headers, in preconnect hints, and in
theme comments. Host matching returned the correct empty set.

Two things fall out of this for free and are worth keeping:

- **The full third-party host list is a budget proof and a stack map.** A store
  loading a reviews app, an email app, a subscriptions app and a restock app is
  demonstrably a company that buys software, and you can see exactly which
  adjacent problems it has already paid to solve.
- **The absence of a category is a signal too.** A merchant who publicly complained
  about a paid tool and now loads nothing in that category did not switch — they
  churned out of the category, which is a different and often better conversation.

Many platforms also expose structured public endpoints that answer a gate in one
request — catalogue listings, sitemaps, manifest files. Look for one before
writing a scraper.

## Query hygiene

- **Quoted phrases work; boolean operators frequently do not.** At least one major
  professional network treats `AND` and `OR` as ordinary search terms, so they
  silently widen the query instead of constraining it. Write one phrase per query
  and run several queries.
- **Sort deliberately.** Date sort finds fresh triggers. Relevance sort is usually
  the only way to find high-engagement posts, since engagement is rarely a sort
  option.
- **Bind context words to ambiguous product names.** A product whose name is also
  an ordinary English word will return nothing useful on its own.
- **Replying-to-a-brand queries are a noise source**, not a lead source. Brand
  account replies on open platforms are dominated by reach farming.
- **Hypothetical numbers poison numeric queries.** Teaching posts are full of
  invented arithmetic that matches any "N customers" pattern.

## Interaction limits

Read pages; do not act. Expanding a comment thread is reading. Following,
connecting, replying, and messaging are not, and are out of scope for this skill.

When a control must be clicked to reveal more content, locate it by its text and
click its actual coordinates. Controls on these sites are often ordinary text
nodes rather than buttons, so a text-matched script click will miss. Verify the
page did not navigate after each click: a click a few pixels off lands on a
neighbouring profile link and destroys the page you were harvesting.

## The query log

Record every query: the channel, the exact string, candidates surfaced, candidates
that survived the gates. Dead queries are as valuable as live ones — they are the
only way the next run avoids repeating a lane that does not work for this product.
