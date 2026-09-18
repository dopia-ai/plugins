# Phase 5 — Gates, disqualifiers, scoring

## The eight hard gates

Any failure discards the row. Do not soften a gate to reach a target count; a
short honest list is the product, a padded one is the thing we are replacing.

1. **A dated public action, inside a window you derive.** Not a profile fact — an
   action with a timestamp. **The window is not fixed.** Set it by how fast the
   state decays: a signal that someone is between tools goes stale in weeks, while
   a grievance against a vendor they are still paying persists for months. Pick the
   window in Phase 2 alongside gate 4, justify it in one line, and put both in the
   header. Defaulting to 30 days will silently discard the slow-decaying signals,
   which are often the best ones.
2. **A resolvable company domain — and it has to be *this* company.** It must
   load (see `extraction.md` for the fallback chain before you fail a row on
   this), and the site that answers must be the business the row describes. A
   200 is not an identity: a recorded run shipped a row whose domain served a
   French adtech firm while the row described a US grantmaking platform, and
   another whose domain was a parked for-sale page behind a 114-byte redirect
   stub. Both would have sent the operator's first email to a stranger.

   One cheap check settles it: the site must mention the business in the terms
   the evidence used, or name the person. Zero hits for the row's own subject
   noun means the domain is wrong, not that the site is thin. Watch for a page
   under ~1KB, a JS-only stub, a registrar or for-sale lander, and a different
   country or industry. **This bites hardest where the lane gives you a person
   but no domain** and the domain gets composed from the company name — then the
   domain is a guess wearing a link, and it must be confirmed like any guess.
3. **Company size inside the target band.** From the site's team page, the
   registry's own field, or an explicit self-description.
4. **The derived check from Phase 2.** This is the gate that decides list quality.
   It is different for every product. Write it into the output header verbatim so
   the operator can see what was applied.
5. **The person is the decision-maker, not an employee or an agency acting for
   them.** A post by a rep about their employer does not qualify the employer.
6. **Not a farming or dormant account.** See disqualifiers.
7. **Not a peer.** Anyone who sells what you sell, or sells services around it, is
   out. Not because the outreach would be awkward — because their probability of
   buying is zero, so the row's value is not small, it is **negative**. An
   operator who spots one competitor on the page starts wondering how every other
   row got there. One peer discounts the whole list.

   Peers are the hardest rows to cut, because they produce the best-sounding
   evidence on the page: a company that sells the solution describes the problem
   better than anyone who merely has it. **"They wrote our thesis almost
   verbatim" is a warning, not a highlight.** The people who articulate a pain
   most fluently are usually the ones already monetising the cure.
8. **A way to reach someone.** See below. A row that names a problem but not a
   route to a human is a research task handed back to the operator, not a
   prospect.

## Gate 8 — a route to a person

The point of the list is that someone can be contacted today. A company domain is
not a contact: it tells the operator where to start digging, which is the work
they came here to avoid.

Record which of these the row actually has, because the next step — whoever
writes the message — needs to know:

| tier | what it means |
|---|---|
| `person_direct` | A named human and a route that reaches **them**: their own profile on a platform where a message is normal, or an address they published themselves. |
| `person_via_company` | A named human, but the only route is a shared inbox or a form. You know who to address; you do not have their line. |
| `company_only` | No name, but the business publishes a real inbox or contact form of its own. |

🔴 **The tier is computed from the fields, not chosen.** Written as prose these
three read like a judgment call, and the judgment drifts upward every time: in one
recorded run **10 of 21 rows** claimed `person_direct` while the only route on the
row was a `hello@` inbox and a link to the company's page — two of them with no
name at all. Nothing in the output was false, and the list still overstated what
it had, because the operator reads that label as "I can write to this person".

Decide it mechanically, in this order:

1. No `name` → `company_only`. No exceptions. A tier that promises a person while
   the name field is empty is the clearest possible self-contradiction.
2. A `name`, plus **a route that reaches that person**: an address whose local
   part is theirs, or their own profile on a platform where a message is normal
   → `person_direct`.
3. A `name`, but the only route is shared → `person_via_company`.

