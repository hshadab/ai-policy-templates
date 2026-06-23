 # Customization Guide

**Guide version:** 1.0

This guide walks an organization through adapting the [law firm template](ai-policies/law-firm-ai-policy/law-firm-generative-ai-policy-template.md) or the [SMB template](ai-policies/ai-policy-for-small-and-medium-businesses/smb-generative-ai-policy-template.md). Part 1 covers simple fill-ins. Part 2 covers sections requiring organization-specific judgment and, in most cases, review by counsel. Part 3 places the policy within a broader AI governance program. Part 4 is a rollout checklist.

**A note before you start:** customizing this document is not busywork; it is the first real act of AI governance your organization will perform. Deciding who administers the policy, which tools you actually trust with confidential information, and which laws apply to you are governance decisions. Take the time to make them deliberately rather than adopting the template verbatim.

## Part 1: Required placeholders

Replace every bracketed placeholder. Search the document for `[` to confirm none remain.

### Both templates

| Placeholder | Replace with |
|---|---|
| `[FIRM NAME]` / `[COMPANY NAME]` | Your organization's full legal name |
| `[EFFECTIVE DATE]` | Adoption date (appears in the title and both appendices) |
| `[ADMINISTRATOR NAME]`, `[ADMINISTRATOR TITLE]`, `[ADMINISTRATOR EMAIL]` | The person responsible for administering the policy (often a managing partner, GC, COO, or IT/security lead) and a monitored contact address |
| `[GENERAL-PURPOSE AI TOOL 1/2]`, `[VENDOR]` | Each enterprise AI workspace you license |
| `[APPROVED AI NOTETAKER]` | The notetaker (if any) approved for external/client communications |
| Appendix A example platforms | Your actual software stack |
| Repo contact details | If you fork this repo, replace FRB's contact (ai@frblaw.com / ai.frblaw.com) with your own |

### Law firm template only

| Placeholder | Replace with |
|---|---|
| `[PRIMARY LEGAL AI PLATFORM]`, `[DESCRIPTION OF PRIMARY LEGAL AI PLATFORM]` | Your legal-specific AI platform (e.g., Harvey), if any; if none, delete the definition and references and adjust Section 5.2 |
| `[LEGAL RESEARCH PLATFORM]` | Your citation-verification tool (e.g., Westlaw, Lexis+) |
| `[DOCUMENT MANAGEMENT SYSTEM]` | Your DMS (e.g., NetDocuments, iManage) |

### SMB template only

| Placeholder | Replace with |
|---|---|
| `[INDUSTRY/FUNCTION-SPECIFIC AI TOOL]`, `[DESCRIBE APPROVED USES]` | Any vetted tool specific to your industry or a function (design, support, development); delete if none |
| `[DOCUMENT/FILE MANAGEMENT SYSTEM]` | Your system of record (e.g., SharePoint, Google Drive, a DMS) |
| `[LIST ANY APPLICABLE SECTOR RULES]` (Appendix B) | Industry rules that apply to you (HIPAA, GLBA, FERPA, FDA, insurance, licensing) |

## Part 2: Sections requiring organization-specific judgment

**Appendix A (Approved Tools) — both.** The example entries reflect one organization's vendor diligence, not endorsements. List only tools you have actually vetted (data-handling terms, training-on-data settings, security posture) and licensed at an enterprise tier. Delete tools you do not use.

**Appendix B — both.** This is the section most likely to go stale. The law firm version catalogs bar ethics guidance for NY, NJ, CT, FL, CA, TX, and DC; the SMB version surveys consumer protection, privacy, employment, IP, recording, and EU AI Act considerations. Both were drafted as of June 2026. Note that some state AI statutes are actively in flux (Colorado's, for example, has been rewritten and delayed amid litigation). Verify every authority with counsel before adoption and assign someone to review the appendix on a recurring basis.

**Engagement letters / customer contracts (Section 3.2) — both.** The law firm template assumes engagement letters contain AI disclosure and consent language; the SMB template assumes customer and partner agreements address AI use. If yours do not, update them before or alongside adopting the policy.

**Section 5.2 (Enterprise AI workspaces) — both.** The use cases reflect particular tool stacks (agentic desktop tools, connectors, document workspaces). Edit to match the features your tools actually offer.

**Section 6 (AI Notetakers) — both.** Both templates adopt an all-party consent standard stricter than many states' recording laws. Confirm your organization wants that standard, and name your approved notetaker or prohibit notetakers entirely.

**Section 8 (Employment decisions).** The law firm template prohibits AI in employment decisions outright; the SMB template requires Administrator approval and legal compliance. Pick the posture that fits your organization, confirm the cited laws match your footprint (NYC, Illinois, EU exposure), and have employment counsel review.

**Section 9 (Discipline and governance).** Confirm the termination-level violations match your HR practices and any partnership or employment agreements. Decide whether a committee or a single Administrator governs AI (the SMB template makes the committee optional).

**Acknowledgment — both.** Decide how acknowledgments are collected and stored, and whether re-acknowledgment is required when the policy is updated.

## Part 3: Beyond the policy — building an AI governance program

This policy governs individual conduct. It is one control within a governance program, not the program itself. After (or while) adopting it, organizations should stand up the surrounding program. The [NIST AI Risk Management Framework](https://www.nist.gov/itl/ai-risk-management-framework) (AI RMF 1.0), with its Generative AI Profile (NIST-AI-600-1), is a widely used, free, non-certifiable structure organized around four functions; here is how this policy and its companion activities map to them:

**Govern.** Establish accountability and culture. This policy, the Administrator role, the acknowledgment process, training requirements, and disciplinary standards all live here, but Govern also includes leadership commitment, defined risk tolerance, and periodic policy review (Section 9.4).

**Map.** Know your AI footprint. Inventory the AI tools in use (Appendix A is the start of that inventory, including the often-forgotten Background AI), the use cases they serve, the data they touch, and the people they affect. Revisit when teams adopt new tools — the policy's exception-request process (Sections 3.4 and 5.1) is a Map intake mechanism.

**Measure.** Assess whether controls work. Track policy acknowledgment and training completion, audit tool usage (Section 9.2), test output quality where AI is used in significant workflows, and record incidents and near-misses reported under Section 9.2.

**Manage.** Act on what you learn. Respond to incidents, retire or restrict risky tools, update Appendices A and B, and feed lessons back into training and the next policy revision.

Organizations wanting a certifiable management-system standard can look to **ISO/IEC 42001**; those in regulated sectors should layer in sector frameworks and regulator guidance. The right framework matters less than the habit: inventory, assess, assign ownership, measure, improve.

## Part 4: Rollout checklist

1. Complete Parts 1 and 2 and obtain internal sign-off (counsel, executive committee, or ownership).
2. Configure the technical controls the policy assumes: enterprise AI tenants, training-on-data disabled, notetaker integrations locked down, storage paths to your systems of record.
3. Deliver the training required by Section 9.4 before granting tool access.
4. Collect signed acknowledgments from all personnel.
5. Stand up the governance rhythm from Part 3: an AI inventory, an owner, and a recurring review (suggested: semi-annual) of the policy, Appendix A, and Appendix B.

---

*This guide is informational only and is not legal advice.*
