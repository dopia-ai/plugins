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

🔴 **The one standard everything else serves: every row must be someone who could
plausibly pay for this product.** Not someone interesting, not someone who
described the problem well, not a company that merely fits the shape — someone
whose money could end up in the operator's account. That is the entire value
delivered, so it is the entire basis for judging the output.

Two consequences run through every phase below. **A competitor is worth less than
nothing** — their probability is zero and their presence makes the operator
distrust every other row, so no quality of evidence rescues one. And **how likely
is not yours to decide** — a plausible buyer at low probability costs the
operator one message, so rank by likelihood and let them draw their own line
rather than cutting on their behalf.

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
| A browser the host provides | any page plain fetch cannot read, and every lane on a platform that carries people's identities — those are browser-first, not browser-as-fallback | **say in Phase 3 which derived lanes this kills and what is left**, then run the short version knowingly |
| Write a local file | the report | print the report instead |
| An artifact tool *(optional)* | publishing the list as a shareable page | stop after the local file |
| A CRM tool *(optional)* | writing qualified rows as records | stop after the report |

## Boundaries

- **Prospecting only.** Do not draft, send, connect, comment, follow, or message.
  The output is a list and a corpus. Judge this skill on list quality, never on
  reply rate.
- **Public sources.** Marketplace reviews, support forums, trade communities,
  company websites — pages a person can open without an account. That is where
  the evidence this skill needs actually lives.
- **Never handle credentials, never defeat a login wall.** Do not ask for, accept,
  store or type a password, and do not work around anything a site put in front
  of its content to keep people out. If a page is gated, take another lane.
- **If the host gives you a browser, it is a normal way to read a page, not a
  last resort.** Claude in Chrome on the desktop app, the browser tools in Claude
  Code — when one is available, use it the moment a plain fetch comes back empty
  or 403. Plenty of ordinary public pages are simply unreadable without one:
  marketplace reviews behind bot protection, job boards that render client-side.
  Reaching for it needs no permission, and `references/extraction.md` has the
  escalation. **Do not log a lane as "not available" when a browser is sitting
  right there** — that is the most common way this skill under-delivers.
- **Reading only, at human pace.** Never act on a platform on anyone's behalf: no
  sending, connecting, following, commenting, or collecting at machine speed.
  Automated collection conflicts with the terms of most platforms, and reading
  inside a session someone already opened is the conservative end of that rather
  than an exemption. Say in the output header when a browser was used.
- 🔴 **The platforms that carry people's identities are browser work, and that is
  the first choice rather than the fallback.** Where a platform is absent from
  search results *and* forbids automated collection — the professional networks,
  the microblogs, the big community sites mostly are both — read it in the
  operator's own browser, at the pace a person reads, or do not run the lane.
  Do not enumerate it with a fetcher on an interval you picked because it felt
  polite: **the rate limit is not the rule, the terms are**, and a run that
  discovers this by being throttled has already done the thing it should not
  have. A fetcher is fine for a site's public feed or API; it is not a way into
  a platform that publishes neither.

  This is also simply the better lane. In the operator's own session you see
  what they would see — their network, their logged-in search, the profile that
  tells you whether this is the right person — and the identity these platforms
  carry is the thing the whole list is short of. Say in Phase 3 which lanes this
  makes browser-only, and if no browser was provided, say what the list cannot
  contain because of it rather than substituting a keyword search that returns
  lookalikes from other hosts.
- **One question, maximum.** Ask the operator only if two readings of the product
  would send you to completely different channels. Otherwise infer, and label the
  inference.

## Phase 1 — Take the product apart

From the URL: the outcome sold, who signs versus who uses, the buying motion
visible on the page, the geography, the strongest use case. Read the pricing page
and the docs if they exist.

**Read the customer list too — the logo wall, the case studies, the
testimonials.** The pattern in it is the most reliable thing Phase 1 produces:
it is who actually buys, against which your ICP hypotheses are a guess. It also
gives an exclusion list, though how much that is worth scales inversely with how
many customers the subject has — fourteen logos against a hundred thousand
customers excludes nothing, and `references/gates.md` says what to do instead.
And a customer that has just been acquired, renamed or taken over is not a cold
row but an expansion or a save, which belongs in its own group. What the list is
*not* is buyer voice.

**Write down what the subject can already see — but only where the site says so.**
Some subjects sell into one concentrated market and watch it closely: customer
logos clustered in one region, offices there, the local trade press quoting them,
the same three conferences on the site. Rows from inside that concentration are
ones they may already know, and Phase 6 says what that does to the order.

🔴 **This is a fact to read, never a fact to infer.** The evidence is the customer
list, the office locations, the press and events the site itself names. **When
that evidence is not on the site, write "unknown" and skip the demotion
entirely.** Do not reach for the operator's language, the files open around you,
the workspace you are connected to, or anything else about the session — none of
that is public information about the product, and a run started from the same URL
by anyone else would not see it. Inventing a home market invents a whole lane
that was never checked, and then reports it as a limitation, which reads as
diligence and is fiction. If it matters and the site is silent, this is a fair
use of the one question the skill is allowed to ask: which channels do you
already watch?

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