Two things are **never** a personal route, however tempting: a generic inbox —
`hello@`, `info@`, `support@`, `contact@`, `sales@`, `careers@`, `team@`, `admin@`,
`hi@` — and a company page on a professional network (`/company/…`), which reaches
whoever runs the account. Both are real routes and belong on the row; they are
`person_via_company` routes.

The test in one line: **would the named person be the one who opens it?** Where
the honest answer is "someone will forward it", the tier is
`person_via_company`. And where a page carries named executives with their own
addresses — several do, in bio cards in the source — use one of those and earn
`person_direct` properly, rather than labelling a support inbox as if it were one.

Anything below `company_only` does not ship as a qualified row. Put it in a
separate "needs a name" section if it is otherwise strong, and say what is
missing — never silently mix it into the list.

**Where to look, cheapest first.** Most of the time the answer is on their own
site and takes one fetch:

1. **The signal itself.** A job post signed by the founder, a review that names
   the store, a forum profile with a site link.
2. **Their site**: `/contact`, `/pages/contact`, `/about`, `/pages/about-us`, and
   the footer. Small businesses publish an address because they want the mail.
3. **Shopify stores specifically** — the platform auto-generates
   `/policies/contact-information` and `/policies/legal-notice`, and a store
   selling into the EU or Germany must publish a real address and email there.
   This is the single highest-yield check for a marketplace-review lane, where
   the reviewer is anonymous but the store is not.
4. **Their company page on a professional network**, then the named person on it.
5. **The person's own profile**, found by name plus company.

**Know which kind of route you have, and verify the kind that needs it.**

- **Read off a page that states the link** — a registry's founder card, a team
  page, an author byline, a profile the person published in their own bio. The
  page is the verification: it is the source asserting that this person belongs
  to this company. Record which page, and you are done.
- **Found by searching a name plus a company** — a guess until something confirms
  it. Open it once, or find the same link on a page that asserts it. A profile
  that turns out to be a different person of the same name is worse than no link
  at all, because it is the row the operator will send first.

Where a route could not be confirmed either way, keep the row and say so on it.
On a platform that is browser-only, confirming a profile is browser work like
any other reading there — do not fall back to a fetcher for it.

🔴 **A form's example text is not an address.** Reading the page source finds
addresses that text extraction misses — and it also finds strings that are
shaped exactly like addresses and are not any. The one that has already shipped:
`placeholder="email@phonely.ai"`, the grey hint inside an empty email input,
harvested onto a row as the company's contact. It bounces, and it bounces on the
operator's domain.

So take addresses only from places that assert one: a `mailto:` href, a JSON-LD
`email` field, or visible body text. **Never from `placeholder`, `value`,
`aria-label`, `alt`, a `<template>`, a commented-out block, or anything a
framework renders as sample data.** Two cheap tells, and either is enough to
reject: the local part is a generic word for the field itself — `email@`,
`name@`, `you@`, `your.name@`, `example@`, `user@` — or the same string appears
in a `placeholder` attribute anywhere on the page. When the only candidate looks
like a sample, the row has no address; say so and drop the tier.

**Never invent an address.** No `first.last@domain` permutations, no pattern
guessing off one known address, no data broker. A guessed address is not a
contact — it is a bounce that costs the operator their sending reputation, and
it makes the row a lie. If the real one cannot be found, say so and drop the tier.

🔴 **Saying a page does NOT contain something costs more than saying it does.**
"They publish no inbox", "no named individual is attributable", "no email or
phone anywhere" — these sentences are cheap to write, read as diligence, and
have been wrong in three separate recorded runs, every time on a page that did
publish the thing. A positive claim is checked by the one page you read. A
negative claim is a claim about **every** page, so it needs the page that would
carry the thing if it existed: `/contact`, `/about`, `/team`, `/leadership`, the
footer, and the source of the page you are on — an address is often a `mailto`
href behind a link that reads "Email us", or sits only in JSON-LD, and text
extraction drops both.

Two habits fix it. **Check the obvious page before denying**, and **describe
what you saw rather than what you did not**: "the contact page routes to a form"
is checkable and survives being wrong; "they publish no email" is the sentence
the reader disproves in one click and then stops trusting the rest of the list.

