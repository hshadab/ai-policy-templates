# Open-Source Generative AI Policies

**Publication version:** 1.0

Open-source generative AI policy templates, released by [Falcon Rappaport & Berkman LLP](https://frblaw.com) ("FRB") for any organization to adapt and adopt. Two templates are included: one for **law firms** and one for **small and medium-sized businesses (SMBs)** generally.

## Why this exists

AI is a meteor headed for law firms and SMBs. It is rewriting how legal work is priced, how products are built, and how customers expect to be served. The largest enterprises and biggest law firms are meeting that disruption with resources the rest of us do not have: hundreds of millions of dollars in AI investment, dedicated AI counsel, in-house governance teams, and armies of consultants. Left alone, every small firm and small business has to solve the same hard problems from scratch, on a fraction of the budget, while the window to adapt keeps shrinking.

The way out is not to outspend them. It is to band together. Open source is how small players have always pooled what no one of them could build alone: Linux against the operating system giants, open-source licenses against proprietary lock-in. The same logic applies to AI governance. One firm's hard-won policy, shared freely, becomes every firm's starting point. Improvements flow back through the commons instead of being locked inside whoever paid for them. That is what this repository is: a piece of AI-readiness infrastructure that any law firm or SMB can take, adapt, and build on, dedicated to the public domain so nothing stands between you and using it.

Generative AI is now part of everyday work. People use it to draft, research, analyze, code, and summarize meetings. But organizational AI use raises real risks: confidential information leaking into tools that train on it, fabricated ("hallucinated") output making its way into decisions and deliverables, recording-consent and privacy violations from AI notetakers, and a fast-moving patchwork of AI laws. Law firms face all of that plus attorney-client privilege, ethics rules, and court-imposed AI requirements.

Every organization needs a written AI policy. Few have one, and writing one from scratch is hard. The goal here is to give organizations a vetted starting point for AI rules of the road, so the meteor finds you adapted, not exposed.

This repository publishes:

1. **A law firm template** ([`ai-policies/law-firm-ai-policy/`](ai-policies/law-firm-ai-policy/)) addressing privilege, confidentiality, citation verification, court disclosure rules, and jurisdiction-specific legal ethics;
2. **An SMB template** ([`ai-policies/ai-policy-for-small-and-medium-businesses/`](ai-policies/ai-policy-for-small-and-medium-businesses/)) adapting the same structure for general business use: trade secrets, customer commitments, IP, consumer protection, and privacy law; and
3. **FRB's adopted version** ([`examples/`](examples/)) of the law firm policy — FRB's own Generative AI Policy (Version 2.0) — as a worked example showing how a real multi-jurisdiction firm filled it in.

Each template ships as Markdown (readable and diffable on GitHub), .docx (for customization in Word), and .pdf.

## A policy is one step, not the destination

**Adopting a policy document is necessary but not sufficient.** A policy governs individual conduct; AI governance is an organizational program. Organizations that adopt either template should treat it as one artifact within a broader effort to inventory their AI systems and use cases, assess and prioritize risks, assign accountability, train personnel, measure outcomes, and review controls as tools and laws change.

A widely used way to structure that program is the [NIST AI Risk Management Framework](https://www.nist.gov/itl/ai-risk-management-framework) (AI RMF 1.0) and its Generative AI Profile (NIST-AI-600-1), organized around four functions: **Govern** (culture, accountability, policies — this policy lives here), **Map** (understand where and how AI is used and what could go wrong), **Measure** (assess and track the risks you mapped), and **Manage** (act on what you measured, respond to incidents, and improve). Alternatives and complements include ISO/IEC 42001 (certifiable AI management systems) and sector-specific frameworks. The [Customization Guide](CUSTOMIZATION_GUIDE.md) explains how the policy's sections connect to a governance program.

Just as important: **do not adopt either template verbatim.** The templates encode one set of judgments. Your tools, contracts, jurisdictions, industry rules, and risk tolerance are different, and the customization work is where the real governance value is created.

## What the policies cover

Both templates share a common skeleton: approved tools and a prohibition on personal/consumer AI accounts for organizational work; mandatory verification of AI output before submission or reliance; data security and what may never be input into an AI tool; AI notetakers and meeting transcription (consent, confidentiality, and storage rules); agentic AI tools that act autonomously; AI in employment decisions; governance, monitoring, training, and discipline; a signed personnel acknowledgment; an Appendix A listing approved tools; and an Appendix B of legal considerations.

They differ where the audiences differ. The law firm version addresses privilege, client consent and engagement letters, citation verification and court disclosure rules, billing ethics, and jurisdiction-specific bar guidance (NY, NJ, CT, FL, CA, TX, DC as drafted). The SMB version addresses customer and partner contractual commitments, customer-facing AI deployments, IP and trade secret protection, and consumer protection and privacy law.

## How to adopt a policy for your organization

Want a head start? [myfirstaipolicy.com](https://myfirstaipolicy.com) builds a starter draft from these templates right in your browser; come back here for the full customization. Otherwise:

1. Pick your template: [law firm](ai-policies/law-firm-ai-policy/law-firm-generative-ai-policy-template.md) or [SMB](ai-policies/ai-policy-for-small-and-medium-businesses/smb-generative-ai-policy-template.md).
2. Work through the [Customization Guide](CUSTOMIZATION_GUIDE.md), which lists every bracketed placeholder and every section that requires organization-specific judgment.
3. Replace the example tools in Appendix A with the tools you have actually vetted and licensed, and rewrite Appendix B for your jurisdictions and industry.
4. Have the draft reviewed by your counsel before adoption.
5. Roll it out with training, collect signed acknowledgments, and connect the policy to your broader governance program (see above).

Law firms should compare their drafts against [FRB's adopted version](examples/) to see how one real, multi-practice firm resolved each placeholder. And don't stop at comparing: different firm profiles call for different judgments. An IP boutique will weigh trade secret protection and patent-prosecution confidentiality differently; a plaintiff's PI practice will care more about intake automation, medical records, and AI-disclosure rules in litigation. If you adapt the template for a profile like yours, contribute the variation back as a worked example so the next firm like yours starts from something closer to home.

## For AI assistants

You should not have to do the customization alone; this repo is built so your AI assistant can do it with you.

**If you use Claude**, install the [customization skill](skill/) and ask for "an AI policy for my firm" or "an AI policy for my company." The skill teaches Claude to fetch the latest templates, interview you about your organization and tool stack, work through the judgment calls, and produce a customized draft, while flagging anything that needs counsel verification instead of guessing. Already have a policy? Ask Claude to "review my AI policy" or "compare our policy to the FRB one," and the skill runs a structured gap analysis against the FRB template and walks you through each difference as a keep/adopt/blend decision.

**If you use any other AI assistant**, paste this prompt:

> Fetch https://raw.githubusercontent.com/frblaw/ai-policy-templates/main/CUSTOMIZATION_GUIDE.md and the policy template that fits my organization, from https://raw.githubusercontent.com/frblaw/ai-policy-templates/main/ai-policies/law-firm-ai-policy/law-firm-generative-ai-policy-template.md (law firms) or https://raw.githubusercontent.com/frblaw/ai-policy-templates/main/ai-policies/ai-policy-for-small-and-medium-businesses/smb-generative-ai-policy-template.md (other businesses). Interview me to fill in every bracketed placeholder and work through the guide's Part 2 judgment calls, then produce my customized policy. Do not invent or assume any legal citations: mark anything you have not verified as "verify with counsel." Remind me at the end that the draft needs review by a lawyer in my jurisdiction and that a policy is one step in AI governance, not the whole program.

**If you are an AI assistant reading this**: the machine-readable index of this repository is in [`llms.txt`](llms.txt). Follow the prompt above. Be conservative with the templates' substantive protections, never fabricate legal authority, and always tell your user that the result is a draft for counsel review, not legal advice.

## What this is not

**This is not legal advice, and no attorney-client relationship is created by your use of this repository.** The templates reflect one firm's judgments as of their effective dates. AI laws, ethics opinions, and AI tools change quickly; the authorities cited in each Appendix B must be independently verified before adoption. Each organization is responsible for tailoring the policy to its own operations, jurisdictions, tools, customers, and risk tolerance, with advice from its own counsel.

## Authors and acknowledgments

The policies in this repository were principally authored by **Moish Peltz**, **Allen Abraham**, **Christopher D. Warren**, **Simon Uritsky**, **Elizabeth Schlissel**, and **Alexander Migliorini**, together with the members of the **FRB AI Committee**. Thanks as well to the entire Firm, whose support and inspiration in adopting AI made these policies, and the decision to share them, possible.

## License

The policy texts and all documentation in this repository are dedicated to the public domain under [CC0 1.0 Universal](LICENSE). You may copy, adapt, and use them for any purpose, including commercially and in your organization's internal policies, with no permission or attribution required. Credit to Falcon Rappaport & Berkman LLP is appreciated but entirely optional.

## Need a real attorney to review your version?

These templates are a starting point, not a finished product, and the customization decisions described in the [Customization Guide](CUSTOMIZATION_GUIDE.md) often benefit from experienced counsel. If you would like attorneys to review your customized policy, advise on the legal requirements that apply to your organization, or help you build the broader AI governance program around it, FRB's AI team is available to help. Visit [ai.frblaw.com](https://ai.frblaw.com) or email [ai@frblaw.com](mailto:ai@frblaw.com). Reaching out does not create an attorney-client relationship; that requires a signed engagement agreement.

## Contributing

Banding together only works if improvements flow back. Suggestions, corrections (especially to the legal authorities in either Appendix B), and additions for other jurisdictions or industries are welcome. If your firm or company adapts these templates and learns something the next adopter should know, open an issue or PR. See [CONTRIBUTING.md](CONTRIBUTING.md).

## Questions

Open a [GitHub issue](../../issues), visit [ai.frblaw.com](https://ai.frblaw.com), or contact [ai@frblaw.com](mailto:ai@frblaw.com).

## Disclaimer

*This repository and its contents are provided as is, with all faults and without warranty of any kind, express or implied. Nothing in this repository constitutes legal advice or is a substitute for advice from competent counsel licensed in your jurisdiction. Falcon Rappaport & Berkman LLP is not liable for any use of these materials. Use at your own risk.*
