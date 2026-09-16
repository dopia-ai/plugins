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
2. **A resolvable company domain.** It must actually load (see `extraction.md` for
   the fallback chain before you fail a row on this).
3. **Company size inside the target band.** From the site's team page, the
   registry's own field, or an explicit self-description.
4. **The derived check from Phase 2.** This is the gate that decides list quality.
   It is different for every product. Write it into the output header verbatim so
   the operator can see what was applied.
5. **The person is the decision-maker, not an employee or an agency acting for
   them.** A post by a rep about their employer does not qualify the employer.
6. **Not a farming or dormant account.** See disqualifiers.
7. **Not a peer.** Anyone who sells what you sell, or sells services around it, is
   out — they will read the outreach as competitive research.
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

**Never invent an address.** No `first.last@domain` permutations, no pattern
guessing off one known address, no data broker. A guessed address is not a
contact — it is a bounce that costs the operator their sending reputation, and
it makes the row a lie. If the real one cannot be found, say so and drop the tier.

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

## Scoring the survivors

Score only what survives. Five axes, and report them separately rather than as one
number — a blended score hides which axis is weak.

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
| score | five axes, separately |
| why now | one sentence, grounded only in the quote |

## Honest labelling of what the gates prove

The gates prove the company is in a given state and that a human conversation is
part of how they sell. **They do not prove the company wants the product.** Say
this in the output. A list that overclaims is worth less than a short one that
does not, because the operator will discover the overclaim on the first call and
stop trusting every other row.
