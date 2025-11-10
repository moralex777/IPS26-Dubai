# Manus Task Specification: IPS26 Full Agenda Speaker & Content Research

**Date Created:** 2025-11-10
**Created By:** Claude Code (main session)
**Category:** speaker-research + content-strategy
**Priority:** High
**Estimated Complexity:** Complex
**Estimated Credits:** 600-800 (3-4 hours)

---

## 1. OBJECTIVE

**Primary Goal:**
Analyze all 53 sessions across IPS26 Dubai 2026's full 3-day agenda (both Conference and Institutional Investor tracks) to:
1. Identify 2-3 Fortune 500/Tier-1 speaker prospects per session
2. Develop comprehensive RealTimes content strategy with 4 angles per session

**Success Criteria:**
- [X] 100% of 53 sessions analyzed with speaker recommendations
- [X] 100% of 53 sessions analyzed with RealTimes content angles
- [X] Minimum 90% data completeness for required fields
- [X] All speaker prospects include: name, company, title, expertise match, LinkedIn URL
- [X] All content angles include: specific topic, target audience, publication timing

---

## 2. DELIVERABLE FORMAT

**Output Type:** JSON

**Required Data Structure:**
```json
{
  "metadata": {
    "event_name": "IPS Congress 2026",
    "event_dates": "April 13-15, 2026",
    "location": "Dubai World Trade Centre, UAE",
    "total_sessions_analyzed": 53,
    "analysis_date": "YYYY-MM-DD",
    "manus_credits_used": 0
  },
  "sessions": [
    {
      "session_id": "day1-main-001",
      "day": "Sunday, April 13, 2026",
      "track": "Main Conference Track",
      "time": "1:45 PM – 2:25 PM",
      "session_title": "Shaping 2030: AI, Cities & the New Urban Code",
      "duration_minutes": 40,
      "session_type": "Panel Discussion",
      "session_description": "Global leaders examine AI-powered investment, climate resilience, and wellness-driven design shaping future cities.",
      "alexander_involvement": "Primary Panel Moderator",
      "speaker_prospects": [
        {
          "name": "RJ Pittman",
          "company": "Matterport",
          "title": "CEO",
          "expertise_match": "AI-powered digital twins for real estate visualization and investment analysis",
          "linkedin_url": "https://www.linkedin.com/in/rjpittman/",
          "rationale": "1-sentence explanation of why this person is perfect for this specific session",
          "priority": "High",
          "geographic_region": "North America"
        },
        {
          "name": "[Second Prospect]",
          "company": "[Company]",
          "title": "[Title]",
          "expertise_match": "[Specific expertise matching session theme]",
          "linkedin_url": "[URL]",
          "rationale": "[Why they fit]",
          "priority": "Medium/High",
          "geographic_region": "[Region]"
        },
        {
          "name": "[Third Prospect]",
          "company": "[Company]",
          "title": "[Title]",
          "expertise_match": "[Specific expertise matching session theme]",
          "linkedin_url": "[URL]",
          "rationale": "[Why they fit]",
          "priority": "Medium",
          "geographic_region": "[Region]"
        }
      ],
      "realtimes_content_angles": {
        "pre_event_thought_leadership": {
          "article_title": "AI-Powered Urban Planning: How PropTech is Reshaping Cities by 2030",
          "key_themes": ["AI innovation", "smart cities", "climate resilience", "wellness design"],
          "target_audience": "CRE investors, PropTech founders, urban planners, policymakers",
          "publication_timing": "January-March 2026 (2-3 months pre-event)",
          "content_format": "1,200-1,500 word analysis article",
          "strategic_value": "Positions RealTimes as thought leader in AI/PropTech convergence ahead of IPS26"
        },
        "speaker_spotlight_series": {
          "interview_angle": "Q&A with Fortune 500 CEOs on AI's Role in Sustainable Urban Development",
          "target_speakers": ["RJ Pittman (Matterport)", "Matthias Rebellius (Siemens)", "Erin Meezan (JLL)"],
          "interview_format": "5-10 minute video + written transcript",
          "publication_timing": "February-March 2026 (4-8 weeks pre-event)",
          "distribution_channels": ["LinkedIn", "YouTube", "RealTimes website"],
          "strategic_value": "Builds relationships with speakers, generates pre-event buzz, demonstrates RealTimes media partner value"
        },
        "industry_trend_analysis": {
          "deep_dive_topic": "The Convergence of AI, Climate Tech, and Wellness Design in 2026 Real Estate",
          "research_components": ["Market data", "technology trends", "case studies", "expert quotes"],
          "publication_timing": "January 2026 (3 months pre-event)",
          "content_format": "2,000+ word comprehensive report with data visualizations",
          "strategic_value": "Establishes RealTimes as authoritative source on PropTech megatrends; SEO value for IPS26-related searches"
        },
        "event_positioning_content": {
          "positioning_angle": "Why IPS26's 'Shaping 2030' Panel is the Must-Attend Session for PropTech Leaders",
          "content_type": "Event preview article",
          "publication_timing": "March 2026 (4-6 weeks pre-event)",
          "target_audience": "IPS26 prospective attendees, industry decision-makers",
          "distribution_strategy": "Cross-promote with IPS organizers, tag all speakers/sponsors",
          "strategic_value": "Drives event attendance, positions RealTimes as official media partner, builds Alexander's moderator credibility"
        }
      },
      "realtimes_coverage_priority": "Very High",
      "realtimes_coverage_rationale": "Alexander's primary moderating panel; highest visibility; aligns with all RealTimes core themes (AI, PropTech, sustainability, smart cities)"
    }
  ]
}
```

