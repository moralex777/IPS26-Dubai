# Dashboard Generator Skill

**Purpose:** Regenerate the IPS26 Dubai 2026 project dashboard from live project data files.

**Invocation:** User says "update dashboard" or "regenerate dashboard" or "refresh dashboard"

---

## What This Skill Does

When invoked, you will:
1. Read current data from project files
2. Parse the data into structured format
3. Regenerate all 8 HTML dashboard pages with updated data
4. Preserve design and functionality
5. Report what was updated

---

## Data Sources to Parse

### 1. STATUS-SUMMARY-QUICK-REFERENCE.txt
**Location:** `/home/user/IPS26-Dubai/STATUS-SUMMARY-QUICK-REFERENCE.txt`

**Extract:**
- Current date and days to event
- Phase status
- What's done (green light items)
- What's in progress (yellow light items)
- What's ready to execute (blue light items)
- Key insights and next actions

### 2. IPS26-CONTRIBUTION-TRACKER.md
**Location:** `/home/user/IPS26-Dubai/IPS26-CONTRIBUTION-TRACKER.md`

**Extract:**
- Speaker confirmations count (look for "Confirmed Speakers: X/5-7")
- Value delivered by component (€ and £ amounts)
- Phase 3 baseline metrics
- Outreach log dates and status
- Timeline checkpoints and dates

### 3. operations/speaker-database.md
**Location:** `/home/user/IPS26-Dubai/operations/speaker-database.md`

**Extract:**
- Total tracked speakers
- Tier 1 prospects (table with Name, Company, Expertise, Status, Email, Acceptance rate)
- Tier 2 prospects (table format)
- Confirmed speakers count
- Success rate metrics

### 4. operations/ips26-agenda-2026.json
**Location:** `/home/user/IPS26-Dubai/operations/ips26-agenda-2026.json`

**Extract:**
- All sessions by day and track
- Session details (title, time, description, type)
- Alexander's confirmed panels
- Strategic fit scores for each session

### 5. NEXT-PROMPT.md
**Location:** `/home/user/IPS26-Dubai/NEXT-PROMPT.md`

**Extract:**
- Immediate next steps
- Upcoming triggers and dates
- Critical actions
- Agent delegation plans

### 6. IPS26-AGENDA-FULL-2026.md
**Location:** `/home/user/IPS26-Dubai/IPS26-AGENDA-FULL-2026.md`

**Extract:**
- Complete 3-day agenda
- Session descriptions
- Strategic meeting windows
- Alexander's participation details

---

## Dashboard Pages to Generate

### Page 1: index.html (Executive Dashboard)
**Template Location:** `/home/user/IPS26-Dubai/dashboard/index.html`

**Dynamic Data to Update:**
- Hero section metrics:
  - Days to event (calculated from today to April 13, 2026)
  - Speaker confirmations (from speaker-database.md)
  - Value delivered percentage (from CONTRIBUTION-TRACKER.md)
  - Communications ready count (from ready-to-send directories)
  - Phase status (from STATUS-SUMMARY)
- Alert boxes:
  - Success messages (conditional based on milestones)
  - Urgent actions (from NEXT-PROMPT.md)
  - Next milestone dates
- Status overview:
  - Completed items (green cards)
  - Urgent items (red cards)
  - Pending items (yellow cards)
- Navigation metrics in header

### Page 2: panels.html (Panel Selection Tool)
**Purpose:** Interactive panel selector for choosing 1-3 moderation slots

**Dynamic Data:**
- Load all sessions from ips26-agenda-2026.json
- Organize by track (main/institutional) and day (1/2/3)
- For each panel show:
  - Title, time, duration, type
  - Description
  - Strategic fit score (high/medium/low)
  - Fit reasoning
  - Selection checkbox
- Mark confirmed panels
- Strategy tabs (one day vs spread)

**Data Structure:**
```javascript
{
  main: {
    1: [/* Day 1 main conference panels */],
    2: [/* Day 2 panels */],
    3: [/* Day 3 panels */]
  },
  institutional: {
    1: [/* Day 1 institutional panels */],
    2: [/* Day 2 panels */],
    3: [/* Day 3 panels */]
  }
}
```