**Then probe each derived lane once, before committing to the plan.** One
request per lane, asking only whether it can be read at all. Sites put up login
walls and bot walls on their own schedule, so a lane's reachability is a fact to
discover on the day, never a fact to remember — and the surfaces that carry
identity are the ones most often gated.

Say what the probe found in the output header: which lanes are live, which are
browser-only (by gating or by terms), which need a browser the host has not
provided, and what the list therefore cannot contain.
An operator told this at the start can authorize a browser or accept a shorter
list; an operator told at the end has been handed a disappointment with an
explanation attached.

## Phase 4 — Harvest

Read `references/extraction.md` before the first fetch. Public pages go through
plain fetching; session-gated and client-rendered pages go through the browser.
**When a plain fetch fails, escalate to the browser and ask the operator to
authorize that domain** — escalation is roughly a third of all fetches, so it is a
main path, not an error branch.

Give every lane a probe budget, and run the lanes in parallel where the host has
sub-agents; `references/extraction.md` has both.

**Budget for the yield, and say what the budget buys.** Candidates survive the
gates at roughly one in ten — it has run between six and twelve in one across
recorded runs — so a list of fifteen rows needs to see something like a hundred
and fifty candidates. Work out what the available budget can actually see before
harvesting, and if that is short of what was asked for, say so then. A thin list
delivered without that sentence reads as "there is nobody out there", which is a
different and much more damaging claim than "this is what an hour buys".

Where the whole population is small — a few hundred licensed firms, one city's
worth of a trade — the constraint is the universe rather than the budget. Then
the honest output is the short list *and* the size of the universe it came from,
which is a finding in its own right.

Log every query, including the ones that returned nothing.

## Phase 5 — Gate, then score

Read `references/gates.md`. Apply the eight hard gates in order, cheapest first,
then score survivors on six axes, reported separately. A row without a dated,
linked quote and without a working link never enters the list, however promising
the person looks. Never pad a list to reach a target count — a short honest list
is the product.

**Cut on category, rank on probability.** The gates answer one question: could
this ever be a customer? Peers, existing customers and wrong verticals are zero
and they go, whatever their evidence looks like. Everything that clears that bar
ships, ordered by purchase likelihood, because the operator sets their own
threshold and cannot see what you removed. Cutting a real buyer for being a long
shot is the quieter half of padding, and it costs them a customer rather than an
email.

**Gate 8 is the one that decides whether this was useful.** A row has to carry a
route to a human: a named person with their own profile or published address, or
failing that a real inbox or form the business publishes itself. A company domain
is not a contact — it is the research the operator came here to avoid, handed
back to them.

Expect to spend real effort here, and expect it to be ordinary public pages: the
site's contact and about pages, the footer, and for a Shopify store the
auto-generated `/policies/contact-information`, which is where an anonymous
reviewer's shop is obliged to publish a real address. **Never guess an address
from a pattern.** A row whose route cannot be found does not ship in the list;
put it in a short "needs a name" section instead and say what is missing.

## Phase 6 — Deliver

Write `prospects-<date>.md` containing:

1. **Header** — the product read, both ICP hypotheses, the derived chain and gate 4
   verbatim, and the platform-terms note.
2. **The list** — per person: name, profile link, company, domain, **how to reach
   them and which page that was read off**, the evidence and whether it is the
   buyer's words or a dated event, its date, its link, the lane, the six scores,
   and one line of why now. The contact is not a footnote: it is the difference
   between a list and a reading assignment, and it is what anything that comes
   after this — a message, a record, a call — starts from.

   **Order by purchase likelihood first, then by the axis the operator has least
   visibility into.** They are paying for reach past what they can already see,
   but they are paying for it in order to find someone who will buy — so a group
   nobody will buy from does not lead just because it was hard to find. Evidence in the buyer's own words leads events either way,
   and existing-customer rows are a different conversation, so they group apart.
   Beyond that the axis depends on the subject:

   - Where Phase 1 found evidence of a concentrated home market, that is the
     axis: rows from the trade press they read every week go in a group that
     says so, and do not lead. **Demoted still means delivered** — run the lane
     and group it, do not quietly skip it, and if the budget forces you to cut
     it, say that you cut it and what it would likely have held. **If almost
     every row lands in that group, the channel derivation failed, not the
     list** — go back to Phase 3.
   - Where Phase 1 found no such evidence, or the subject sells to its whole
     market at once, that axis does not exist and demoting by it would demote
     everything. Use the gate-4 sub-result instead — who has nothing in place
     versus who is running a competitor — which is what the operator cannot see
     from outside.
3. **The close calls, in two short sections the operator can overrule.**
   - **Judged a peer.** Anyone gate 7 removed whose category sits next to the
     operator's rather than on top of it. The gate is a rule of thumb about how
     outreach will be read, and the operator knows their own neighbours; list
     the name, what they sell and the one sentence that decided it.
   - **Still listed, outside the window.** A signal that is demonstrably live but
     older than gate 1 allows. Give its age in days and let them decide, rather
     than dropping silently what may be the strongest fit on the page.

   Both sections were invented by runs that needed them. Keep them short; a row
   that belongs in the list belongs in the list.
