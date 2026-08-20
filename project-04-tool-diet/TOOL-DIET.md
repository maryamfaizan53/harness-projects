# Project 4: The tool diet — morning-triage skill

## Step 1: List every tool the loop can currently see

A fresh Claude Code project, before any diet, typically has every connected MCP server's tools visible —
same shape as this very session:

- File/terminal: Read, Write, Edit, Bash, Glob, Grep
- Figma (design)
- Gmail, Google Calendar, Google Drive (personal productivity)
- HubSpot, Pipedrive, Zoho CRM (sales CRMs)
- GitHub (PRs, issues, repo management on GitHub.com)
- Notion (docs/wiki)
- OpenAI (a second model provider's own tools)
- ...and more

None of these were asked for by the triage skill. They are simply attached to the project.

## Step 2: What the skill actually needs

The morning-triage skill's job: read the day's incoming items, decide what each needs, write the verdict
to progress.md, and commit. That job touches exactly:

- Read, Write, Edit — read items, write progress.md
- Bash — run checks, git commit
- **One** connector for the actual item source (e.g. the ticket/issue system this loop watches) — not all of them

## Step 3: The cut list (the diet)

Deny everything except the above, in `.claude/settings.json`:

```json
{
  "$schema": "https://json.schemastore.org/claude-code-settings.json",
  "permissions": {
    "deny": [
      "mcp__figma__*",
      "mcp__gmail__*",
      "mcp__google_calendar__*",
      "mcp__google_drive__*",
      "mcp__hubspot__*",
      "mcp__pipedrive__*",
      "mcp__zoho_crm__*",
      "mcp__github__*",
      "mcp__notion__*",
      "mcp__openai__*"
    ]
  }
}
```

## Step 4: Run a week of beats, log wrong-tool incidents

A "wrong-tool incident" = the agent reached for, or was confused between, a tool that had nothing to do
with the job. Log one line per incident:

```
YYYY-MM-DD  tool-attempted  what-it-should-have-used-instead
```

## Done when

Compare the incident count from a week on the full list vs. a week on the cut list. Fewer wrong-tool
picks on the cut list is the proof. No change means the list was already lean — also a real result.
