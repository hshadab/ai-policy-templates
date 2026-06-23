# AI Policy Customization Skill

**Skill version:** 1.0

`customize-ai-policy/` is an [Agent Skill](https://code.claude.com/docs/en/skills): a folder with instructions that teaches an AI assistant to fetch the latest policy templates from this repository, interview you about your organization, and produce a customized draft, while refusing to fabricate legal citations and reminding you to have counsel review the result.

## Installing

**Claude Code:** copy the `customize-ai-policy/` folder into `.claude/skills/` in your project (or `~/.claude/skills/` for all projects), then ask Claude for "an AI policy for my firm."

**Claude.ai / Claude Desktop / Cowork:** download the packaged `.skill` file from this repository's [Releases](../../releases) page and upload it in Settings, under Skills/Capabilities.

**Other AI assistants:** the skill is plain markdown. Paste the contents of [`customize-ai-policy/SKILL.md`](customize-ai-policy/SKILL.md) into your assistant as instructions, or simply use the copy-paste prompt in the repository [README](../README.md#for-ai-assistants).

## What it does

The skill walks the assistant through choosing the right template (law firm or SMB), gathering your organization's details and tool stack, working through the judgment calls in the [Customization Guide](../CUSTOMIZATION_GUIDE.md), and drafting the customized policy. It is built to be conservative: it preserves the templates' substantive protections unless you direct otherwise, flags unverified legal references for counsel instead of inventing them, and finishes every session by reminding you that the draft is not legal advice and that a policy is one step in AI governance, not the whole program.

Like everything in this repository, the skill is dedicated to the public domain under [CC0 1.0](../LICENSE) and is not legal advice.
