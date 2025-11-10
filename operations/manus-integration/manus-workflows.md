# Manus AI Workflows - Reusable Templates

**Purpose:** Documented workflows for common Manus AI tasks in PTC26 project
**Last Updated:** November 7, 2025

---

## WORKFLOW 1: Speaker Enrichment (Batch Processing)

**Use Case:** Enrich existing speaker database with detailed bios, LinkedIn, speaking history

**Estimated Duration:** 3-4 hours (autonomous)
**Estimated Credits:** 1,500-2,000 (for 30 speakers)
**Complexity:** Standard to Complex

### Task Specification Template

```markdown
# Manus Task: Speaker Enrichment - Batch [N]

## Objective
Enrich [X] PropTech speakers from PTC26 Dubai with comprehensive professional profiles.

## Input Data
CSV file with: Company, First Name, Last Name, Role
Location: /PTC26_Dubai_Speakers.csv (rows [start]-[end])

## Required Output Fields (JSON)
{
  "company": "string",
  "first_name": "string",
  "last_name": "string",
  "role": "string",
  "bio": "string (200-500 words, comprehensive career history)",
  "linkedin_url": "string (validate: linkedin.com/in/...)",
  "recent_speaking": ["array of recent conferences/panels (last 2 years)"],
  "thought_leadership": ["array of articles, podcasts, interviews"],
  "expertise_areas": ["array of key PropTech topics"],
  "company_description": "string (50-100 words)"
}

## Research Sources
- LinkedIn profiles (mandatory)
- Company websites
- Conference speaker listings (PropTech events)
- News articles and press releases
- Industry publications (RE Tech, PropTech Insights)

## Quality Criteria
- Bio completeness: >90% of speakers
- LinkedIn URLs: Valid and functional
- Speaking history: Minimum 1 recent event if available
- No duplicates, proper name capitalization

## File Output
Save to: speaker-enrichment-batch-[N]-results-YYYY-MM-DD.json
```

### Post-Execution Checklist

1. Download JSON results from Manus
2. Validate data completeness (target: >90%)
3. Spot-check 5 random profiles for accuracy
4. Upload to `/manus-outputs/speaker-research/`
5. Update credit-tracker.md with actual credits used
6. Git commit: "MANUS: Speaker enrichment batch [N] - [X] speakers - [Y] credits"

---

## WORKFLOW 2: Media Partner Intelligence

**Use Case:** Research PTC sponsors/partners for partnership proposals

**Estimated Duration:** 4-5 hours (autonomous)
**Estimated Credits:** 2,500-3,000 (for 25 partners)
**Complexity:** Complex

### Task Specification Template

```markdown
# Manus Task: Media Partner Intelligence - PTC Sponsors

## Objective
Research [X] PropTech Connect sponsors/partners for RealTimes media partnership outreach.

## Input Data
List of companies from https://proptechconnect.com/ (sponsors page)

## Required Output Fields (JSON)
{
  "company_name": "string",
  "industry": "string (CRE tech, PropTech, FinTech, etc.)",
  "headquarters": "string (city, country)",
  "company_size": "string (employees range)",
  "decision_makers": [
    {
      "name": "string",
      "role": "string (CMO, Marketing Director, Partnerships Lead)",
      "linkedin_url": "string",
      "email": "string (if publicly available)"
    }
  ],
  "recent_media_partnerships": ["array of similar partnerships"],
  "marketing_focus": "string (content marketing, events, digital)",
  "pain_points": ["array of identified challenges"],
  "partnership_opportunities": "string (why RealTimes is good fit)"
}

## Research Sources
- Company websites (About, Leadership pages)
- LinkedIn company pages + decision-maker profiles
- Press releases (last 12 months)
- Industry news (PropTech/CRE publications)
- Event sponsorship history

## Quality Criteria
- Decision-makers: Minimum 1 per company
- LinkedIn URLs: Validated
- Pain points: Evidence-based (from research, not speculation)
- Partnership fit: Specific value proposition

## File Output
Save to: media-partner-intelligence-ptc-sponsors-YYYY-MM-DD.json
```

### Post-Execution Checklist

1. Download JSON results
2. Validate decision-maker contact info (LinkedIn URLs functional)
3. Review partnership opportunities (quality check)
4. Upload to `/manus-outputs/media-partners/`
5. Pass to PTC26-writer for personalized proposal drafting
6. Update credit-tracker.md
7. Git commit

---

## WORKFLOW 3: Attendee List Profiling (PropertyTalents Pipeline)

