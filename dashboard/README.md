# IPS26 Dubai 2026 - Project Dashboard

**Live Project Dashboard** for monitoring IPS Congress 2026 participation, speaker recruitment, and value delivery.

---

## 🎯 Quick Start

### **Open Dashboard**
```bash
cd /home/user/IPS26-Dubai/dashboard
open index.html  # Mac
xdg-open index.html  # Linux
```

Or use VS Code Live Server extension.

---

## 📊 Dashboard Pages

### **1. Executive Dashboard** (`index.html`)
**Your daily command center**
- Key metrics at a glance
- Urgent actions and alerts
- Project status overview
- Quick links to all pages

### **2. Panel Selection** (`panels.html`)
**Select your 1-3 moderation panels**
- All 34 sessions by track and day
- Strategic fit scoring
- One-day vs. spread strategy
- Interactive selection tool

### **3. Speaker Pipeline** (`speakers.html`)
**Track Fortune 500 speaker recruitment**
- Tier 1 & Tier 2 prospects
- Acceptance rate visualization
- Confirmation status
- Contact information

### **4. Value Delivery** (`value.html`)
**Monitor €120-130K value target**
- 6 progress bars by component
- Real-time percentage tracking
- Milestone timeline
- Phase 3 baseline comparison

### **5. Communications** (`communications.html`)
**Message center**
- Ready-to-send queue (11 items)
- Sent log
- Pending responses
- Email template previews

### **6. Timeline** (`timeline.html`)
**Project milestones & deadlines**
- Visual timeline
- Critical checkpoints
- Task lists by timeframe
- Dependency tracking

### **7. Event Intelligence** (`event.html`)
**Full 3-day agenda**
- All 34 sessions detailed
- Strategic meeting windows
- Venue information
- Event statistics

### **8. Resources** (`resources.html`)
**Quick reference**
- Strategy playbook links
- Contact directory
- File locations
- Document index

---

## 🔄 Dynamic Dashboard System

### **How It Works**

The dashboard is **dynamically generated** from your project files:

```
Your Project Files         Dashboard Generator          HTML Dashboard
================          ===================          ==============
CONTRIBUTION-TRACKER.md                                  index.html
speaker-database.md       →  dashboard-generator   →    panels.html
ips26-agenda-2026.json       Claude Code skill          speakers.html
STATUS-SUMMARY.txt                                       ... (8 pages)
NEXT-PROMPT.md
```

### **Single Source of Truth**

All data lives in your **markdown/JSON files**. The dashboard is regenerated from these files.

**You never edit HTML directly.** You edit project files, then regenerate.

---

## ⚡ Update Dashboard (Primary Method)

### **Using Claude Code Skill** (Recommended)

In Claude Code, just say:
```
"Update dashboard"
```

or

```
"Regenerate dashboard with latest data"
```

The `dashboard-generator` skill will:
1. ✅ Read all project files
2. ✅ Parse current metrics
3. ✅ Regenerate all 8 HTML pages
4. ✅ Report what changed

**That's it!** Your dashboard is now current.

---

## 📁 Data Sources

The dashboard pulls from these files:

| File | Data Extracted |
|------|----------------|
| `STATUS-SUMMARY-QUICK-REFERENCE.txt` | Phase status, completed items, next actions |
| `IPS26-CONTRIBUTION-TRACKER.md` | Value delivered, speaker count, timeline |
| `operations/speaker-database.md` | Speaker prospects, confirmations, Tier 1/2 |
| `operations/ips26-agenda-2026.json` | All 34 sessions, times, descriptions |
| `NEXT-PROMPT.md` | Immediate next steps, urgent actions |
| `IPS26-AGENDA-FULL-2026.md` | Complete event details |
| `assets/*/ready-to-send/` | Communications ready count |
| `assets/*/sent/` | Sent communications log |

---

## 🎨 Design System

### **Colors (Dubai Theme)**
- **Navy** `#0f172a` - Headers, primary text
- **Gold** `#f59e0b` - Accents, highlights, CTA
- **Green** `#10b981` - Completed, success
- **Yellow** `#f97316` - In progress, warnings
- **Red** `#ef4444` - Urgent, critical
- **Blue** `#3b82f6` - Ready to execute
- **Gray** `#64748b` - Pending, inactive

### **Components**
- Cards, badges, progress bars
- Tabs, tables, timelines
- Responsive grid layouts
- Print-friendly styles

### **Typography**
- System fonts (SF Pro, Segoe UI, Roboto)
- Clean, professional hierarchy
- Accessible contrast ratios

---

## 📝 Workflow

### **Typical Usage Pattern**

**1. Morning Check**
```bash
open dashboard/index.html
# Review: Days to event, urgent actions, status
```

**2. Update Project Files**
```bash
vim IPS26-CONTRIBUTION-TRACKER.md
# Example: Mark speaker as confirmed, update value delivered
```

**3. Regenerate Dashboard**
In Claude Code:
```
"Update dashboard"
```

**4. Review Changes**
```bash
open dashboard/index.html
# See: New speaker count, updated progress bars
```

**5. Commit Together**
```bash
git add .
git commit -m "Speaker confirmations: RJ Pittman + Erin Meezan confirmed"
git push
```

---

## 🔧 Technical Details

### **Architecture**
- **Static HTML** + **Dynamic Generation**
- **No database** - files are the database
- **No backend** - runs in browser
- **Git-based** - version controlled

