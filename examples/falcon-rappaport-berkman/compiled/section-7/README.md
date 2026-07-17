> **Note:** This folder is a worked demonstration of turning the autonomous-agent provisions of the [FRB Generative AI Policy](../../frb-generative-ai-policy.md) (Version 2.0, effective June 18, 2026) into machine-checkable rules with cryptographic decision receipts. It accompanies, and does not modify, the adopted policy. Not legal advice; see the repository [README](../../../../README.md).

# Governing Fully Autonomous Agents: Compiling Section 7

When an AI tool has a human in the loop, the human is the control: a person sees each action before it happens, and the policy is enforced by the person clicking. The unsolved problem is the other half of Section 7, the provisions that govern agents acting **autonomously**, when nobody is watching. An agent reaching for a privileged document mid-task, an unattended job running against client data overnight, one agent handing work to another. There is no click to intercept and no person to notice. Either a machine checks these rules before the action executes, or they are enforced only in retrospect.

This folder demonstrates that check on Section 7's autonomous-agent provisions, compiled **verbatim** (no paraphrase, no restatement) into formal logic using [ICME Preflight](https://docs.icme.io), then exercised with live decisions that each produce an independently verifiable cryptographic receipt.

A useful property of these provisions: every fact they need already exists as a record somewhere in a firm. No new interface, no approval popup, no workflow to build. Enforcement is wiring existing facts to a checkpoint.

## In plain English

- The Firm's policy already sets rules for AI agents that act on their own: get consent before using them, don't touch privileged or confidential material without permission, don't run unsupervised tasks on client data unless approved and set to stop on errors, and don't hand work from one AI tool to another without approval.
- We took those sentences, word for word, and turned them into a working check. Before an agent acts, the system answers "allowed" or "blocked" based on the policy.
- We ran eight live tests, two per rule: one that should pass and one that should be blocked. All eight came out correctly, including an agent being stopped from reading a privileged document without authorization.
- Every decision comes with a cryptographic receipt, like a notarized record proving which rule fired, against which facts, at what time. Anyone can verify a receipt later without trusting us or any vendor.
- Nothing changes for attorneys and nothing new needs to be clicked. Every fact these rules rely on (consent records, document labels, approvals, tool settings) already exists in the Firm's systems.

## The rules, verbatim

Sentence 1 and sentence 3 of Section 7, plus the Section 2 definition, character-for-character from the adopted policy:

> "Obtain prior written consent from the Administrator before using any Agentic AI Tools."

> "Prohibited uses include: autonomous access to Sensitive Information without authorization; unattended tasks involving client data unless Firm-approved and configured to halt on error; and chaining multiple Agentic AI Tools without written approval."

> "**'Sensitive Information':** Client Confidential Information, Firm proprietary information, personal data, Material Nonpublic Information ('MNPI'), and any information subject to privilege or work product protection."

That is four enforceable rules in one compiled policy:

| # | Rule | Plain reading |
|---|---|---|
| 1 | **Consent** | No agentic tool use without the Administrator's prior written consent |
| 2 | **Sensitive Information** | No autonomous access to Sensitive Information without authorization |
| 3 | **Unattended tasks** | No unattended client-data tasks unless Firm-approved *and* configured to halt on error |
| 4 | **Chaining** | No chaining multiple agentic tools without written approval |

