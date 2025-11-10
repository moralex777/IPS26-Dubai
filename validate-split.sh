#!/bin/bash

# IPS26 Split Validation Script
# Purpose: Validate that split was successful
# Usage: bash validate-split.sh /path/to/ips26-dubai
#
# Checks:
# - All required files present
# - No PTC26 references (except historical docs)
# - Markdown links functional
# - Git structure intact
# - Agent files have IPS26 prefixes

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

TARGET_DIR="${1:-.}"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
VALIDATION_REPORT="./split-validation-report-$TIMESTAMP.txt"

echo -e "${BLUE}=== IPS26 Split Validation ===${NC}"
echo "Target directory: $TARGET_DIR"
echo ""

{
  echo "=== IPS26 Split Validation Report ===" >> "$VALIDATION_REPORT"
  echo "Timestamp: $TIMESTAMP" >> "$VALIDATION_REPORT"
  echo "Directory: $TARGET_DIR" >> "$VALIDATION_REPORT"
  echo "" >> "$VALIDATION_REPORT"
}

PASS_COUNT=0
FAIL_COUNT=0

# Validation 1: Directory exists
echo -ne "${YELLOW}1. Checking directory exists...${NC}"
if [ -d "$TARGET_DIR" ]; then
  echo -e " ${GREEN}✓${NC}"
  ((PASS_COUNT++))
  echo "PASS: Directory exists" >> "$VALIDATION_REPORT"
else
  echo -e " ${RED}✗${NC}"
  ((FAIL_COUNT++))
  echo "FAIL: Directory does not exist" >> "$VALIDATION_REPORT"
  exit 1
fi

# Validation 2: File count
echo -ne "${YELLOW}2. Checking file count (should be 50+)...${NC}"
FILE_COUNT=$(find "$TARGET_DIR" -type f | wc -l)
if [ $FILE_COUNT -gt 50 ]; then
  echo -e " ${GREEN}✓${NC} ($FILE_COUNT files)"
  ((PASS_COUNT++))
  echo "PASS: File count is $FILE_COUNT (target: 50+)" >> "$VALIDATION_REPORT"
else
  echo -e " ${RED}✗${NC} ($FILE_COUNT files)"
  ((FAIL_COUNT++))
  echo "FAIL: File count is $FILE_COUNT (expected 50+)" >> "$VALIDATION_REPORT"
fi

# Validation 3: Critical files present
echo -ne "${YELLOW}3. Checking critical files...${NC}"
CRITICAL_FILES=(
  "IPS26-CONTRIBUTION-TRACKER.md"
  "IPS26-STRATEGY-PLAYBOOK.md"
  "CLAUDE.md"
  ".claude/agents/IPS26-coordinator.md"
  ".claude/agents/IPS26-writer.md"
  ".claude/agents/IPS26-data-research.md"
  ".claude/agents/IPS26-ops.md"
)

MISSING_FILES=0
for file in "${CRITICAL_FILES[@]}"; do
  if [ ! -f "$TARGET_DIR/$file" ]; then
    MISSING_FILES=$((MISSING_FILES + 1))
    echo "" >> "$VALIDATION_REPORT"
    echo "MISSING: $file" >> "$VALIDATION_REPORT"
  fi
done

if [ $MISSING_FILES -eq 0 ]; then
  echo -e " ${GREEN}✓${NC} (all critical files present)"
  ((PASS_COUNT++))
  echo "PASS: All critical files present" >> "$VALIDATION_REPORT"
else
  echo -e " ${RED}✗${NC} ($MISSING_FILES files missing)"
  ((FAIL_COUNT++))
  echo "FAIL: Missing $MISSING_FILES critical files" >> "$VALIDATION_REPORT"
fi

# Validation 4: No PTC26 references (except historical docs)
echo -ne "${YELLOW}4. Checking for remaining PTC26 references...${NC}"
PTC26_REFS=$(grep -r "PTC26-Dubai" "$TARGET_DIR" --include="*.md" --include="*.txt" --include="*.json" 2>/dev/null | grep -v "HISTORY\|SPLIT-HISTORY\|backup\|LESSONS-LEARNED\|AGENT-ENHANCEMENT" | wc -l)

if [ $PTC26_REFS -eq 0 ]; then
  echo -e " ${GREEN}✓${NC}"
  ((PASS_COUNT++))
  echo "PASS: No PTC26 references found" >> "$VALIDATION_REPORT"
else
  echo -e " ${YELLOW}⚠${NC} ($PTC26_REFS references)"
  echo "WARNING: Found $PTC26_REFS PTC26 references (verify if intentional)" >> "$VALIDATION_REPORT"
  grep -r "PTC26-Dubai" "$TARGET_DIR" --include="*.md" --include="*.txt" --include="*.json" 2>/dev/null | grep -v "HISTORY\|SPLIT-HISTORY\|backup\|LESSONS-LEARNED\|AGENT-ENHANCEMENT" >> "$VALIDATION_REPORT"
fi

# Validation 5: Git initialized
echo -ne "${YELLOW}5. Checking git initialized...${NC}"
if [ -d "$TARGET_DIR/.git" ]; then
  echo -e " ${GREEN}✓${NC}"
  ((PASS_COUNT++))
  echo "PASS: Git repository initialized" >> "$VALIDATION_REPORT"
else
  echo -e " ${YELLOW}⚠${NC} (not yet initialized)"
  echo "WARNING: Git not initialized (will be done in Phase 1)" >> "$VALIDATION_REPORT"
fi

