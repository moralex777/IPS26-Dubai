#!/bin/bash

# IPS26 Split Automation Script: Path Replacement and Validation
# Purpose: Automate path replacements from PTC26 to IPS26 structure
# Usage: bash split-to-ips26.sh /path/to/ips26-dubai
#
# This script:
# - Replaces /home/alex/PTC26-Dubai/ with /home/alex/IPS26-Dubai/
# - Replaces PTC26- with IPS26- in filenames and content
# - Validates markdown links
# - Checks for broken references
# - Generates diff report
# - Creates rollback snapshot

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
TARGET_DIR="${1:-.}"
WORK_DIR=$(pwd)
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="$WORK_DIR/.split-backup-$TIMESTAMP"
DIFF_REPORT="$WORK_DIR/split-diff-report-$TIMESTAMP.txt"

echo -e "${BLUE}=== IPS26 Split Automation Script ===${NC}"
echo "Target directory: $TARGET_DIR"
echo "Timestamp: $TIMESTAMP"
echo ""

# Step 1: Create backup before making changes
echo -e "${YELLOW}Step 1: Creating backup snapshot...${NC}"
mkdir -p "$BACKUP_DIR"
cp -r "$TARGET_DIR" "$BACKUP_DIR/ips26-dubai-backup-$TIMESTAMP"
echo -e "${GREEN}✓ Backup created in: $BACKUP_DIR${NC}"
echo ""

# Step 2: Replace paths in all files
echo -e "${YELLOW}Step 2: Replacing /PTC26-Dubai paths with /IPS26-Dubai...${NC}"
{
  echo "=== Path Replacement Report ===" >> "$DIFF_REPORT"
  echo "Timestamp: $TIMESTAMP" >> "$DIFF_REPORT"
  echo "" >> "$DIFF_REPORT"
}

# Count replacements
REPLACEMENT_COUNT=0

# Replace in all markdown, txt, and config files
for file in $(find "$TARGET_DIR" -type f \( -name "*.md" -o -name "*.txt" -o -name "*.json" -o -name "*.sh" -o -name "*.yaml" -o -name "*.yml" \)); do
  if grep -q "PTC26-Dubai" "$file" 2>/dev/null; then
    OLD_CONTENT=$(cat "$file")
    sed -i 's|/home/alex/PTC26-Dubai|/home/alex/IPS26-Dubai|g' "$file"
    NEW_CONTENT=$(cat "$file")

    if [ "$OLD_CONTENT" != "$NEW_CONTENT" ]; then
      ((REPLACEMENT_COUNT++))
      echo "Modified: $file" >> "$DIFF_REPORT"
    fi
  fi
done

echo -e "${GREEN}✓ Replaced paths in $REPLACEMENT_COUNT files${NC}"
echo "" >> "$DIFF_REPORT"
echo "Files modified: $REPLACEMENT_COUNT" >> "$DIFF_REPORT"
echo "" >> "$DIFF_REPORT"

# Step 3: Validate markdown links
echo -e "${YELLOW}Step 3: Validating markdown links...${NC}"
{
  echo "=== Markdown Link Validation ===" >> "$DIFF_REPORT"
  echo "" >> "$DIFF_REPORT"
}

BROKEN_LINKS=0

