# Phase 3 — Deriving and classifying channels

## Rule 1 — Prefer structured registries over search

Search infers qualification from prose. A registry reads it off a field. When a
platform has already done the qualification for you, the hit rate is not slightly
better, it is an order of magnitude better.

The strongest instance observed: an accelerator's own job board, filtered to sales
roles. The word **"Founding"** in a job title *is* the evidence that the founder
has been selling personally and is now handing it off. The batch or cohort code
gives company age and size for free. The accelerator has already verified the
company exists. One screen returned fourteen companies, essentially all of which
passed the size, motion and founder-led gates, versus single-digit hit rates from
keyword search on the same ICP.

So the derivation question for channels is not "where do they talk about this"
but **"who already keeps a list of people in this state, and does that list have a
field that encodes my gate?"**

Candidates to consider, in roughly descending structure:
accelerator and portfolio job boards · applicant-tracking job feeds · launch
directories · funding announcements · marketplace and integration directories ·
public tender or filing registries · conference speaker and attendee lists.

## Rule 1b — Hire the job ad: someone is being paid to do what the product replaces

Every product that replaces manual work has buyers who are, right now, advertising
for a human to do that work by hand. The ad is written inside the buying
organisation and it describes the workload in the terms the work actually has,
because it has to attract a candidate. For buyers who never complain in public —
regulated back offices, compliance, finance operations, anyone for whom admitting
the mess is unflattering or reportable — this lane is the substitute for the
complaint.