# Validation 6: Asset directories exist
echo -ne "${YELLOW}6. Checking asset directories...${NC}"
ASSET_DIRS=(
  "assets"
  "assets/speaker-recruitment"
  "assets/ips26-organizers"
  "assets/registration"
  "assets/strategic-meetings"
  "operations"
  "manus-tasks"
)

MISSING_DIRS=0
for dir in "${ASSET_DIRS[@]}"; do
  if [ ! -d "$TARGET_DIR/$dir" ]; then
    MISSING_DIRS=$((MISSING_DIRS + 1))
  fi
done

if [ $MISSING_DIRS -eq 0 ]; then
  echo -e " ${GREEN}✓${NC}"
  ((PASS_COUNT++))
  echo "PASS: All asset directories present" >> "$VALIDATION_REPORT"
else
  echo -e " ${YELLOW}⚠${NC} ($MISSING_DIRS missing)"
  echo "WARNING: $MISSING_DIRS directories missing (may be created during setup)" >> "$VALIDATION_REPORT"
fi

# Validation 7: Agent files have IPS26 prefix
echo -ne "${YELLOW}7. Checking agent file naming...${NC}"
AGENT_FILES=(.claude/agents/IPS26-*.md)
if compgen -G "$TARGET_DIR/.claude/agents/IPS26-*.md" > /dev/null; then
  IPS26_AGENT_COUNT=$(find "$TARGET_DIR/.claude/agents" -name "IPS26-*.md" | wc -l)
  echo -e " ${GREEN}✓${NC} ($IPS26_AGENT_COUNT agents with IPS26 prefix)"
  ((PASS_COUNT++))
  echo "PASS: Found $IPS26_AGENT_COUNT IPS26-prefixed agents" >> "$VALIDATION_REPORT"
else
  echo -e " ${RED}✗${NC}"
  ((FAIL_COUNT++))
  echo "FAIL: No IPS26-prefixed agents found" >> "$VALIDATION_REPORT"
fi

# Validation 8: Contribution tracker has correct name
echo -ne "${YELLOW}8. Checking contribution tracker...${NC}"
if grep -q "IPS26" "$TARGET_DIR/IPS26-CONTRIBUTION-TRACKER.md" 2>/dev/null; then
  echo -e " ${GREEN}✓${NC}"
  ((PASS_COUNT++))
  echo "PASS: Contribution tracker is IPS26-specific" >> "$VALIDATION_REPORT"
else
  echo -e " ${YELLOW}⚠${NC}"
  echo "WARNING: Contribution tracker may need IPS26 updates" >> "$VALIDATION_REPORT"
fi

# Validation 9: CLAUDE.md contains IPS26 references
echo -ne "${YELLOW}9. Checking CLAUDE.md...${NC}"
if grep -q "IPS26" "$TARGET_DIR/CLAUDE.md" 2>/dev/null; then
  echo -e " ${GREEN}✓${NC}"
  ((PASS_COUNT++))
  echo "PASS: CLAUDE.md contains IPS26 references" >> "$VALIDATION_REPORT"
else
  echo -e " ${RED}✗${NC}"
  ((FAIL_COUNT++))
  echo "FAIL: CLAUDE.md missing IPS26 references" >> "$VALIDATION_REPORT"
fi

# Validation 10: Markdown link check
echo -ne "${YELLOW}10. Checking markdown links...${NC}"
BROKEN_LINKS=0
for file in $(find "$TARGET_DIR" -name "*.md"); do
  # Simple markdown link check
  while IFS= read -r line; do
    if [[ $line =~ \[.*\]\(([^)]*\.md)\) ]]; then
      link_path="${BASH_REMATCH[1]}"
      if [[ ! $link_path =~ ^http ]] && [[ ! $link_path =~ ^# ]]; then
        file_dir=$(dirname "$file")
        resolved_path="$file_dir/$link_path"
        if [ ! -f "$resolved_path" ]; then
          ((BROKEN_LINKS++))
        fi
      fi
    fi
  done < "$file"
done

if [ $BROKEN_LINKS -eq 0 ]; then
  echo -e " ${GREEN}✓${NC}"
  ((PASS_COUNT++))
  echo "PASS: No broken markdown links" >> "$VALIDATION_REPORT"
else
  echo -e " ${YELLOW}⚠${NC} ($BROKEN_LINKS broken)"
  echo "WARNING: Found $BROKEN_LINKS broken markdown links" >> "$VALIDATION_REPORT"
fi

# Summary
echo ""
echo -e "${BLUE}=== Validation Summary ===${NC}"
echo "Passed: $PASS_COUNT"
echo "Failed: $FAIL_COUNT"
echo ""

{
  echo "" >> "$VALIDATION_REPORT"
  echo "=== SUMMARY ===" >> "$VALIDATION_REPORT"
  echo "Passed: $PASS_COUNT" >> "$VALIDATION_REPORT"
  echo "Failed: $FAIL_COUNT" >> "$VALIDATION_REPORT"
  echo "" >> "$VALIDATION_REPORT"
}

if [ $FAIL_COUNT -eq 0 ]; then
  echo -e "${GREEN}✓ ALL VALIDATIONS PASSED${NC}"
  echo "Split is ready for Phase 5 Testing"
  echo "" >> "$VALIDATION_REPORT"
  echo "Status: SUCCESS - All validations passed" >> "$VALIDATION_REPORT"
  echo "Report saved to: $VALIDATION_REPORT"
  exit 0
else
  echo -e "${RED}✗ SOME VALIDATIONS FAILED${NC}"
  echo "Review failures above and in report"
  echo "" >> "$VALIDATION_REPORT"
  echo "Status: FAILED - Resolve failures before proceeding" >> "$VALIDATION_REPORT"
  echo "Report saved to: $VALIDATION_REPORT"
  exit 1
fi