### Page 3: speakers.html (Speaker Pipeline)
**Purpose:** Display all speaker prospects with status tracking

**Dynamic Data from speaker-database.md:**
- Tier 1 prospects grid:
  - Name, company, title
  - Expertise domains (tags)
  - Acceptance likelihood percentage
  - Status (pending/invited/confirmed/declined)
  - Contact email
- Tier 2 prospects (collapsible)
- Confirmed speakers section (shows when count > 0)
- Success metrics:
  - Total speakers: X
  - Confirmed: Y/5-7 (Z%)
  - Pending outreach: N

### Page 4: value.html (Value Delivery Tracker)
**Purpose:** Track progress toward €120-130K target

**Dynamic Data from CONTRIBUTION-TRACKER.md:**
- 6 progress bars with current/target values:
  1. Speaker Recruitment: €XK / €20-30K
  2. Media Partnership: £XK / £40-60K
  3. PropertyTalents Pipeline: €XK / €80-100K
  4. Pre-A Club VC: £XK / £5-10K
  5. RWA Startup Competition: £XK / £20K+
  6. TOTAL: €XK / €120-130K

- Calculate percentages for progress bar widths
- Color coding based on progress (0-30% red, 31-70% yellow, 71-100% green)
- Timeline of value delivery milestones

### Page 5: communications.html (Communication Center)
**Purpose:** Track ready/sent/pending communications

**Dynamic Data:**
- Count files in `/home/user/IPS26-Dubai/assets/*/ready-to-send/`
- Count files in `/home/user/IPS26-Dubai/assets/*/sent/`
- List communications with:
  - Date (from filename or file mtime)
  - Recipient
  - Subject/purpose
  - Status (ready/sent/pending response)

### Page 6: timeline.html (Timeline & Milestones)
**Purpose:** Visual timeline of project milestones

**Dynamic Data from CONTRIBUTION-TRACKER.md and STATUS-SUMMARY:**
- Parse timeline checkpoints table
- For each milestone:
  - Date
  - Title
  - Description
  - Status (completed/urgent/pending)
  - Icon/color based on status
- Calculate which milestones are overdue, upcoming, or completed

### Page 7: event.html (Event Intelligence)
**Purpose:** Full 3-day agenda with session details

**Dynamic Data from ips26-agenda-2026.json:**
- Load complete agenda
- Display by day and track
- For each session:
  - Time, title, duration, type
  - Description
  - Audience (if specified)
  - Alexander's role (if applicable)
- Event statistics:
  - Total sessions, visitors, countries, media
  - Venue details

### Page 8: resources.html (Quick Reference)
**Purpose:** Links to all key documents and contacts

**Static content** with links to:
- Strategy documents
- Contact information
- File locations
- External resources
- Event website

---

## HTML Generation Instructions

### Step 1: Read Template Structure
Use existing `/home/user/IPS26-Dubai/dashboard/index.html` as reference for:
- Navigation bar structure
- CSS classes and styling
- Layout patterns
- Responsive design

### Step 2: Parse Data Files
For each data source:
```python
# Example for speaker-database.md
def parse_speaker_database():
    with open('/home/user/IPS26-Dubai/operations/speaker-database.md') as f:
        content = f.read()

    # Extract metrics from OVERVIEW section
    total_match = re.search(r'\*\*Total Tracked Speakers\*\* \| (\d+)', content)
    confirmed_match = re.search(r'\*\*Confirmed Speakers\*\* \| (\d+)/(\d+)-(\d+)', content)

    # Parse Tier 1 table
    tier1_pattern = r'\| ([^|]+) \| ([^|]+) \| ([^|]+) \| ([^|]+) \| ([^|]+) \| ([^|]+) \|'
    tier1_speakers = re.findall(tier1_pattern, content)

    return {
        'total': int(total_match.group(1)) if total_match else 0,
        'confirmed': int(confirmed_match.group(1)) if confirmed_match else 0,
        'target_min': int(confirmed_match.group(2)) if confirmed_match else 5,
        'target_max': int(confirmed_match.group(3)) if confirmed_match else 7,
        'tier1': tier1_speakers
    }
```

