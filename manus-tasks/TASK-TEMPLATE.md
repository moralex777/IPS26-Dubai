# Manus AI Task Template

**Version:** 1.0
**Created:** 2025-11-10
**Event:** IPS26-Dubai

---

## TASK OVERVIEW

**Task Name:** [descriptive-task-name]
**Objective:** [1-2 sentence description of what this task accomplishes]
**Priority:** [High/Medium/Low]
**Estimated Duration:** [hours]
**Estimated Credits:** [credit range based on duration benchmarks]

---

## INPUT SOURCES

**Required Files:**
- `/home/alex/PTC26-Dubai/IPS26-Dubai/[file-path]`
- [Additional files or data sources]

**External Sources:**
- [Websites to scrape]
- [LinkedIn profiles to research]
- [Databases to query]

**Context Requirements:**
- [Background information needed]
- [Constraints or limitations]

---

## RESEARCH OBJECTIVES

**Primary Objectives:**
1. [Specific data point to gather]
2. [Specific analysis to perform]
3. [Specific output to generate]

**Quality Criteria:**
- Completeness threshold: [X%] of target data points
- Accuracy requirement: [verification method]
- Freshness: Data from [time period]

---

## OUTPUT SPECIFICATIONS

**Format:** [JSON/CSV/Markdown/Mixed]

**Structure:**
```json
{
  "example_field": "value",
  "nested_object": {
    "field": "value"
  },
  "array_field": [
    {"item": "value"}
  ]
}
```

**Required Fields:**
- `field_name` (type): Description
- `field_name` (type): Description

**File Naming Convention:**
`[task-name]-results-YYYY-MM-DD.[ext]`

**Delivery Location:**
`/home/alex/PTC26-Dubai/IPS26-Dubai/manus-outputs/[category]/[filename]`

---

## EXECUTION INSTRUCTIONS

**Step 1:** [First action to take]
**Step 2:** [Second action to take]
**Step 3:** [Continue with detailed steps]

**Special Considerations:**
- [Edge cases to handle]
- [Known issues to avoid]
- [Optimization tips]

---

## SUCCESS METRICS

**Quantitative:**
- [Metric 1]: Target value
- [Metric 2]: Target value

**Qualitative:**
- [Quality indicator 1]
- [Quality indicator 2]

---

## INTEGRATION PLAN

**Post-Completion Actions:**
1. Human downloads results from Manus AI
2. Human uploads to specified output directory
3. Human commits: "MANUS: [task-name] - [summary] - [credits-used] credits"
4. Claude Code reviews outputs for quality
5. Claude Code integrates into: [downstream deliverables]

**Dependencies:**
- Blocks: [tasks that depend on this completion]
- Depends on: [tasks that must complete first]

---

## CREDIT MANAGEMENT

**Budget Allocation:**
- Task type: [Simple/Standard/Complex]
- Estimated credits: [range]
- Maximum acceptable: [hard cap]

**Optimization Notes:**
- [How to reduce credit consumption]
- [KV-cache efficiency tips]

---

## NOTES & LEARNINGS

**Iteration History:**
- v1.0 (YYYY-MM-DD): Initial spec

**Lessons Learned:**
- [Post-execution notes]
- [What worked/didn't work]
- [Improvements for next iteration]

---

**Navigation:**
- Task specs: `/home/alex/PTC26-Dubai/IPS26-Dubai/manus-tasks/`
- Outputs: `/home/alex/PTC26-Dubai/IPS26-Dubai/manus-outputs/`
- Integration tracking: `/home/alex/PTC26-Dubai/IPS26-Dubai/operations/manus-integration/`