**Say where the identity came from, not just where the route came from.** The
`tier` describes how to reach them; it says nothing about how confident you are
that this person holds this job. Three sources, decreasing strength: the
company's own page, a registry the company maintains a profile on (a YC company
page, an ATS job post signed by them), and a third-party directory or org chart
anyone can edit. **A role that appears on none of the first two is not stated as
fact** — attribute it ("listed as X on <directory>") or drop the role and keep
the name. In one run a row carried a title that existed only inside a
third-party org chart's embedded JSON, and another gave a title the company's
own team page contradicted.

## Disqualifiers, mechanical and cheap

These caught every bad row in testing without any judgment call:

- **Farming account**: zero or near-zero followers, fewer than ten posts, account
  created in the last few months, replies are content-free.
- **Dormant**: last activity more than a year ago.
- **Large-company employee**: profile domain belongs to an enterprise, headline is
  a staff role.
- **Peer**: bio or site sells the same category, or sells go-to-market services.
- **Wrong vertical**: passes every structural gate but sells into a sector the
  product cannot serve.
- **Already a customer**: shipping a current customer as a cold prospect is the
  one error the operator notices immediately. The logo wall is the cheap check
  and it is only ever partial — fourteen names against a hundred thousand
  customers excludes nothing. **Where the product leaves a footprint on the
  prospect's own site** — a booking widget, a portal, a chat bubble, a pixel —
  that footprint is the real check: fingerprint the site's `script[src]` and form
  hosts as in `extraction.md`, and make the result a gate-4 sub-result
  (`greenfield` / `displacement` / `already a customer`) rather than a footnote.
  **Where the subject sells several products**, a firm on a sibling product's
  customer list is not cold either. Say in the output which check was available
  and that their own CRM is the real list.

Run the disqualifiers *before* the expensive gates. They are free and they remove
roughly a fifth of raw candidates.

## "They already have something" is three states, not one

A prospect who has already done something about this problem is the most
commonly mishandled row in the skill, because the three ways they can have done
it look similar from outside and are worth wildly different amounts.

| what they did | what it proves | verdict |
|---|---|---|
| **Bought** a product for it — a competitor's, or an adjacent one | They will pay money for this problem. The only open question is switching cost. | **Strongest row on the page.** A seed company on HubSpot free is squarely in. |
| **Built** something in-house | The pain is expensive enough to spend engineering on. Whether they would rather buy depends on how much it costs them to keep it. | **Keep, and say which.** Weigh it by what maintaining it costs them, not by how impressive it is. |
| **Sells** it — it is their product or their billable service | They are the supply side. | **Gate 7. Out.** |

The middle and bottom rows are the pair that gets merged, and merging them is
how peers reach the page: "they built a rougher version of this by hand" reads as
a warm displacement story whether the builder is a 20-person IoT company clearing
its own tools backlog or a 130-person agency that sells the method. Ask one
question to separate them: **does anyone pay them for this specific work?** If
yes, it is gate 7 regardless of how good the quote is.

The "built it in-house" row also needs its own read on scale. A company that
built it and is about to triple the engineering team that maintains it is likelier
to keep building than to buy.

## Probability ranks the list; it does not cut it

Two different jobs get confused here, and only one of them is yours.

**Yours is the category question**: could this entity ever be a customer? That is
binary and you own it. A peer, a company already on the subject's customer list,
a business in a vertical the product cannot serve — zero, cut, no appeal.

**Theirs is the threshold question**: how likely is likely enough to be worth a
message? That belongs to the operator, and it depends on facts you do not have —
how much outreach costs them, how empty their pipeline is, whether they send a
hundred or five. A plausible buyer at low probability costs them one email. Cut
it and you have made that decision on their behalf, silently, and they cannot
see what was removed.

So: **rank by purchase likelihood, do not prune by it.** Everything that clears
the category question ships, ordered so the operator can draw their own line and
stop reading wherever they like. Say what puts each group where it is.

This does not license padding. "Never pad a list to reach a target count" is
still the rule, and it is about a *different* failure: inventing or waving
through rows that do not clear the gates. A real buyer at 10% is not padding. A
row that fails gate 4 is padding at any probability.

Where the evidence supports it, three things move a row up and are worth reading
off the page you already have: they have paid for something adjacent, the person
named controls the budget, and the problem is costing them now rather than in the
abstract.