(Section 7's remaining sentences, the human-confirmation requirement and the cease-and-report procedure, are deliberately out of scope here: the first is governed by the human it puts in the loop, and the second is a procedure rather than a checkable condition.)

## What it compiled to

The full compiled output is in [`autonomous-agent-rules.smt2`](autonomous-agent-rules.smt2) (SMT-LIB, the standard input format for formal verification solvers): 20 typed variables, 17 logical assertions. Highlights:

- The Section 2 **definition became logic**: six category facts (client-confidential, firm-proprietary, personal data, MNPI, privileged, work-product), each tied to *Sensitive Information* in both directions.
- The unattended-task rule compiled as a true **conjunction**: Firm approval *and* halt-on-error configuration are independently required; either missing blocks the task.
- Each prohibition anchors an "allowed" verdict equal to its authorization fact. Permission *is* the record: `chaining allowed = written approval exists`.

A decision is requested by submitting the facts of a proposed action; the solver returns **SAT** (consistent with the policy, permitted) or **UNSAT** (contradicts the policy, blocked), plus a proof ID for a zero-knowledge proof of the decision.

## The facts, and who asserts them

The compiled rules do not decide facts; they enforce on facts asserted by authoritative systems. Every fact below is a record. None requires a human present at decision time:

| Fact (compiled variable) | Asserted by |
|---|---|
| An Agentic AI Tool is in use; the session is autonomous / the task is unattended | Identity/SSO and agent session or scheduler configuration |
| Prior written consent from the Administrator exists | The Administrator's approval records, kept as queryable entries rather than email |
| The target is Sensitive Information (and which category) | The document management system's classification labels |
| Authorization for the access exists | Approval records |
| The task involves client data | Matter/DMS scope of the task |
| The task is Firm-approved; configured to halt on error | Approval records; tool configuration (Appendix A, maintained as data) |
| Multiple agentic tools are chained; written approval for chaining exists | Orchestration configuration; approval records |

The checker never inspects a document to judge whether it is sensitive. **The document management system's label is the truth**, and the rule is pure logic over it. Sensitivity classification stays exactly where a firm wants it: in its DMS, under its control.

## Verified decisions: a permitted and a blocked case per rule

Eight live decisions were run, two per rule. Full receipts (check IDs, proof IDs) are in [`receipts.json`](receipts.json).

| Rule | Scenario | Decision |
|---|---|---|
| Consent | Tool used; prior written consent on record | **Permitted** (SAT) |
| Consent | Tool used; no consent record | **Blocked** (UNSAT) |
| Sensitive Info | Autonomous access to a privileged document; authorization on record | **Permitted** (SAT) |
| Sensitive Info | Same access; no authorization | **Blocked** (UNSAT) |
| Unattended | Unattended client-data task; Firm-approved and halt-on-error configured | **Permitted** (SAT) |
| Unattended | Firm-approved but **not** configured to halt on error | **Blocked** (UNSAT) |
| Chaining | Two tools chained; written approval on record | **Permitted** (SAT) |
| Chaining | Same chain; no approval | **Blocked** (UNSAT) |

Two rows deserve a note. The unattended blocked case has approval *present*: it is blocked solely because halt-on-error is missing, demonstrating that the compiled conjunction enforces both conditions, not just "no permission means no." And the sensitive-information blocked case is the scenario this whole exercise exists for: an agent, mid-task, autonomously reaching for a privileged document with no one watching.

Every decision produced a zero-knowledge proof (~93 KB) that anyone holding the proof ID can verify independently, without re-running the check and without access to the policy internals. All eight proofs are generated and confirmed valid; their metadata (policy hashes, timestamps) is recorded in `receipts.json`. Proofs are single-use for verification and have been left unconsumed so the Firm can verify them itself. This is the operational counterpart of Section 9.2's reserved monitoring and audit rights: every agent decision, permitted or blocked, leaves a tamper-evident record of *which rule fired against which asserted facts*.

## Deployment patterns

Where the check runs is an integration question, not a policy question. Three patterns, in descending order of coverage:

1. **Direct integration**: a firm-built agent calls the check before executing any tool action. Full coverage, receipts on every step.
2. **Infrastructure chokepoints**: agent actions must cross systems the firm controls (email tenant, document management permissions, filing workflows, payment systems). Routing those through a gateway that performs the check enforces these rules regardless of who built the agent. Actions completing entirely inside a third-party platform require that vendor's cooperation or a firm-side chokepoint.
3. **Provisioning and configuration**: the consent, chaining, and halt-on-error rules are naturally checked when access is granted or a task is scheduled, not per action. These are the cheapest to operationalize and produce the audit answers ("no one was provisioned without consent") firms currently assemble by hand.

The lowest-friction way to try the system without any integration is the [Preflight desktop app](https://github.com/ICME-Lab/preflight-app).

## Using this work

Everything here is public domain, like the rest of the repository. The compiled policy lives at ID `329b0614-6159-46cf-9599-a3cebd6be180`; that ID ties together the rules file, every receipt, and every proof below. Four ways to use it:

**Adopt the rules.** Any firm using the template's Section 7 can take the rules file as-is; nothing in the logic is specific to FRB except the Administrator's name, which compiles as a role. Your policy adoption and your enforcement adoption become the same step.

```bash
curl -O https://raw.githubusercontent.com/frblaw/ai-policy-templates/main/examples/falcon-rappaport-berkman/compiled/section-7/autonomous-agent-rules.smt2
```

The practical starting point is the facts table above: spend thirty minutes mapping each fact to the system that asserts it in your firm.

**Run the check.** The rules file is standard SMT-LIB and evaluates on any SMT solver, independent of any vendor. With [Z3](https://github.com/Z3Prover/z3) installed, this one free, offline command confirms the ruleset loads and is internally consistent (it returns `sat`, the 17 assertions with no contradiction):

```bash
z3 autonomous-agent-rules.smt2
```

A decision comes from adding an action's facts to the file and re-checking: a permitted action stays `sat`, a prohibited one turns `unsat`. To get a cryptographic receipt with each decision, run checks through the Preflight API instead: create an API key via `POST https://api.icme.io/v1/createUserCard` ($5 by card), then call `POST https://api.icme.io/v1/checkIt` with the policy ID above and your action's facts (about a cent per decision). The scenarios in [`receipts.json`](receipts.json) can be re-run verbatim and compared against the recorded verdicts. Compiling your own policy text costs $3 via `POST /v1/makeRules`; the full three-command walkthrough is in the [quickstart](https://docs.icme.io/documentation/getting-started/quickstart.md). An account-free per-check option also exists (`POST /v1/checkItPaid`, $0.10 via x402 payment), and the desktop app linked above needs no API knowledge at all.

**Verify the receipts.** Each decision in [`receipts.json`](receipts.json) carries a proof ID that can be checked independently, without trusting us or the Firm: with an API key, call `POST https://api.icme.io/v1/verifyProof` with the proof ID. The proofs are single-use and have been left unconsumed for exactly this purpose: the first reader to verify one consumes it, and a consumed proof is itself a record that someone checked.

**Extend it.** New rules from other sections of the policy follow the same path this folder did: compile the verbatim text, run a permitted and a blocked case, publish the receipts. Open an issue, then a pull request.

The pattern generalizes past this policy: any rule whose facts exist as records can be enforced this way.

## Limitations and observations

- **Structured facts over prose.** Test decisions here submitted facts as natural language, from which the service extracts variables. Extraction proved sensitive to phrasing: negated or implicit facts were sometimes dropped unless stated explicitly, and several checks required rephrasing before both verification engines agreed. This does not affect the compiled rules; it reinforces the design point that production integrations should submit facts as structured values from the source systems above, not as narrative.
- **Scope.** The human-confirmation sentence of Section 7 was also compiled and tested during this work but is presented separately from this artifact: its enforcement runs through a human-facing confirmation interface, which is an integration project of a different kind. The cease-and-report sentence is a procedure; operationalizing it as a standing "incident flag" that denies all agent actions until cleared by the Administrator is a natural extension beyond the policy's literal text.
- **Generality.** Nothing here is specific to FRB's adoption except the named Administrator. The same provisions appear in the [generic law-firm template](../../../../ai-policies/law-firm-ai-policy/law-firm-generative-ai-policy-template.md), and compile identically with "the Administrator" as a role.
