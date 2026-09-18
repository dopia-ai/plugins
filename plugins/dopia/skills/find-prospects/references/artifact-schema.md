# Phase 7 — The artifact payload

When the host has an artifact tool, emit this object. **Do not render HTML or
markdown.** The renderer belongs to whoever hosts the page: it owns the design,
the conversion surface, and the re-render when the design changes. Your job is to
carry enough structure that the page never has to guess.

The field names below are a contract with a live renderer. A field spelled
differently is a field that silently does not appear. Copy the keys exactly.

## Design intent

The reader is the **subject** of the report, opening a link cold, and they came for
one thing: who should I talk to and what is going on with them.

**Everything about how the run was done stays off the page.** How many lanes were
run, how many candidates were discarded, why the window is what it is, the
derivation chain, the query log — all of that is the producer's concern. Put it
under `provenance`, which the server strips before the page is served. A page that
explains its own method is a page defending itself to someone who never doubted it.

What the reader gets, in this order: who these people are, what each one said and
when, the concrete facts about their situation, the opening for each, and then what
buyers in this segment keep saying. One short honest line at the very bottom. That
is the whole page.

The test for any field: **would the reader act differently if they saw it?** If the
answer is no, it belongs in `provenance`.

## The call

```
create_artifact(
  kind         = "prospect_list",
  title        = "Potential customers for VanChat",
  subject_name = "VanChat",
  subject_url  = "https://vanchat.io",
  payload      = { ...the object below... }
)
```

`title`, `subject_name` and `subject_url` are arguments of the call, **not** fields
inside `payload`. The page header reads them from there. Putting them in the
payload as well is the most common way to end up with an untitled page.

## payload

```json
{
  "headline": {
    "verdict": "One sentence about the prospects. Never about the effort that found them.",
    "facts": [
      "39 Shopify merchants",
      "26 still running the tool they complained about",
      "12 blame the AI itself: wrong answers, loops, no way to switch it off",
      "Complaints dated April to September 2026"
    ]
  },

  "groups_intro": "One line saying how the list is ordered. Without it the reader has to reverse-engineer the sort from three group headings.",

  "verification": "How the rows were checked, and when. One sentence. It renders small, beside the disclaimer, at the bottom.",

  "groups": [
    {
      "key": "still_using",
      "label": "Still running the tool they complained about",
      "angle": "One line on what makes this group a different conversation from the others.",
      "row_ids": ["r1", "r2"]
    }
  ],

  "rows": [
    {
      "id": "r1",
      "company": "ART o LUNA",
      "domain": "artolunagallery.com",
      "profile_url": "https://artolunagallery.com",

      "contact": {
        "tier": "person_via_company",
        "name": "Luna Martens",
        "role": "Owner",
        "email": "hello@artolunagallery.com",
        "profile_url": "https://www.linkedin.com/in/…",
        "source_url": "https://artolunagallery.com/policies/contact-information",
        "note": "Address published on the store's own contact-information page."
      },

      "headline": "One line: who they are and why they are on this list.",
      "evidence": {
        "quote": "Their words, trimmed to the part that carries the pain.",
        "quote_date": "2026-04-28",
        "source_url": "https://apps.shopify.com/...#review-id",
        "source_label": "Shopify App Store review, 1 star, after 6 months"
      },
      "facts": [
        { "label": "Platform", "value": "Shopify" },
        { "label": "Chat vendor", "value": "Tidio, still installed" },
        { "label": "Catalogue", "value": "~400 SKUs" }
      ],
      "opening": "One sentence you could actually send, grounded only in the quote and the facts."
    }
  ],

  "market_signal": {
    "intro": "One line framing what follows.",
    "themes": [
      {
        "theme": "Answer quality",
        "quotes": [
          {
            "text": "...",
            "source_label": "Shopify App Store review",
            "date": "2026-03-11",
            "source_url": "https://..."
          }
        ]
      }
    ]
  },

  "disclaimer": "One or two sentences. What was not verified, stated plainly.",

  "provenance": {
    "method": {
      "chain": [
        { "step": "Value", "text": "..." },
        { "step": "Condition", "text": "..." },
        { "step": "Proxy", "text": "..." },
        { "step": "Check", "text": "..." }
      ],
      "gate": "The derived check, verbatim, as it was applied.",
      "window": { "days": 120, "why": "Why this window and not thirty days." },
      "counter_example": "The check that would look obvious here and would be wrong, and why.",
      "corpus_check": "Whether the harvested quotes confirm the derived condition."
    },
    "coverage": {
      "lanes_run": ["Marketplace reviews of competing apps"],
      "lanes_derived_not_run": ["Merchant trade communities", "Event keywords"],
      "queries": [
        { "lane": "...", "query": "...", "surfaced": 10, "survived": 4, "note": "" }
      ]
    },
    "rows": [
      {
        "id": "r1",
        "scores": { "buy": 4, "signal": 4, "recency": 3, "fit": 5, "reachability": 4, "evidence": 5 },
        "confidence": "verified"
      }
    ]
  }
}
```