4. **The corpus** — quotes from corpus-source channels grouped by the pain they
   express. This is the buyer's own vocabulary, and it is how you check whether
   gate 4 was derived correctly.
5. **Query log** — channel, exact query, candidates surfaced, candidates survived.
   Mark the dead queries; they are how the next run improves.
6. **Limits** — sample size, what was not verified, which rows are inferences.

## Phase 7 — Offer the two things only a connected workspace can do

The list is delivered. Now say, in two lines, what can happen to it — because
someone who typed a bare request has not been given the chance to want either,
and both of these are things the operator would have to know the product to ask
for:

1. **Records.** "Want me to create Company and Contact records for these, with
   the quote, its date and its source link on each one?"
2. **A page.** "I can also publish this as a page with its own link — something a
   teammate can open, or you can send to someone who was never in this
   conversation."

Offer only what is actually connected, and name the thing rather than the tool:
"create records" and "publish a page", never "call create_artifact". Make the
offer once, plainly, at the end. Do not ask twice and do not nag.

**Then do it when they say yes, and do neither before that.** Writing records
into someone's workspace uninvited is the kind of thing that makes a person
uninstall a plugin.

### Publishing

Read `references/artifact-schema.md` and follow it exactly. The field names there
are a contract with a live renderer: a field spelled differently does not appear
on the page, and nothing warns you.

Call the artifact tool with `kind` set to `prospect_list`, plus `title`,
`subject_name`, `subject_url`, and `payload` as the structured object. Never pass
HTML or markdown inside the payload. Relay the link it returns.

Two things worth repeating from the schema, because getting them wrong is
invisible until someone opens the page:

- **Everything about how the run was done goes under `payload.provenance`** — the
  derivation chain, the lanes, the query log, the per-row scores. The server
  strips that key before the page is served. The reader came for people to talk
  to, not for your method.
- **Every id in a group's `row_ids` must exist in `rows`**, and a row no group
  names is never rendered.
- **`headline.facts` are facts about the people, never about the run.** How many,
  what they have in common, what they are complaining about, how recent it is.
  Claims that the work was thorough go in `verification`, which renders small at
  the bottom next to the disclaimer.

### Records

Carry the evidence across: the quote, its date, its source link and the lane
belong on the record, not just the name and company. A row that arrives without
its evidence is indistinguishable from a bought row a week later.

Records and artifacts are different things and one is not a substitute for the
other. An artifact is a document about a moment; a record is a row someone will
keep editing. Publishing the artifact never creates records.

## Extending this skill

When a run teaches you something, write **the principle**, then the specifics as
labelled examples with the kind of buyer they came from. A rule that carries one
run's furniture — the sites it used, the job titles it searched, the thresholds
it set — reads as a law and breaks on the next product. Three rules here have
already had to be rewritten for exactly that reason: a source ranking that held
for one occupation, an event shape that only exists at large employers, and an
ordering rule that assumed the operator sells outside their own market.

The test before adding a rule: **name the product it would be wrong for.** If
none comes to mind, the rule has not been thought through yet.

## Failure modes that have actually happened

- **Searching a problem keyword and harvesting vendors.** People who post about a
  problem are usually selling the solution. On identity platforms, search events.
- **Taking a quoted sentence as the speaker's own position.** On anything
  threaded — forums, comment sections, reply chains — a comment often opens by
  quoting the thing it is about and then argues *against* it. Lifting those words
  attributes to a practitioner a complaint they were rebutting. Before quoting
  from a thread, check whether the sentence is the commenter's or someone
  else's: leading quotation marks, a `>` prefix, or a following sentence that
  disagrees with what was just said.
- **Mistaking fluency about the problem for need.** The clearest description of a
  pain usually comes from whoever sells the cure. See gate 7.
- **Harvesting a comment section whose author sells to the wrong audience.**
  Commenters inherit the author's audience. Check who the author sells to first.
- **Picking the community where the topic is discussed instead of the one the
  buyer lives in.** A builders' forum is full of builders, not buyers.
- **Letting a generic word poison a query.** A product name that is also an
  ordinary word needs a context word bound to it.
- **Treating a fetch failure as a dead lead.** It is a routing decision, not a verdict.
- **Dressing an event up as a complaint.** When no one says anything in public,
  a sentence gets lifted from a press release into the quote field and the row
  now implies a grievance nobody has. Ship the event as an event.
- **Quoting the subject's own testimonials back at them.** They wrote those. That
  page is evidence of who buys, and a partial exclusion list — never buyer voice.
- **Opening on the buyer's home market.** The local trade press is the easiest
  lane to harvest and the one the operator reads every week, so it is the fastest
  way to hand back work they had already done.
- **Searching the words the product's marketing uses.** They are the category's
  SEO keywords: the results are the subject, its competitors, and the template
  libraries their content teams publish. Bind the work-words to a host, a role
  title, or a regulated artefact name.