**Use Case:** Profile registered attendees for PropertyTalents sales pipeline

**Estimated Duration:** 5-6 hours (autonomous)
**Estimated Credits:** 4,000-5,000 (for 100 attendees)
**Complexity:** Complex

### Task Specification Template

```markdown
# Manus Task: Attendee Profiling - PropertyTalents Pipeline

## Objective
Profile [X] PTC26 Dubai attendees to identify PropertyTalents client prospects (C-level, hiring managers).

## Input Data
Attendee list (when available): Company, Name, Title
Priority: CRE companies, PropTech startups, Real Estate funds

## Required Output Fields (JSON)
{
  "attendee_name": "string",
  "title": "string",
  "company": "string",
  "company_type": "string (CRE, PropTech, VC/PE, Service Provider)",
  "company_size": "string",
  "hiring_potential": "string (high/medium/low)",
  "recent_hiring_activity": ["array of job postings, team expansions"],
  "decision_making_authority": "string (yes/no/unclear)",
  "linkedin_url": "string",
  "company_challenges": ["array (expansion, digital transformation, etc.)"],
  "propertytalents_fit_score": "integer (1-10)",
  "outreach_priority": "string (tier-1/tier-2/tier-3)"
}

## Research Sources
- LinkedIn profiles (professional background)
- Company careers pages (active job postings)
- Press releases (expansion announcements)
- Industry news (company growth signals)
- Company size databases (Crunchbase, LinkedIn)

## Quality Criteria
- PropertyTalents fit score: Evidence-based (not random)
- Hiring signals: Concrete evidence (job postings, team expansions)
- Outreach priority: Clear segmentation logic
- Minimum 80% profile completeness

## File Output
Save to: attendee-profiling-propertytalents-pipeline-YYYY-MM-DD.json
```

### Post-Execution Checklist

1. Download JSON results
2. Filter tier-1 prospects (fit score ≥8)
3. Validate hiring signals (spot-check 10 companies)
4. Upload to `/manus-outputs/attendee-intelligence/`
5. Create follow-up meeting request strategy (Claude Code)
6. Update credit-tracker.md
7. Git commit

---

## WORKFLOW 4: Competitor Event Analysis

**Use Case:** Research PropTech events for Speaker Exchange Network benchmarking

**Estimated Duration:** 2-3 hours (autonomous)
**Estimated Credits:** 1,500-2,000
**Complexity:** Standard

### Task Specification Template

```markdown
# Manus Task: Competitor Event Analysis - PropTech Landscape

## Objective
Research [X] PropTech/CRE events (Europe, MENA) for Speaker Exchange Network positioning.

## Events to Research
- Riyadh PropTech Summit (Saudi Arabia)
- MIPIM (Cannes, France)
- UK PropTech Conference (London)
- CREtech (various locations)
- PropTech Berlin
- [Add others as needed]

## Required Output Fields (JSON)
{
  "event_name": "string",
  "location": "string (city, country)",
  "frequency": "string (annual, bi-annual)",
  "attendee_count": "integer (estimated)",
  "target_audience": "string (investors, CRE, PropTech startups)",
  "speaker_recruitment_model": "string (paid, partnership, invitation-only)",
  "media_partnerships": ["array of official media partners"],
  "sponsorship_tiers": ["array with pricing if available"],
  "speaker_exchange_potential": "string (high/medium/low)",
  "organizer_contacts": [
    {
      "name": "string",
      "role": "string",
      "linkedin_url": "string",
      "email": "string (if publicly available)"
    }
  ]
}

## Research Sources
- Event websites (speakers, partners, sponsors pages)
- LinkedIn (organizer profiles, event posts)
- Industry news coverage
- Past attendee testimonials
- Event reports/recaps

## Quality Criteria
- Organizer contacts: Minimum 1 per event
- Speaker recruitment model: Documented (not guessed)
- Speaker Exchange potential: Evidence-based reasoning

## File Output
Save to: competitor-event-analysis-proptech-landscape-YYYY-MM-DD.json
```

### Post-Execution Checklist

1. Download JSON results
2. Prioritize events with high Speaker Exchange potential
3. Draft outreach strategy for organizers (Claude Code)
4. Upload to `/manus-outputs/competitor-analysis/`
5. Update Speaker Exchange Network framework document
6. Update credit-tracker.md
7. Git commit

---

## WORKFLOW 5: Meeting Target Intelligence (Feb 2026 Dubai)

