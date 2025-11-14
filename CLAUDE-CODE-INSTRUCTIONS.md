# Claude Code Instructions for IPS26 Dubai 2026

## Quick Start

This is an **event participation project** managed entirely through Claude Code. All work uses a coordinated agent system with real-time dashboard updates.

## Core Workflow

### 1. **Start Your Session**
```
"I need help with [task]"
```
Claude Code will automatically:
- Analyze your request
- Delegate to appropriate agents (coordinator, research, writer, ops)
- Run parallel tasks for efficiency
- Track changes in git automatically

### 2. **Agent Specializations**

| Agent | Use For | Command |
|-------|---------|---------|
| **IPS26-coordinator** | Complex multi-step tasks | Automatically triggered |
| **IPS26-data-research** | Speaker research, company intel, trends | "Research [company/person]" |
| **IPS26-writer** | Emails, proposals, LinkedIn posts | "Draft [communication type]" |
| **IPS26-ops** | File management, tracking, dashboard | "Update dashboard" or "Track [metric]" |

### 3. **Key Commands**

**Update Dashboard** (Always do this after changes)
```
"Update dashboard"
```
Regenerates all 8 HTML pages from source data.

**Check Project Status**
- Read: `STATUS-SUMMARY-QUICK-REFERENCE.txt`
- View: Open `/dashboard/` in browser

**Research a Speaker**
```
"Research [person/company]"
```
Uses IPS26-data-research agent to gather intelligence.

**Draft Communication**
```
"Draft an email to [recipient] about [topic]"
```
Uses IPS26-writer agent with <20% AI detection compliance.

**Track Progress**
```
"Update contribution tracker with [value/metric]"
```
Updates `IPS26-CONTRIBUTION-TRACKER.md` automatically.

## Essential Files

| File | Purpose |
|------|---------|
| `IPS26-STRATEGY-PLAYBOOK.md` | Master strategy (read first) |
| `IPS26-CONTRIBUTION-TRACKER.md` | Value delivery tracking (€120-130K + £65-100K target) |
| `/operations/speaker-database.md` | Speaker prospect list & confirmations |
| `/dashboard/README.md` | Dashboard system details |
| `STATUS-SUMMARY-QUICK-REFERENCE.txt` | Current status snapshot |
| `NEXT-PROMPT.md` | Immediate next steps |

## Data Sources (Single Source of Truth)

All data is stored as **markdown + JSON files**. Dashboard auto-regenerates from these:
- `IPS26-CONTRIBUTION-TRACKER.md` → Value metrics on dashboard
- `/operations/speaker-database.md` → Speaker status on dashboard
- `/operations/ips26-agenda-2026.json` → Timeline & event details
- Status markdown files → Progress tracking

**Always edit these source files directly.** Never edit dashboard HTML files.

## Project Structure

```
.claude/agents/              → Agent specifications & rules
.claude/skills/              → Dashboard generator skill
/dashboard/                  → 8 interactive HTML pages
/operations/                 → Speaker database, candidates, agenda
/assets/ips26-organizers/    → Organizer communications (ready/sent)
/panel-topics/               → 5 panel topic selections with outlines
```

## Critical Rules

1. **Always commit changes** - Use clear, descriptive commit messages
2. **Update dashboard after changes** - Say "Update dashboard" when done
3. **Track value delivery** - Log all activities in contribution tracker
4. **Use agents for coordination** - Don't do complex tasks manually
5. **Keep markdown files as source** - Dashboard regenerates from them
6. **Follow phase instructions** - Check `NEXT-PROMPT.md` for current priorities

## Current Phase (Phase 3)

**Goal:** Speaker recruitment + partnership confirmation
**Target:** 5-7 Fortune 500 speakers confirmed
**Timeline:** 150 days to April 13-15, 2026
**Next Step:** See `NEXT-PROMPT.md`

## How to Collaborate with Claude

**For Research:**
"Research [company/speaker] for IPS26 panel"
→ Automatically uses Perplexity research tools

**For Writing:**
"Draft email to [person] about [topic]"
→ Automatically optimized for human-like tone

**For Tracking:**
"Update the contribution tracker with X euros from Y activity"
→ Automatically maintains running total

**For Coordination:**
"I need to [complex multi-step task]"
→ Automatically breaks into parallel subtasks

## Dashboard Access

**Generate all pages:**
Say "Update dashboard" in Claude Code

**View dashboard:**
Open `/dashboard/index.html` in browser (or any of the 8 pages)

**What dashboards track:**
- Executive summary (progress vs targets)
- Panel details & speaker status
- Confirmed vs pipeline speakers
- Value delivery (€/£ tracking)
- Communication history
- Event timeline
- Intelligence briefings
- Resource library

## Quality Standards

- All communications drafted by IPS26-writer agent (<20% AI detection)
- All research uses Perplexity MCP + web search
- All tasks use git commits with clear messages
- All changes reflected in updated dashboard
- All metrics tracked in contribution tracker

## Troubleshooting

**Dashboard won't update?**
→ Check `/dashboard/README.md` troubleshooting section

**Agent not responding correctly?**
→ Check agent file in `.claude/agents/` for configuration

**Need to understand a decision?**
→ Read the phase brief (e.g., `PHASE4-VALIDATION-REPORT.md`)

**Lost track of progress?**
→ View `STATUS-SUMMARY-QUICK-REFERENCE.txt` + dashboard

## Getting Help

- For project strategy: Read `IPS26-STRATEGY-PLAYBOOK.md`
- For agent coordination: Check `.claude/agents/`
- For operations: Read `/operations/` files
- For dashboard: See `/dashboard/README.md`
- For current status: Check `NEXT-PROMPT.md`

---

**Remember:** This project is fully coordinated through Claude Code agents. Delegate complex work to agents, they'll handle parallel execution and integration automatically.
