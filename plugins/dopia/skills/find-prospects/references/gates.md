# Phase 5 — Gates, disqualifiers, scoring

## The seven hard gates

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
- **Reachability** — is there a public surface where a reply is normal?
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

- **No quote, no row.** A prospect without a citable sentence is a guess.
- **Quote minimally, link always, and record the date you saw it.**
- Never write that a prospect is interested, needs the product, or will buy. The
  correct label is *a potential customer based on a public signal*.
- Separate observed fact, inference, and recommendation in the output. Mark
  inferences as inferences.

## What a row looks like

| field | note |
|---|---|
| name | |
| profile link | the public surface where the signal appeared |
| company | |
| domain | verified to load |
| quote | their words, minimal |
| date | of the quote, not of the harvest |
| source link | resolves to the exact item |
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
