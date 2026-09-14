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

## The corpus is how you check yourself later

Corpus-source channels (see `channels.md`) return the buyer describing the problem
in their own words. Read those quotes against your derived condition. If nobody in
the corpus is describing the condition you derived, you derived the wrong one.
Quotes also hand you the trigger vocabulary: a review saying "upgrading to the
higher plan was the worst decision we made" tells you that *a recent plan upgrade*
is a trigger worth searching for on a lead-source channel.