### Step 3: Generate HTML Pages
For each page, use this template pattern:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{PAGE_TITLE} - IPS26 Dubai 2026</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <!-- Include navigation from template -->
    <nav class="top-nav">
        <!-- Standard nav with updated metrics -->
    </nav>

    <div class="container">
        <!-- Page-specific content with dynamic data -->
    </div>

    <script>
        // Include countdown timer script
        // Page-specific JavaScript
    </script>
</body>
</html>
```

### Step 4: Update Navigation Metrics
In every page's navigation bar, update:
- Days to event: Calculate `(April 13, 2026 - today).days`
- Speakers: `{confirmed}/{target}`
- Value: `€{delivered}K/€120K`

### Step 5: Write Generated Files
Write each generated HTML file to `/home/user/IPS26-Dubai/dashboard/{filename}`

### Step 6: Report Changes
After generation, report:
```
✅ Dashboard Updated!

Updated Metrics:
- Days to event: 150 → 148
- Speaker confirmations: 0/5-7 → 2/5-7
- Value delivered: €0K → €20K (17%)
- Communications ready: 11 → 9

Pages Regenerated:
✓ index.html (Executive Dashboard)
✓ panels.html (Panel Selection)
✓ speakers.html (Speaker Pipeline)
✓ value.html (Value Tracker)
✓ communications.html (Comms Center)
✓ timeline.html (Timeline)
✓ event.html (Event Intelligence)
✓ resources.html (Resources)

Dashboard location: /home/user/IPS26-Dubai/dashboard/index.html
```

---

## Key Calculations

### Days to Event
```python
from datetime import datetime
event_date = datetime(2026, 4, 13)
today = datetime.now()
days_remaining = (event_date - today).days
```

### Progress Percentage
```python
def calculate_progress(current, target):
    if target == 0:
        return 0
    return min(100, (current / target) * 100)
```

### Status Determination
```python
def get_milestone_status(milestone_date):
    today = datetime.now()
    if milestone_date < today:
        return 'completed'  # or 'overdue' if not marked done
    elif (milestone_date - today).days <= 7:
        return 'urgent'
    else:
        return 'pending'
```

---

## Error Handling

If any data source is missing or malformed:
1. Use fallback values (0 for counts, empty arrays for lists)
2. Add warning comment in generated HTML
3. Report parsing errors to user
4. Continue generation with available data

Example:
```python
try:
    speakers = parse_speaker_database()
except FileNotFoundError:
    speakers = {'total': 0, 'confirmed': 0, 'tier1': []}
    print("⚠️  Warning: speaker-database.md not found, using defaults")
```

---

## Preservation Rules

**Always Preserve:**
- CSS stylesheet (styles.css) - never modify
- Design system (colors, layout, components)
- Navigation structure
- Responsive behavior
- JavaScript countdown timer functionality

**Always Update:**
- Metrics and numbers
- Dates and countdowns
- Status indicators
- Progress bars
- Lists of items (speakers, communications, etc.)

---

## Usage Workflow

1. **User invokes skill:**
   ```
   User: "Update the dashboard"
   ```

2. **You execute:**
   - Read all data source files
   - Parse metrics and data
   - Regenerate all 8 HTML pages
   - Report what changed

3. **User reviews:**
   - Opens `/home/user/IPS26-Dubai/dashboard/index.html`
   - Sees updated metrics
   - All pages reflect current project state

4. **Optional: Commit changes**
   ```bash
   git add dashboard/
   git commit -m "Update dashboard: 2 speakers confirmed, €20K delivered"
   ```

---

## Future Enhancements

When user requests, you can add:
- **Auto-generation on file changes** (git hooks)
- **Export to PDF** functionality
- **Charts/graphs** for trends
- **Email summaries** of weekly progress
- **Mobile app** version
- **Dark mode** toggle persistence

---

## Example Invocations

User might say:
- "Update dashboard"
- "Regenerate dashboard"
- "Refresh dashboard with latest data"
- "Generate updated dashboard"
- "Dashboard update"

All should trigger this skill and regenerate all pages.

---

**Last Updated:** November 14, 2025
**Skill Version:** 1.0