**File Naming Convention:**
`ips26-full-agenda-speaker-content-research-results-2025-11-10.json`

**Example Output:**
`ips26-full-agenda-speaker-content-research-results-2025-11-10.json`

---

## 3. RESEARCH PARAMETERS

**Target Count:** 53 sessions (all sessions from IPS26-AGENDA-FULL-2026.md)

**Geographic Scope for Speaker Prospects:**
- Primary: Europe, UAE, Saudi Arabia, North America
- Secondary: Asia-Pacific (Singapore, Hong Kong), UK
- Rationale: Match IPS26's 153-country attendee base with emphasis on EU-MENA bridge positioning

**Time Period:**
- Speaker research: Current roles (2024-2025)
- Content analysis: Forward-looking (2026-2030 trends)

**Data Sources to Use:**
- [X] LinkedIn profiles (speaker prospects)
- [X] Company websites (validate roles, expertise)
- [X] Recent conference speaker lists (validate speaking experience)
- [X] Industry publications (PropTech, smart cities, climate tech, institutional real estate)
- [X] Recent news articles (2024-2025, validate thought leadership)
- [X] Fortune 500 company directories (prioritize Tier-1 executives)

**Exclusions/Filters:**
- Exclude speakers already confirmed for IPS26 (if publicly announced)
- Prioritize C-level executives (CEO, CTO, CIO, Chief Sustainability Officer)
- Prioritize Fortune 500 companies, Tier-1 institutional investors, sovereign wealth funds
- Avoid overly sales-focused prospects (prefer thought leaders and innovators)
- For RealTimes content: Focus on evergreen themes (avoid time-sensitive topics that may become stale)

---

## 4. DETAILED INSTRUCTIONS

### INPUT FILE LOCATION
**Primary Source:** `/home/alex/IPS26-Dubai/IPS26-AGENDA-FULL-2026.md`

**What to Analyze:**
- All 53 sessions across 3 days (April 13-15, 2026)
- Both tracks: Main Conference Track + Institutional Investor Conference Track
- Session details: title, description, type, duration, time

### Step 1: Parse IPS26 Agenda
1. Read `/home/alex/IPS26-Dubai/IPS26-AGENDA-FULL-2026.md` line by line
2. Extract all sessions with these fields:
   - Day (Sunday April 13, Monday April 14, Tuesday April 15)
   - Track (Main Conference Track OR Institutional Investor Conference Track)
   - Time (e.g., "1:45 PM – 2:25 PM")
   - Session title (line starting with "**Session:**")
   - Duration (extract minutes from "**Duration:**")
   - Session type (e.g., Panel Discussion, Keynote, Boardroom Session)
   - Description (paragraph following session header)
   - Alexander's involvement (if noted in session description or "**Alexander's Opportunity:**")