**Use Case:** Research strategic meeting targets for February 2026 Dubai trip

**Estimated Duration:** 3-4 hours (autonomous)
**Estimated Credits:** 3,000-3,500 (for 30 targets)
**Complexity:** Complex

### Task Specification Template

```markdown
# Manus Task: Meeting Intelligence - Feb 2026 Dubai Targets

## Objective
Research [X] strategic meeting targets attending PTC26 Dubai (Feb 4-5, 2026).

## Input Data
List of high-priority contacts:
- PTC organizers (Carmine + team)
- Key sponsors/partners
- Featured speakers
- C-level PropTech attendees

## Required Output Fields (JSON)
{
  "name": "string",
  "title": "string",
  "company": "string",
  "meeting_objective": "string (partnership, PropertyTalents, Pre-A Club VC, networking)",
  "background_intel": {
    "career_history": "string (brief, key milestones)",
    "recent_achievements": ["array (awards, promotions, projects)"],
    "interests": ["array (professional + personal if public)"],
    "recent_activity": ["array (LinkedIn posts, articles, events in last 3 months)"]
  },
  "conversation_hooks": ["array of personalized talking points"],
  "value_proposition": "string (what Alexander offers)",
  "meeting_prep_notes": "string (2-3 bullet points for quick reference)",
  "linkedin_url": "string"
}

## Research Sources
- LinkedIn profiles (posts, activity, network)
- Company press releases
- Industry news mentions
- Conference panels/speaking history
- Articles and thought leadership content

## Quality Criteria
- Conversation hooks: Specific and recent (last 3-6 months)
- Value proposition: Tailored to individual's current focus
- Meeting prep notes: Actionable and concise

## File Output
Save to: meeting-intelligence-feb-2026-dubai-YYYY-MM-DD.json
```

### Post-Execution Checklist

1. Download JSON results
2. Review conversation hooks for authenticity (no generic content)
3. Print meeting briefs for offline reference during event
4. Upload to `/manus-outputs/meeting-intelligence/`
5. Create meeting request emails (PTC26-writer agent)
6. Update trip logistics master plan
7. Update credit-tracker.md
8. Git commit

---

## GENERAL BEST PRACTICES

### Before Submitting Any Manus Task

1. ✅ Use TASK-TEMPLATE.md as base structure
2. ✅ Define clear success criteria and quality thresholds
3. ✅ Specify exact output format (JSON structure with all fields)
4. ✅ Set realistic credit budget ceiling
5. ✅ Review for optimization opportunities (group related queries)

### During Manus Execution

1. ✅ Monitor "Computer" interface periodically (every 30-60 min)
2. ✅ Watch for credit burn rate anomalies (cancel if excessive)
3. ✅ Check interim results if Manus shows preview
4. ✅ Note any errors or warnings for post-execution analysis

### After Manus Completion

1. ✅ Download results immediately (don't let them sit)
2. ✅ Validate data quality BEFORE uploading to git
3. ✅ Update credit-tracker.md with actual consumption
4. ✅ Git commit with descriptive message including credit cost
5. ✅ Schedule Claude Code review session (pull latest from git)

---

## SUCCESS METRICS TRACKING

### Key Metrics to Track Per Workflow

**Efficiency:**
- Time saved vs. manual Claude Code approach
- Credits per record (e.g., credits per speaker researched)
- Actual vs. estimated credit consumption

**Quality:**
- Data completeness rate (% of required fields populated)
- Accuracy rate (spot-check validation)
- Usability score (how well outputs serve downstream tasks)

**Iteration Improvement:**
- Number of re-runs required
- Common failure patterns
- Optimization opportunities discovered

---

## WORKFLOW ITERATION LOG

### Version History

**v1.0 (Nov 7, 2025):**
- Initial workflows created based on Manus AI speaker file success
- Speaker enrichment workflow tested (59 speakers, ~900 credits, 85% completeness)
- Templates optimized for official Manus best practices

**v1.1 (TBD):**
- [Document workflow improvements based on real usage]
- [Add new workflows as discovered]
- [Update credit estimates based on actual consumption]

---

**Navigation:** `/home/alex/IPS26-Dubai/operations/manus-integration/manus-workflows.md`
**Related Files:**
- Task template: `/manus-tasks/TASK-TEMPLATE.md`
- Credit tracking: `/operations/manus-integration/credit-tracker.md`
- Integration guide: `CLAUDE.md` (search for "MANUS AI PRO INTEGRATION")