## Field notes that matter

- 🔴 **`headline.facts` are facts about THE PEOPLE, never about the run.**
  Count, composition, what they are complaining about, how fresh it is — four
  chips that let a reader size up the batch at a glance. "Every row links to a
  dated public review" and "each storefront checked on 13 Sep" are *true* and
  they still do not belong here: they are the page defending itself to someone
  who never doubted it, and each one spends a chip the reader needed for
  something about themselves. Those two sentences go in `verification`.
- **`rows[].id` is the join key.** Every id in a group's `row_ids` must exist in
  `rows`, or that card is dropped without an error. A row not named by any group is
  never rendered — there is no "ungrouped" bucket.
- 🔴 **`contact` is what makes the row a prospect rather than a lead to research.**
  `tier` is one of `person_direct`, `person_via_company`, `company_only` — see
  gate 8. At least one of `email` and `profile_url` must be present, and
  `source_url` must be the page it was read off so the reader can check it.
  Never a guessed address. A row that cannot carry this does not belong in
  `rows`; a reader who has to go and find the human themselves has been handed
  the work back.
- **`facts` is what proves the gate was run on this row**, not on the batch. Put
  the actual observed values there — the platform detected, the vendor found, the
  stack seen. A row with a quote but no facts reads as scraped.
- **`company` is the card's heading.** For a person-led row put the person where the
  reader expects a name and carry the employer in `facts`; do not leave the heading
  blank.
- **`evidence.quote_date` is one day, so an approximate date needs care.** Put
  the oldest day the source allows in the field and carry the real precision in
  `source_label` ("LinkedIn post, 30 to 59 days old when read"). A range rendered
  as a single fresh-looking date is the one lie the page cannot recover from.
- **`evidence.source_url` should deep-link to the quote** where the platform allows
  it, not to the site's front door. "See it" that lands on a homepage is worse than
  no link.
- **`disclaimer` is a string, not a list.** Two honest sentences beat five hedges.
- **Scores and confidence live in `provenance`.** They are how you defend the list
  to the operator, not what the subject reads. `provenance` never reaches the page.
- **No call to action, no styling, no markup.** The conversion surface belongs to
  the host page. A payload that carries its own CTA is a payload that lets an
  external client write on someone else's landing page.

## Before you call

### Structure — these four fail silently rather than loudly

1. Every `row_ids` entry resolves to a row.
2. `title` / `subject_name` / `subject_url` are call arguments, not payload fields.
3. Method, coverage, scores and query log are all under `provenance` — and no
   chip in `headline.facts` describes how the run was done.
4. No field contains HTML tags or markdown syntax.

### Content — these four fail loudly, in front of the reader

A payload can pass every structural check, render perfectly, and still be wrong
in the only ways the reader will notice. Structural errors are invisible until
someone looks; these are invisible until someone *checks*, which the reader does
for free with one click.

5. **No row is a peer.** Read the list back and ask of each: does anyone pay them
   to do this? One competitor discounts every other row on the page.
6. **Every `headline.facts` chip is recomputed from `rows`**, not carried over
   from an earlier draft. A chip claiming a size band when rows span 8 to 600
   people is the kind of thing a reader checks first, and it is usually stale
   arithmetic from before rows were cut.
7. **`verification` claims only what a gate actually enforced.** It is the one
   field that makes a promise about the work, so it is the one a reader tests. If
   no gate verified contact routes, `verification` does not say they were all
   read off their own pages.
8. **Every `evidence.source_url` and `contact.source_url` resolves to the thing
   it claims.** Deep-link, not a homepage; and any quote trimmed mid-sentence
   carries a visible ellipsis, so a reader who opens the source finds what they
   were shown.