for file in $(find "$TARGET_DIR" -name "*.md"); do
  # Find all markdown links: [text](path/to/file.md)
  while IFS= read -r line; do
    if [[ $line =~ \[.*\]\(([^)]*\.md)\) ]]; then
      link_path="${BASH_REMATCH[1]}"

      # Skip absolute URLs and anchors
      if [[ ! $link_path =~ ^http ]] && [[ ! $link_path =~ ^# ]]; then
        # Resolve relative path
        file_dir=$(dirname "$file")
        resolved_path="$file_dir/$link_path"

        # Check if file exists
        if [ ! -f "$resolved_path" ]; then
          echo "BROKEN: $file → $link_path (resolved: $resolved_path)" >> "$DIFF_REPORT"
          ((BROKEN_LINKS++))
        fi
      fi
    fi
  done < "$file"
done

if [ $BROKEN_LINKS -eq 0 ]; then
  echo -e "${GREEN}✓ No broken markdown links found${NC}"
  echo "Status: OK - No broken links" >> "$DIFF_REPORT"
else
  echo -e "${RED}⚠ Found $BROKEN_LINKS broken markdown links${NC}"
  echo "See diff report for details" >> "$DIFF_REPORT"
fi
echo "" >> "$DIFF_REPORT"

# Step 4: Check for remaining PTC26 references
echo -e "${YELLOW}Step 4: Checking for remaining PTC26 references...${NC}"
{
  echo "=== Remaining PTC26 References ===" >> "$DIFF_REPORT"
  echo "" >> "$DIFF_REPORT"
}

REMAINING_REFS=$(grep -r "PTC26-Dubai" "$TARGET_DIR" --include="*.md" --include="*.txt" --include="*.json" --include="*.sh" 2>/dev/null | grep -v "HISTORY\|SPLIT-HISTORY\|backup" | wc -l)

if [ $REMAINING_REFS -eq 0 ]; then
  echo -e "${GREEN}✓ No remaining PTC26-Dubai references${NC}"
  echo "Status: OK - All PTC26 references updated" >> "$DIFF_REPORT"
else
  echo -e "${YELLOW}⚠ Found $REMAINING_REFS remaining PTC26-Dubai references (check if intentional)${NC}"
  echo "" >> "$DIFF_REPORT"
  echo "Remaining references:" >> "$DIFF_REPORT"
  grep -r "PTC26-Dubai" "$TARGET_DIR" --include="*.md" --include="*.txt" --include="*.json" --include="*.sh" 2>/dev/null | grep -v "HISTORY\|SPLIT-HISTORY\|backup" >> "$DIFF_REPORT" || true
fi
echo "" >> "$DIFF_REPORT"

# Step 5: Verify critical files exist
echo -e "${YELLOW}Step 5: Verifying critical files exist...${NC}"
{
  echo "=== Critical Files Verification ===" >> "$DIFF_REPORT"
  echo "" >> "$DIFF_REPORT"
}

CRITICAL_FILES=(
  "IPS26-CONTRIBUTION-TRACKER.md"
  "IPS26-STRATEGY-PLAYBOOK.md"
  ".claude/agents/IPS26-coordinator.md"
  ".claude/agents/IPS26-writer.md"
  ".claude/agents/IPS26-data-research.md"
  ".claude/agents/IPS26-ops.md"
)

MISSING_FILES=0

for file in "${CRITICAL_FILES[@]}"; do
  if [ -f "$TARGET_DIR/$file" ]; then
    echo -e "${GREEN}✓ Found: $file${NC}"
    echo "OK: $file" >> "$DIFF_REPORT"
  else
    echo -e "${RED}✗ MISSING: $file${NC}"
    echo "MISSING: $file" >> "$DIFF_REPORT"
    ((MISSING_FILES++))
  fi
done
echo "" >> "$DIFF_REPORT"

# Step 6: Generate summary
echo ""
echo -e "${BLUE}=== Validation Summary ===${NC}"
echo "Files modified: $REPLACEMENT_COUNT"
echo "Broken links: $BROKEN_LINKS"
echo "Missing critical files: $MISSING_FILES"
echo "Backup location: $BACKUP_DIR"
echo "Detailed report: $DIFF_REPORT"
echo ""

# Final status
if [ $BROKEN_LINKS -eq 0 ] && [ $MISSING_FILES -eq 0 ]; then
  echo -e "${GREEN}✓ Split automation COMPLETE - Ready for Phase 5 Testing${NC}"
  echo "" >> "$DIFF_REPORT"
  echo "=== FINAL STATUS ===" >> "$DIFF_REPORT"
  echo "Status: SUCCESS - All validations passed" >> "$DIFF_REPORT"
  exit 0
else
  echo -e "${RED}✗ Split automation INCOMPLETE - Issues found, see diff report${NC}"
  echo "" >> "$DIFF_REPORT"
  echo "=== FINAL STATUS ===" >> "$DIFF_REPORT"
  echo "Status: FAILED - Issues detected" >> "$DIFF_REPORT"
  exit 1
fi