**Bind the work-words to something only an ad has.** The work-words alone are the
category's own SEO keywords: rehearsals that searched `"schedule technicians"
"create invoices"` and `keep customer records accurate and up to date` came back
with job-description template libraries, one of them published by the subject's
biggest competitor. Bind them to one of:

- **a host restriction** to where ads live — the only thing that produced named
  employers in either rehearsal;
- **a role title**, which separates an ad from an article about ads. Titles are a
  filter on the work-words, not a search of their own;
- **the regulated artefact the work produces**, where the work produces one:
  `RTI`, `CIS`, `auto-enrolment`, `P32`, `I-9`, `CE marking`. An artefact name
  cannot be paraphrased, so it never matches boilerplate, and it usually settles
  gate 4 and the geography in a single token.

**Where to search, best first. Probe the order against the occupation before
trusting it:**

| Source | Why, and what went wrong |
|---|---|
| The ATS hosts employers of this size actually use, searched with a host restriction — which hosts those are depends on the market: Paylocity and Gusto for US small employers, Ashby, Lever and Greenhouse for venture-backed startups, national boards elsewhere | Primary source, published under the employer's own name. This produced the only named employers in both rehearsals. **Check for the board's feed before reading its pages** (`extraction.md`): the feed carries the posting date and proves the ad is still live, which the page usually does not. Expect client-rendered pages and 403s otherwise |
| The employer's own careers page | Same fidelity, no discovery: you need the name first, so it confirms rather than finds |
| The buyer's professional body's job board | Strong where the occupation is licensed and employers post directly. Two rehearsal failures: in an agency-intermediated occupation the ads are posted by recruiters with the employer stripped out, and in the trades the body fragmented into dozens of chapter boards with no public feed. Probe it; do not lead with it |
| Keyword search on job aggregators | Loose matching, agency reposts, expired ads still rendering. Corpus at best |

**Two things this lane does not reliably give you.**

- **A date, from the page.** Seven small-employer ads opened in rehearsal carried
  no posted and no closing date in the ad body. The board's feed usually has one;
  where there is none, the dated fact available is that the ad is *currently
  listed* on a board that removes closed ones — record it that way, with the date
  you read it, or the row cannot clear gate 1. Search results are the worst
  source for this: in one run, 14 of 40 ads a search index still showed had
  already been taken down.
- **A route to a human.** An agency-posted ad names no employer by design, and
  the better the mandate the likelier it was placed through an agency: the
  rehearsal's best evidence sentence ("approximately 180 clients") was on an
  anonymised ad. Those are corpus — excellent vocabulary, no identity — not
  leads.

## Rule 2 — Identity is suppressed when the pain is unflattering to the speaker

The variable is not anonymity. It is **whose fault the problem looks like.**

Admitting that your own operation is a mess is unflattering, so people say it only
where their name is detached. Complaining about a vendor you pay is not
unflattering at all, so people sign it — and a marketplace that ties reviews to a
verified account will print the reviewer's business name next to the grievance.

That second case is the exception worth hunting: it gives identity and strong pain
in the same row, which is otherwise rare.

| Channel shape | Gives | Lacks | Use as |
|---|---|---|---|
| Structured registry (job boards, launch directories) | company, role, date, often size | pain inferred from the field | **lead source, highest density** |
| **Marketplace reviews of a competing product** | **business name, rating, date, tenure, verbatim complaint** | nothing important | **lead source, highest signal** |
| Identity platform, event keywords | person, company, date | pain inferred | lead source |
| Identity platform, keyword-CTA commenters | person, declared interest | company needs a second lookup | lead source |
| Pseudonymous community, pain keywords | strong pain, dated | no identity | corpus source |
| Review sites aimed at buyers of internal tools | strongest pain, segment, industry, date | identity anonymized | corpus source |

The last two rows and the marketplace row look similar and behave completely
differently. The test is whether the complaint reflects badly on the complainer.
An internal-tooling review site anonymizes because "our team never adopted it"
implicates the team. A merchant marketplace does not, because "this app
double-charged me" implicates only the app.

Classify every derived channel before harvesting, and say so in the output. Mining
a corpus source for names wastes the run; mining a lead source for messaging
produces bland copy.

## Rule 3 — On identity platforms, search events, not pain

Pain keywords surface people who sell the solution, because posting about a
problem is a marketing move. Event keywords surface people who have the problem,
because announcing a hire, a launch, a first customer, or a raise is expected and
flattering.

Event vocabulary that has worked: `hiring our first` + a sales role · `closed our
first` · `signed our first` · `our first paying customer` · `our first N
customers` · `we just launched` · `out of stealth` · `just raised our pre-seed`.

One event shape reaches beyond startups: **the person who owns the thing your
product manages has just changed.** A new company secretary inherits every
signatory list; a new CISO inherits the access reviews; a new head of payroll
inherits the pay runs. The first months in the seat are when the inherited
process gets looked at. Derive the role from what the product manages, then
search appointment vocabulary for that role.

**Its scope, and it is narrow.** The shape works only where the employer is big
enough for the appointment to have an audience. Below that nobody announces who
now owns the dispatch board, and searching for it returns the largest employers
in the market — which for a product sold to small ones selects exactly against
the ICP. Two rehearsal failures mark the edges:

- **A deal is not an appointment.** When the event is an acquisition, its
  audience is advisers: searching it returned M&A firms and private-equity
  commentary and not one principal. That is Rule 3's own failure mode wearing an
  event keyword.
- **Where the buyer is too small to announce a person, the institution-shaped
  version can still work**: the *book* changed hands, not the seat — a practice
  acquiring another practice's payroll clients, a group absorbing a firm whose
  back office it now owns. Apply the same advisor-noise test before trusting it.

Bind a context word to anything ambiguous, and exclude the domains that share your
vocabulary. Words like "first" pull in trading and finance content.

## Rule 4 — Commenters inherit the author's audience

Harvesting the people who reply to a post with a requested keyword is a strong
lane, but only when the author sells to your buyer. The same mechanic returned
mostly founders under a post written by a founder addressing founders, and
returned almost entirely agencies and consultants under a post written by an
agency addressing sales teams.

So select posts by **who the author's customers are**, not by the post's topic.
Check the author's bio and site first. Then harvest, then apply the disqualifiers
in `gates.md` — burner accounts show up in these comment sections and are cheap to
filter.

## Rule 5 — Pick the community the buyer lives in, not the one the topic lives in

A forum named after your product category is full of people building products in
that category. The buyers are in their own trade community. Searching the category
forum returned builders and market researchers; searching the trade community
returned owners describing exactly the problem, with dates.

Derive the community from the buyer's occupation, never from the product's noun.

## Rule 6 — Label every corpus quote with who is speaking

The loudest voices on a pain are often the ones with no budget for it. A run for
a signatory product collected its most vivid quotes from a parent-teacher
association and a town council: real pain, no purchase.

So record the speaker's segment next to every corpus quote — a corpus entry is
the quote, the speaker's segment, the date, the link, and whether it is buyer
voice or vendor-curated — then read the corpus back and ask whether the segments
that dominate it are ones the subject actually sells to.

**Arbitrate against the customer list, not against your ICP hypothesis.** The
hypothesis is twenty minutes old; the customer list is evidence. A rehearsal
against a payroll product would have discarded the parish-council voices as
having no budget, while the subject's own case studies featured a one-employee
burial board and a seventeen-person charity. Where the two disagree, the customer
list wins and the ICP hypothesis is what needs editing. Where a segment appears
in neither, its quotes are vocabulary only and must not steer the messaging; say
so in the output.

## Budget

Spread the run across at least one structured registry, one identity-platform
lane, and one corpus source. A run that uses only search has no floor on quality;
a run with no corpus source has no way to check whether gate 4 was derived right.
