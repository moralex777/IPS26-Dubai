# Model Switching Workflow

**Version:** 1.0
**Last Updated:** November 5, 2025
**Project:** PTC26-Dubai

---

## Overview

PTC26-Dubai uses a hybrid model strategy to optimize cost while maintaining quality:
- **Planning Mode:** Sonnet 4.5 (strategic thinking, complex decision-making)
- **Execution Mode:** Haiku 4.5 (task execution, agent spawning)
- **All Agents:** Haiku 4.5 (60-70% cost reduction)

---

## Agent Model Configuration

All 4 PTC26 agents are configured to use **Haiku 4.5** automatically:

| Agent | Model | Purpose |
|-------|-------|---------|
| PTC26-coordinator | Haiku 4.5 | Master orchestrator |
| PTC26-data-research | Haiku 4.5 | Intelligence gathering |
| PTC26-writer | Haiku 4.5 | Content creation |
| PTC26-ops | Haiku 4.5 | Operations & tracking |

**No action required** - agents automatically use Haiku 4.5 when spawned.

---

## Main Session Workflow

### Starting a New Session

**Default Behavior:** Claude Code sessions start with the last-used model or default model.

**Recommended Approach:**
1. Start session (default model will be used)
2. If planning/strategy work needed: Ensure you're on Sonnet 4.5
3. When ready to execute: Switch to Haiku 4.5

### Switching Between Models

#### Option 1: Slash Command (Recommended)
```bash
/model sonnet    # Switch to Sonnet 4.5 for planning
/model haiku     # Switch to Haiku 4.5 for execution
```

#### Option 2: At Session Start
```bash
claude --model haiku    # Start with Haiku 4.5
claude --model sonnet   # Start with Sonnet 4.5
```

#### Option 3: Environment Variable (Global Default)
```bash
# Add to ~/.bashrc to set default model
export ANTHROPIC_MODEL="haiku"
```

### When to Use Each Model

#### Use Sonnet 4.5 When:
✅ Planning complex multi-step strategies
✅ Making strategic decisions (GO/NO-GO checkpoints)
✅ Analyzing complex research findings
✅ Creating comprehensive plans or playbooks
✅ Reviewing and synthesizing agent outputs
✅ High-stakes decision-making

#### Use Haiku 4.5 When:
✅ Spawning agents for specific tasks
✅ Executing predefined workflows
✅ File operations and organization
✅ Tracking updates and dashboard maintenance
✅ Simple task coordination
✅ Batch operations (email sends, file moves)

---

## Typical Session Pattern

### Pattern 1: Strategy → Execution
```
1. Start session with Sonnet 4.5 (/model sonnet)
2. Plan the approach (e.g., "identify 10 speaker prospects for PTC26")
3. Switch to Haiku 4.5 (/model haiku)
4. Spawn agents to execute (PTC26-coordinator → PTC26-data-research + PTC26-writer)
5. Review agent outputs with Sonnet if needed
```

### Pattern 2: Quick Execution (No Planning Needed)
```
1. Start session with Haiku 4.5 (/model haiku)
2. Execute predefined task (e.g., "update contribution tracker with 5 new speaker invitations")
3. Spawn PTC26-ops agent for tracking
4. Done
```

### Pattern 3: Iterative Workflow
```
1. Start with Sonnet 4.5 for initial planning
2. Switch to Haiku 4.5 (/model haiku) for first execution round
3. Review results with Haiku (or switch back to Sonnet for complex analysis)
4. Adjust plan if needed (consider Sonnet for strategic pivots)
5. Execute next iteration with Haiku
```

---

## Environment Variables Reference

These variables are configured in `~/.bashrc` to ensure model consistency:

```bash
# Model version mappings
export ANTHROPIC_DEFAULT_SONNET_MODEL="claude-sonnet-4-5-20250929"
export ANTHROPIC_DEFAULT_HAIKU_MODEL="claude-haiku-4-5-20251001"

# Optional: Set global default (uncomment if desired)
# export ANTHROPIC_MODEL="haiku"
```

**To reload environment variables:**
```bash
source ~/.bashrc
```

---

## Cost Optimization Strategy

### Estimated Savings

**Agent Operations:**
- All agents using Haiku 4.5: **60-70% cost reduction**
- High-frequency operations (tracking, file moves, research): **Substantial cumulative savings**

**Main Session:**
- Planning with Sonnet (10-20% of time): **Full capability retained**
- Execution with Haiku (80-90% of time): **60-70% cost reduction**

**Overall Project Savings:** ~55-65% compared to Sonnet-only approach

### Trade-offs Acknowledged

**Quality Considerations:**
- Strategic/creative agent tasks now use Haiku instead of Sonnet
- Haiku 4.5 is significantly improved over previous versions
- For critical external communications, consider manual review

**Mitigation Strategies:**
- Use Sonnet for final review of high-stakes content if needed
- PTC26-writer agent maintains <20% AI detection standards
- Quality assurance protocols remain in place

---

## Verification & Testing

### How to Verify Current Model
Use the `/status` command in Claude Code session to see current model.

### How to Verify Agent Model
When agents are spawned, check their initialization message or status.

### Testing Checklist
- [ ] Spawn PTC26-coordinator agent → Verify Haiku 4.5
- [ ] Spawn PTC26-data-research agent → Verify Haiku 4.5
- [ ] Spawn PTC26-writer agent → Verify Haiku 4.5
- [ ] Spawn PTC26-ops agent → Verify Haiku 4.5
- [ ] Test `/model sonnet` command → Confirm switch
- [ ] Test `/model haiku` command → Confirm switch
- [ ] Verify environment variables loaded: `echo $ANTHROPIC_DEFAULT_HAIKU_MODEL`

---

## Quick Reference Commands

```bash
# Model switching
/model sonnet          # Switch to Sonnet 4.5
/model haiku           # Switch to Haiku 4.5
/status                # Check current model

# Environment check
echo $ANTHROPIC_DEFAULT_SONNET_MODEL    # Should show: claude-sonnet-4-5-20250929
echo $ANTHROPIC_DEFAULT_HAIKU_MODEL     # Should show: claude-haiku-4-5-20251001

# Reload config
source ~/.bashrc
```

---

## Troubleshooting

### Issue: Agent uses wrong model
**Solution:** Check agent frontmatter in `.claude/agents/[agent-name].md` - should show `model: haiku`

### Issue: Can't switch models in main session
**Solution:** Ensure Claude Code CLI is up to date. Try restarting session.

### Issue: Environment variables not loaded
**Solution:** Run `source ~/.bashrc` or restart terminal

### Issue: Unclear which model is active
**Solution:** Use `/status` command to check current model

---

## Related Documentation

- **Authoritative Playbook:** `/home/alex/PTC26-Dubai/CLAUDE.md` - Agent architecture details
- **Agent Definitions:** `/home/alex/PTC26-Dubai/.claude/agents/` - Individual agent configs
- **README:** `/home/alex/PTC26-Dubai/README.md` - Project navigation

---

**END OF WORKFLOW DOCUMENTATION**

*For questions or updates to this workflow, modify this file and increment version number.*
