# Phase 2 — Deriving the qualification criteria

This is the step that separates this skill from a template. Every other
prospecting tool starts at "who is the buyer" and jumps straight to keywords.
Starting there produces a demographic list, which is the same thing you can buy.

## The chain

```
product value
  → what must be true of a company for that value to land
    → the publicly observable proxy for that condition
      → the cheapest check for that proxy
```

Run it out loud, writing each arrow's reasoning down. The written chain goes in
the output header so the operator can argue with it.

## Worked example — a CRM that remembers relationships

- **Value**: it remembers each customer relationship so nothing goes cold.
- **Condition**: the company must *have* individual relationships worth
  remembering. A business with five thousand self-serve signups at a low price has
  no individual relationships; its problems are conversion and cohort churn, and
  remembering conversations does nothing for it.
- **Proxy**: relationships exist when a human conversation happens before money
  changes hands.
- **Check**: does the site have a "Book a demo" / "Talk to sales" / "Book a call"
  entry point? One page load, binary answer.

Note what this check does that a revenue or price threshold would not: it catches
the expensive-but-fully-self-serve product, which a price threshold would wave
through, and it admits the cheap-but-high-touch business, which a price threshold
would wrongly reject. **Price is a proxy for ability to pay, and ability to pay is
almost never the binding constraint.** Derive from what makes the value land.

## Worked example — uptime monitoring

- **Value**: it tells you when your service breaks before customers do.
- **Condition**: they must run a live service that can break, and care.
- **Proxy**: a reachable production application, ideally with a status page.
- **Check**: resolve the app URL and look for a status page or a login screen.

## Worked example — an invoicing product for freelancers

- **Value**: it gets you paid faster with less admin.
- **Condition**: they must bill multiple clients on a repeating cycle themselves.
- **Proxy**: a public "work with me" or rates page, or a portfolio listing several
  named clients.
- **Check**: does the site sell the person's time rather than a product seat?

## How to tell a good derivation from a bad one

A good check is **binary, cheap, and observable from outside**. If the check
requires guessing, requires a number you cannot see, or requires the prospect to
tell you something, go back one arrow and find a different proxy.

Test the chain backwards before using it: take three companies you are confident
are a fit and three you are confident are not, and run the check on all six. If
the check does not separate them, the proxy is wrong. This costs six page loads
and it is the cheapest insurance in the whole run.

🔴 **One of the three non-fits must be the subject's most direct competitor.** A
competitor is never what comes to mind as an obvious non-fit — they look like the
best fit in the world, because they live in the same problem all day. That is the
trap. **If your derived gate 4 passes a company that sells what the subject
sells, the gate describes the category and not the need**, and the run will
spend its whole budget harvesting the subject's own neighbours.

In a recorded run for a product that turns rough internal-app requests into
build-ready specs, gate 4 came out as "names an agentic coding tool as part of
how they build, AND has work arriving from people who will not build it". Every
AI delivery consultancy on earth satisfies both halves perfectly. Four of the
fourteen rows shipped were agencies selling requirements-to-agent-instructions as
their own billable line. One competitor run through the check in Phase 2 would
have caught it before a single search.

## A derived gate needs a negative half

The chain above produces a check for **who has the problem**. On its own that
ships rows for companies who have the problem *and have already solved it*. Add a
half that proves the problem is still open for them, from the same public
surfaces you are already reading.

- **CRM that remembers relationships**: positive half is a human sales entry
  point plus a dated sign the founder still closes. Negative half: *no* RevOps,
  Sales Ops or CRM-admin role in their open postings, and no sales team over
  five. One extra read of a job board you already pulled.
- **Internal-app specs for coding agents**: positive half is agents in the
  delivery path plus a request-to-build boundary. A negative half would ask
  whether they publish a planning or spec practice of their own — which is
  exactly what every consultancy that got through does publish.

The negative half is also the cheapest competitor filter you will ever write,
because a company that sells the solution always publishes the solution.

Name what the negative half costs you: it will reject some companies who solved
it badly and would switch. Keep those as a labelled group rather than losing
them — `gates.md` says how the three "already solved it" states differ, and only
one of them is worthless.

## Prefer a proxy that names a person

Two proxies can be equally true about a company and produce lists of completely
different value, because of what satisfying them leaves you holding.

- **"The founder still closes every deal"** is a statement about a *person*.
  Checking it hands you the human, their role and usually their profile in the
  same act. Gate 8 is already satisfied when gate 4 passes.
- **"They use coding agents and take requests from non-builders"** is a statement
  about a *company*. Checking it hands you a domain. Finding a human is then a
  second research task, done page by page on about-pages, after the evidence is
  already in hand — and it is the step with nothing riding on it, so it is the
  step that gets guessed at.

Two recorded runs, same skill, two days apart: the person-anchored derivation
shipped 29 of 30 rows with a direct route to a named human. The company-anchored
one shipped 4 of 14, and most of the run's factual errors were in the contact
block.

So: **when two proxies would separate the population equally well, take the one
whose subject is a human.** Where the buyer genuinely never surfaces as a person
— a product bought by an anonymous committee, or one whose users never post —
the company-anchored proxy is the right call and there is no better option. Then
say so in Phase 3, and budget real time for gate 8 instead of treating it as a
lookup at the end.

## The corpus is how you check yourself later

Corpus-source channels (see `channels.md`) return the buyer describing the problem
in their own words. Read those quotes against your derived condition. If nobody in
the corpus is describing the condition you derived, you derived the wrong one.
Quotes also hand you the trigger vocabulary: a review saying "upgrading to the
higher plan was the worst decision we made" tells you that *a recent plan upgrade*
is a trigger worth searching for on a lead-source channel.