## Scoring the survivors

Score only what survives. Six axes, and report them separately rather than as one
number — a blended score hides which axis is weak.

- 🔴 **Purchase likelihood** — the only axis the operator is actually buying, and
  the one the other five are proxies for. Score it directly instead of letting it
  fall out of the rest: would this company pay for this product, given what the
  page shows about their budget, who the named person is, and what they have
  already spent on this problem. Five axes of pristine evidence about a company
  that will never buy still scores zero here, and this is the axis the list is
  ordered by.
- **Signal strength** — asking for help publicly beats announcing an event, which
  beats passive engagement.
- **Recency** — inside 7 days beats inside 30.
- **Motion fit** — how directly the Phase 2 check was satisfied. A prominent
  "Book a demo" is stronger evidence than a buried contact form.
- **Reachability** — gate 8 decides whether a row ships at all; this axis rates
  how good the route is. `person_direct` beats `person_via_company` beats
  `company_only`, and a surface where a reply is normal beats a form.
- **Evidence completeness** — quote, link and date all present and all working.

## Two axes that only appear once you run it

**Tenure before the complaint.** How long someone used a thing before saying it was
bad separates operational pain from a failed install. A year of use then a
complaint is a real workflow that broke. Twenty-three minutes then a complaint is
a setup problem, and that person is not a prospect for a competing product — they
are a prospect for documentation. In one run this axis discarded four of ten raw
candidates on its own. Wherever a source publishes tenure, use it.

**Post-signal state.** After running the gate-4 check, sort survivors by what they
did *after* the signal. Three states recur and they are three different
conversations:

- **Still using the thing they complained about** — the pain is live and unresolved,
  and switching is the whole conversation. Usually the warmest.
- **Switched to something adjacent that does not solve the stated pain** — the need
  is still open and they have already shown they will pay to fix it.
- **Left the category entirely** — they have to be re-convinced the category works
  at all before anything else, so the conversation starts a step earlier.

Put the state on every row. A list that does not distinguish these hands the
operator three different jobs labelled as one.

## Evidence discipline

- 🔴 **A claim of being the first or the only one cannot be checked inside the
  document that makes it.** "Our first PM", "founding", "you'll own this alone" —
  these are the words a gate often turns on, and they are written to attract a
  candidate, by someone with no reason to mention the two colleagues already
  doing it. The claim is about the organisation, so it has to be checked against
  the organisation's other documents, and they are usually in the same feed you
  already pulled: **scan the whole board for other roles in the same function
  before believing the word "first".**

  Two rows shipped in one run without that scan. One was a "Head of Product" ad
  whose own text said *"Reporting to the Chief Product Officer"* — an existing
  product executive, so neither first nor alone, and the row's headline claimed
  "no product team on the board". The other was a genuine first PM for one
  product line at a company whose same feed already listed a Product Manager,
  Enterprise. The same run *did* run the scan on other rows — "zero research
  titles across 42 open roles" — so this is a check applied unevenly rather than
  one nobody thought of. Apply it to every row that leans on the word, and put
  what the scan found in the row's facts.

  This generalises past hiring: sole ownership, "the only X in the country", "the
  first to do Y" are all claims about a population, and a population claim is
  never evidenced by one member of it.
- **Every row carries dated, linked evidence, and says which kind it is.** There
  are two kinds and they are not interchangeable:
  - **Words** — the buyer describing the work or the problem: a complaint, a
    review, a forum post, an interview answer, a job ad whose description of the
    work was written by the employer.
  - **An event** — something dated that happened to them: an acquisition, a new
    office, a new person in the seat that owns this work.

  Words are stronger, and for some buyers they do not exist in public at all,
  because admitting this particular mess is unflattering or reportable. When the
  words are not there, **ship the event as an event.** Do not go back to the
  press release and lift a sentence to fill a quote field: "It advances our
  long-term strategy" in the place a reader expects the buyer's own words reads
  as evidence and is not. A list whose rows are honestly labelled events is worth
  more than one that dresses events as complaints, because the first call
  discovers the difference.