### **Files Structure**
```
dashboard/
├── README.md              # This file
├── styles.css             # Shared stylesheet (don't edit)
├── index.html             # Executive Dashboard (generated)
├── panels.html            # Panel Selection (generated)
├── speakers.html          # Speaker Pipeline (generated)
├── value.html             # Value Tracker (generated)
├── communications.html    # Comms Center (generated)
├── timeline.html          # Timeline (generated)
├── event.html             # Event Intelligence (generated)
└── resources.html         # Resources (generated)
```

### **Generation Process**
1. Parse markdown/JSON files
2. Extract metrics and data
3. Calculate derived values (percentages, days remaining)
4. Generate HTML from templates
5. Write to dashboard/ directory
6. Report changes

### **Preservation**
The generator **always preserves**:
- ✅ Design system (CSS)
- ✅ Navigation structure
- ✅ Responsive layouts
- ✅ JavaScript functionality

The generator **always updates**:
- ✅ Numbers and metrics
- ✅ Dates and countdowns
- ✅ Status indicators
- ✅ Lists and tables

---

## 🚀 Current Status

**Version:** 1.0
**Last Generated:** November 14, 2025
**Phase:** 3 (Active Execution)
**Status:** ✅ Moderator Confirmed

### **Metrics Snapshot**
- **Days to Event:** 150
- **Speaker Confirmations:** 0/5-7
- **Value Delivered:** €0K / €120-130K (0%)
- **Communications Ready:** 11
- **Phase:** Phase 3 Execution

---

## 📋 Updating Specific Metrics

### **When You Confirm a Speaker**
1. Edit `operations/speaker-database.md`
2. Update speaker status to "Confirmed"
3. Update count in OVERVIEW section
4. Say: "Update dashboard" in Claude Code

### **When You Deliver Value**
1. Edit `IPS26-CONTRIBUTION-TRACKER.md`
2. Update value delivered in relevant component
3. Update Phase 3 Current column
4. Say: "Update dashboard"

### **When You Send Communications**
1. Move file from `ready-to-send/` to `sent/`
2. Say: "Update dashboard"
3. Count automatically updates

### **When You Complete Milestone**
1. Edit `STATUS-SUMMARY-QUICK-REFERENCE.txt`
2. Move item from Yellow/Blue to Green
3. Say: "Update dashboard"

---

## 🎯 Best Practices

### **Do:**
- ✅ Update project files as single source of truth
- ✅ Regenerate dashboard after significant changes
- ✅ Commit dashboard updates with data updates
- ✅ Review dashboard daily for status check
- ✅ Use dashboard for stakeholder presentations

### **Don't:**
- ❌ Edit HTML files directly (changes will be overwritten)
- ❌ Modify styles.css without regenerating all pages
- ❌ Forget to regenerate after data changes
- ❌ Commit dashboard without regenerating first

---

## 🔮 Future Enhancements

Planned features (request when needed):
- **Git hooks** - Auto-regenerate on commit
- **PDF export** - Print-friendly reports
- **Charts/graphs** - Trend visualization
- **Email summaries** - Weekly progress reports
- **Mobile app** - Native dashboard
- **Dark mode** - Theme toggle
- **Real-time sync** - Live updates

---

## 🆘 Troubleshooting

### **Dashboard shows old data**
```
Solution: Say "Update dashboard" in Claude Code
```

### **Numbers don't match project files**
```
Solution: Regenerate dashboard, check file paths
```

### **Missing sections**
```
Solution: Ensure all data source files exist and are properly formatted
```

### **Styling broken**
```
Solution: Check styles.css wasn't modified, regenerate from clean state
```

---

## 📞 Support

**Skill Location:** `.claude/skills/dashboard-generator/skill.md`

**Invocation:** Just tell Claude Code:
- "Update dashboard"
- "Regenerate dashboard"
- "Refresh dashboard"

**Data Sources:** See "Data Sources" section above

**Issues:** Check that all source files exist and are properly formatted

---

## 📊 Example Update Scenarios

### **Scenario 1: First Speaker Confirmed!**
```bash
# 1. Update speaker database
vim operations/speaker-database.md
# Change RJ Pittman status to "Confirmed"
# Update confirmed count: 1/5-7

# 2. Update contribution tracker
vim IPS26-CONTRIBUTION-TRACKER.md
# Add confirmation entry, update timeline

# 3. Regenerate dashboard
# In Claude Code: "Update dashboard"

# 4. Review changes
open dashboard/index.html
# See: 1/5-7 speakers, progress bar updated

# 5. Commit
git add .
git commit -m "🎉 First speaker confirmed: RJ Pittman (Matterport)"
```

### **Scenario 2: Panel Selection Complete**
```bash
# 1. Update status file
vim STATUS-SUMMARY-QUICK-REFERENCE.txt
# Move "Panel Selection" to Green Light section

# 2. Update contribution tracker
vim IPS26-CONTRIBUTION-TRACKER.md
# Log selected panels, update timeline

# 3. Regenerate
# "Update dashboard"

# 4. Dashboard now shows:
# - Panel selection marked complete
# - Next urgent action updated
# - Timeline milestone checked off
```

### **Scenario 3: Value Delivered**
```bash
# 1. Update tracker
vim IPS26-CONTRIBUTION-TRACKER.md
# Update "Speaker Recruitment: €20K"
# (was €0K)

# 2. Regenerate
# "Update dashboard"

# 3. See updated progress bars:
# Speaker Recruitment: [████░░░░░░] €20K / €20-30K (67%)
# TOTAL VALUE: [██░░░░░░░░] €20K / €120K (17%)
```

---

**Dashboard Ready!** Open `index.html` to start monitoring your IPS26 project.

For any questions or enhancements, just ask Claude Code.