3. Create unique session_id for each session: `day[1-3]-[main|institutional]-[001-053]`

### Step 2: Research Speaker Prospects (2-3 per session)
For EACH of the 53 sessions:

1. **Analyze session theme and expertise requirements:**
   - Read session title and description carefully
   - Identify 2-3 core expertise domains required (e.g., "AI/PropTech", "Smart Cities", "Climate Resilience", "Tokenization", "Institutional Capital Flows")

2. **Search for Fortune 500/Tier-1 prospects matching those domains:**
   - Use LinkedIn to find C-level executives at Fortune 500 companies
   - Prioritize: CEOs, CTOs, CIOs, Chief Sustainability Officers, Managing Directors
   - Geographic preference: Europe (40%), UAE/Saudi Arabia (30%), North America (20%), Other (10%)
   - Validate they have relevant speaking experience (check recent conference appearances)

3. **For each prospect, gather:**
   - Full name (properly capitalized)
   - Current company
   - Current title
   - Specific expertise match (1 sentence, tailored to THIS session's theme)
   - LinkedIn profile URL (validate it's functional)
   - Rationale (1 sentence: why they're perfect for THIS specific session)
   - Priority level: High (perfect fit) / Medium (good fit)
   - Geographic region: North America / Europe / MENA / Asia-Pacific

4. **Quality standards for speaker prospects:**
   - MUST be Fortune 500 OR Tier-1 institutional investor OR sovereign wealth fund
   - MUST have public thought leadership presence (LinkedIn, industry publications)
   - MUST have speaking experience at major conferences
   - PREFER executives with sustainability/ESG focus (aligns with IPS26 themes)

### Step 3: Develop RealTimes Content Angles (4 angles per session)
For EACH of the 53 sessions:

1. **Pre-Event Thought Leadership Article:**
   - Create compelling article title (60-80 characters, SEO-friendly)
   - Identify 3-4 key themes from session description
   - Define target audience (be specific: "CRE investors" not just "investors")
   - Specify publication timing (e.g., "January-March 2026")
   - Specify content format (e.g., "1,200-1,500 word analysis")
   - Explain strategic value (why this article matters for RealTimes positioning)

2. **Speaker Spotlight Series:**
   - Define interview angle (specific question or theme)
   - Identify 2-3 target speakers from prospect list (by name)
   - Specify interview format (e.g., "5-10 minute video + transcript")
   - Specify publication timing (e.g., "February-March 2026")
   - List distribution channels (LinkedIn, YouTube, RealTimes website)
   - Explain strategic value (relationship building, pre-event buzz, media partner value)

3. **Industry Trend Analysis:**
   - Define deep-dive topic (specific, actionable, forward-looking)
   - List research components (market data, tech trends, case studies, expert quotes)
   - Specify publication timing (e.g., "January 2026")
   - Specify content format (e.g., "2,000+ word report with data visualizations")
   - Explain strategic value (authority positioning, SEO, thought leadership)

4. **Event Positioning Content:**
   - Define positioning angle (why this session matters)
   - Specify content type (e.g., "Event preview article", "Session spotlight")
   - Specify publication timing (e.g., "March 2026, 4-6 weeks pre-event")
   - Define target audience (prospective IPS26 attendees, decision-makers)
   - Explain distribution strategy (cross-promotion with IPS, speaker tagging)
   - Explain strategic value (drive attendance, media partner positioning, moderator credibility)

5. **Assign RealTimes Coverage Priority:**
   - Very High: Alexander's moderating sessions, main stage panels, high-profile keynotes
   - High: Strategic fit with RealTimes themes (AI, PropTech, sustainability, smart cities)
   - Medium: Niche topics, secondary tracks, lower visibility
   - Low: Administrative sessions, networking breaks, low content value

6. **Write RealTimes Coverage Rationale:**
   - 1-2 sentences explaining why this session is/isn't high priority
   - Consider: Alexander's involvement, topic alignment, audience reach, media value

### Step 4: Quality Check
Before finalizing JSON output:

- [ ] Verify all 53 sessions analyzed (no missing sessions)
- [ ] Check data completeness: >90% of required fields populated
- [ ] Validate all LinkedIn URLs are functional (use real URLs, not placeholders)
- [ ] Remove duplicate speaker prospects across sessions (same person can appear max 2-3 times)
- [ ] Verify geographic diversity: Europe (40%), MENA (30%), North America (20%), Other (10%)
- [ ] Check RealTimes content angles are specific and actionable (not generic)
- [ ] Validate publication timings are realistic (January-March 2026 for pre-event content)
- [ ] Ensure all article titles are SEO-friendly and compelling
- [ ] Confirm priority scores are justified by coverage rationale

---

## 5. QUALITY CRITERIA

**Minimum Data Completeness:** 95%

**Required Fields (MUST be present for all 53 sessions):**
- session_id, day, track, time, session_title, duration_minutes, session_type, session_description
- speaker_prospects array (2-3 prospects, each with: name, company, title, expertise_match, linkedin_url, rationale, priority, geographic_region)
- realtimes_content_angles object (all 4 angles: pre_event_thought_leadership, speaker_spotlight_series, industry_trend_analysis, event_positioning_content)
- realtimes_coverage_priority (Very High / High / Medium / Low)
- realtimes_coverage_rationale (1-2 sentences)

**Optional Fields:**
- alexander_involvement (only if he's moderating or has specific opportunity noted in agenda)

**Validation Checks:**
- [ ] All LinkedIn URLs start with https://www.linkedin.com/
- [ ] No duplicate speaker prospects within same session
- [ ] All names properly capitalized (e.g., "RJ Pittman" not "rj pittman")
- [ ] All dates in "Month DD, YYYY" format (e.g., "April 13, 2026")
- [ ] All times in "HH:MM AM/PM" format (e.g., "1:45 PM")
- [ ] Geographic regions use standard values: "North America", "Europe", "MENA", "Asia-Pacific", "Latin America"
- [ ] Priority levels use standard values: "High", "Medium"
- [ ] Coverage priority uses standard values: "Very High", "High", "Medium", "Low"
- [ ] All article titles 60-80 characters (optimal for SEO and LinkedIn headlines)

---

## 6. CREDIT BUDGET

**Estimated Complexity:** Complex (600-800 credits for 3-4 hours)

**Maximum Acceptable Credits:** 1,000 credits

**Optimization Notes:**
- Use stable instruction prefixes for KV-cache efficiency
- Batch LinkedIn searches by company (e.g., search "Siemens PropTech executives" once, extract multiple prospects)
- Reuse speaker prospects across similar sessions (e.g., same prospect for "Smart Cities" and "Digital Twins" panels)
- Focus depth on High/Very High priority sessions; brief analysis for Low priority sessions
- Save interim results to file system every 10-15 sessions to avoid data loss

---

## 7. SUCCESS METRICS

**How to Evaluate Task Success:**

1. **Completeness:** 100% of 53 sessions analyzed with all required fields (target: 95%+ field completion)
2. **Accuracy:** Spot-check 10 random LinkedIn URLs for functionality (target: 100% valid)
3. **Quality:** Review 5 random "speaker prospect rationales" for specificity (target: tailored to session, not generic)
4. **Timeliness:** Task completed within 4 hours (target: 3-4 hours)
5. **Credit Efficiency:** Credits used ≤ 18 credits per session average (53 sessions × 18 = 954 credits)

**Post-Completion Human Review Criteria:**
- Are speaker prospects truly Fortune 500/Tier-1? (No small startups or junior roles)
- Are RealTimes content angles specific and actionable? (Not generic "write an article about X")
- Do publication timings make sense? (Pre-event content in Jan-Mar 2026, not Apr 2026)
- Is geographic diversity balanced? (Not 90% North America, should be EU-MENA heavy)

---

## 8. FILE OUTPUT LOCATION

**Save Results To:**
`/home/alex/IPS26-Dubai/manus-outputs/content-strategy/ips26-full-agenda-speaker-content-research-results-2025-11-10.json`

**File Format:** Single JSON file (not multiple files)

**File Size Estimate:** 150-250 KB (53 sessions × ~3-4 KB per session)

---

## 9. POST-EXECUTION CHECKLIST

After Manus completes the task:

- [ ] Download results from Manus interface
- [ ] Upload to `/home/alex/IPS26-Dubai/manus-outputs/content-strategy/`
- [ ] Verify file integrity (valid JSON, can be parsed, not corrupted)
- [ ] Spot-check 5 random sessions for quality
- [ ] Update `/home/alex/IPS26-Dubai/operations/manus-integration/credit-tracker.md` (if exists)
- [ ] Git commit with message: `MANUS: IPS26 full agenda speaker & content research - 53 sessions analyzed - [CREDITS] credits`
- [ ] Notify Alexander: "IPS26 Manus research complete. Ready for Claude Code review."
- [ ] Alexander notifies Claude Code to git pull latest changes
- [ ] Claude Code reviews JSON output and integrates into:
  - Speaker outreach campaign (prioritize High prospects)
  - RealTimes content calendar (schedule Jan-Mar 2026 articles)
  - IPS26 contribution tracker (update speaker recruitment progress)

---

## 10. NOTES / SPECIAL INSTRUCTIONS

**Context:**
- This is the FIRST test task for Manus AI integration with IPS26-Dubai project
- Alexander wants to validate Manus AI's research quality before delegating larger tasks
- Focus on breadth (all 53 sessions) rather than extreme depth (brief is fine for Low priority sessions)
- The goal is to create a comprehensive foundation for speaker outreach + RealTimes content strategy

**Known Edge Cases:**
- Some sessions have anomalous timing data (e.g., "12:23 PM – 12:23 PM") - note these in session_description or add a "data_quality_issue" flag
- Alexander's involvement is confirmed for April 13 "Shaping 2030" panel and flexible boardroom moderating - prioritize these sessions with "Very High" coverage
- Some sessions are networking breaks or administrative - these can have minimal speaker prospects (1-2 instead of 3) and lower content priority

**Strategic Priorities for Speaker Prospects:**
1. **Tier-1 Priority Topics:** AI/PropTech, Smart Cities, Climate Resilience, Tokenization, Institutional Capital Flows
2. **Geographic Priorities:** Europe (40%), MENA (30%), North America (20%), Other (10%)
3. **Company Priorities:** Fortune 500 > Sovereign Wealth Funds > Tier-1 VCs > Major PropTech unicorns
4. **Role Priorities:** CEO > CTO/CIO > Chief Sustainability Officer > Managing Director > VP-level

**Strategic Priorities for RealTimes Content:**
1. **Content Types:** Thought leadership > Speaker spotlights > Trend analysis > Event previews
2. **Publication Timing:** January 2026 (trend analysis) > February 2026 (thought leadership) > March 2026 (event positioning)
3. **Distribution Strategy:** LinkedIn articles on RealTimes company page > YouTube interviews > Website blog posts
4. **SEO Keywords:** "PropTech 2026", "IPS Congress Dubai", "AI Smart Cities", "Climate Tech Real Estate", "Tokenization REITs"

**Success Definition:**
If this test task produces:
- 100+ actionable speaker prospects (2-3 per session × 53 sessions = 106-159 prospects)
- 212 content angles (4 per session × 53 sessions)
- 95%+ data completeness
- <1,000 credits consumed

Then Manus AI integration is validated and we'll proceed with additional deep-dive tasks (e.g., detailed LinkedIn research on Top 20 speaker prospects, attendee intelligence gathering, media partner benchmarking).

---

**Navigation:** `/home/alex/IPS26-Dubai/manus-tasks/ips26-full-agenda-speaker-content-research-v1.md`
**Copy this spec and paste into Manus AI web interface to execute**
