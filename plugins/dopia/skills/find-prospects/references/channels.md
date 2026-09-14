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

## Budget

Spread the run across at least one structured registry, one identity-platform
lane, and one corpus source. A run that uses only search has no floor on quality;
a run with no corpus source has no way to check whether gate 4 was derived right.