- **Nothing a vendor wrote is buyer voice, whoever is hosting it.** Testimonials
  on the subject's site, its case studies, its competitors' marketing pages: all
  of it was chosen to sell and most of it is undated. Two disguises worth
  knowing, both found in rehearsal: **a job ad assembled from a vendor's
  published template** is that vendor talking, and the tell is the ad naming the
  vendor's product in its requirements; and **the same ad reposted by three
  agencies** is one copywriter, not three buyers, so count it once. It cannot confirm gate 4 —
  it was selected by the person the gate is being derived for — and quoting it
  back to the subject, who wrote it, is the fastest way to look like you found
  nothing. If a vendor-curated quote is the only corpus available, say that the
  corpus is vendor-curated and treat it as weak.
- **Quote minimally, link always, and record the date you saw it.**
- 🔴 **An unknown value must never buy a row more than a bad value would.** This
  is the one that gets past every other rule, because it does not look like a
  gate failure — it looks like an honest limitation. A row whose date cannot be
  found is not "timing unknown, fit strong"; it is a row that has walked around
  gate 1 without being measured. If the real date would have failed the window,
  the missing date fails it too.

  So before writing "undated", go and look properly. **A page that displays no
  date usually still carries one**, and it is reachable without a browser:
  a CMS payload in the source (Contentful, Sanity and the Next.js RSC blob all
  embed `createdAt` / `updatedAt`), JSON-LD `datePublished`, an Open Graph
  `article:published_time`, a `<time>` element, the sitemap's `lastmod`, or the
  feed the page is also published in. In a recorded run, two rows shipped in an
  "evidence carries no date" group; the source of both held a CMS `createdAt`,
  and the stories were 14 months and **2.75 years** old against a 120-day window.

  And when a page genuinely has no date anywhere, read the *kind* of page: a
  vendor case study, a docs page, a customer story is evergreen — written once
  and left up for years. **Presume it is old, not recent.** Say "no date
  published, and this kind of page is usually years old" rather than "timing not
  checkable", which reads to the operator as a coin flip.

  The same asymmetry applies to every other gate. An unknown company size is not
  inside the band. An unconfirmed employer is not a confirmed one. Where the
  unknown is worth shipping anyway, ship it in a section that says what is
  missing and what it would most likely be.
- **A date is only as precise as the page that gave it.** Platforms that label a
  post "2w" or "1mo" are handing you a range, not a day: render it as one — "30
  to 59 days old, read on <date>" — and never write it as an exact date with a
  tilde in front, which reads as precision the source never had. Where a single
  field must hold one date, use the **oldest** day the label allows: erring older
  understates a signal, erring newer manufactures freshness, and freshness is
  what the operator is trusting you on. Same discipline for the link: if it
  resolves only for a signed-in viewer, or is a search for the sentence because
  the platform publishes no permalink, say that beside it.
- Never write that a prospect is interested, needs the product, or will buy. The
  correct label is *a potential customer based on a public signal*.
- Separate observed fact, inference, and recommendation in the output. Mark
  inferences as inferences.

## What a corpus entry looks like

| field | note |
|---|---|
| quote | the speaker's words, minimal |
| speaker segment | which kind of organisation they speak for — the axis Rule 6 in `channels.md` is read against |
| source kind | buyer voice, or vendor-curated |
| date | of the quote |
| source link | resolves to the exact item |

## What a row looks like

| field | note |
|---|---|
| name | |
| profile link | the public surface where the signal appeared |
| company | |
| domain | verified to load |
| evidence kind | `words` or `event` — see evidence discipline |
| quote | their words, minimal; empty when the evidence is an event |
| date | of the quote or the event, not of the harvest |
| source link | resolves to the exact item |
| contact | tier, the name and role when known, and the route itself |
| contact source | the page the route was read off, so it can be checked |
| lane | which channel and which query |
| gate 4 result | what was found and where |
| score | six axes, separately; purchase likelihood first |
| why now | one sentence, grounded only in the quote |

## Honest labelling of what the gates prove

The gates prove the company is in a given state and that a human conversation is
part of how they sell. **They do not prove the company wants the product.** Say
this in the output. A list that overclaims is worth less than a short one that
does not, because the operator will discover the overclaim on the first call and
stop trusting every other row.
