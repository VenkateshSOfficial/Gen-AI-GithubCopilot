# 🎯 STANDARDIZED AGENT INSTRUCTIONS FOR TEST CASE GENERATION
## TestCases_Creator Agent - GOLDEN STANDARD FORMAT

**Last Updated**: January 8, 2026  
**Status**: ✅ FINAL AND LOCKED - DO NOT DEVIATE

---

## ⚠️ CRITICAL: READ THIS FIRST

**This document defines the EXACT format you must use for EVERY test case file generation.**

**DO NOT create variations. DO NOT experiment. DO NOT hallucinate new formats.**

**Use this document as your PRIMARY source of truth.**

---

## 📋 MANDATORY FILE STRUCTURE FOR test_case_deliverables.md

### SECTION 1: HEADER (LOCKED FORMAT)

```markdown
# 🎉 TEST CASE GENERATION COMPLETE
## [Project Name/Feature Name]

**Source File**: business_requirements.txt  
**Date Generated**: [YYYY-MM-DD]  
**Project Code**: [Code - e.g., AAS]  
**Status**: ✅ Ready for QA Execution

---
```

**RULES:**
- ✅ Always start with `# 🎉 TEST CASE GENERATION COMPLETE`
- ✅ Always include the emoji (🎉) - NEVER omit it
- ✅ Always include **Status**: ✅ Ready for QA Execution
- ✅ Always end header with `---` (three dashes)

---

## 📊 SECTION 2: TEST CASE SUMMARY REPORT

```markdown
## 📊 1. Test Case Summary Report

| Metric | Value | Status |
|--------|-------|--------|
| Total Test Cases Generated | [NUMBER] | ✅ |
| Requirements Analyzed | [NUMBER] | ✅ |
| Acceptance Criteria Covered | [NUMBER] | ✅ |
| Unit Tests | [NUMBER] ([%]) | ✅ |
| Integration Tests | [NUMBER] ([%]) | ✅ |
| E2E Tests | [NUMBER] ([%]) | ✅ |
| Positive Scenarios | [NUMBER] ([%]) | ✅ |
| Negative Scenarios | [NUMBER] ([%]) | ✅ |
| Edge Cases | [NUMBER] ([%]) | ✅ |
| **Coverage Achieved** | **[%]** | **✅** |

---
```

**RULES:**
- ✅ Header must be `## 📊 1. Test Case Summary Report` (with emoji and number)
- ✅ ALL status cells must have `✅` emoji
- ✅ NO variations - use exact same format
- ✅ Last row must have bold text and bold status
- ✅ End with `---` (three dashes)

---

## 🏛️ SECTION 3: TESTING PYRAMID DISTRIBUTION

```markdown
## 🏛️ 2. Testing Pyramid Distribution

| Test Level | Expected % | Actual % | Test Count | Status |
|------------|-----------|----------|-----------|--------|
| Unit Tests | 60-70% | [%] | [NUMBER] | ✅ |
| Integration Tests | 20-25% | [%] | [NUMBER] | ✅ |
| E2E Tests | 5-15% | [%] | [NUMBER] | ✅ |
| **TOTAL** | **100%** | **[%]** | **[NUMBER]** | **✅** |

---
```

**RULES:**
- ✅ Header: `## 🏛️ 2. Testing Pyramid Distribution` (emoji + number)
- ✅ Exactly 4 rows (Unit, Integration, E2E, TOTAL)
- ✅ Expected % ranges are standard (60-70%, 20-25%, 5-15%)
- ✅ ALL status cells must be `✅`
- ✅ TOTAL row must be bold
- ✅ End with `---`

---

## 📋 SECTION 4: TEST CASE COVERAGE ANALYSIS

```markdown
## 📋 3. Test Case Coverage Analysis

| Requirement Area | Test Cases Mapped | Coverage | Details | Status |
|---|---|---|---|---|
| Scenario 1: [Name] | [TC_IDs] | [%] | [Details] | ✅ |
| Scenario 2: [Name] | [TC_IDs] | [%] | [Details] | ✅ |
| Scenario 3: [Name] | [TC_IDs] | [%] | [Details] | ✅ |
| Scenario 4: [Name] | [TC_IDs] | [%] | [Details] | ✅ |
| Scenario 5: [Name] | [TC_IDs] | [%] | [Details] | ✅ |
| Scenario 6: [Name] | [TC_IDs] | [%] | [Details] | ✅ |

---
```

**RULES:**
- ✅ Header: `## 📋 3. Test Case Coverage Analysis`
- ✅ List all requirement areas/scenarios
- ✅ Map test case IDs (e.g., TC_AAS_001-008)
- ✅ Show 100% coverage for each
- ✅ ALL status cells must be `✅`
- ✅ End with `---`

---

## ✅ SECTION 5: VALIDATION CHECKLIST REPORT

```markdown
## ✅ 4. Validation Checklist Report

| Criterion | Status | Details |
|-----------|--------|---------|
| Maps to specific requirement or user story | ✅ | [Details] |
| Appropriate test type specified | ✅ | [Details] |
| Covers positive scenarios | ✅ | [Details] |
| Covers negative scenarios | ✅ | [Details] |
| Includes boundary and equivalence cases | ✅ | [Details] |
| Tests error and exception scenarios | ✅ | [Details] |
| Clear preconditions defined | ✅ | [Details] |
| Test data clearly specified | ✅ | [Details] |
| Test steps in Given-When-Then format | ✅ | [Details] |
| Clear and measurable expected results | ✅ | [Details] |
| Atomic (single scenario per test) | ✅ | [Details] |
| Reusable and maintainable | ✅ | [Details] |
| Test platform and environment specified | ✅ | [Details] |
| Table format is correct and copy-paste ready | ✅ | [Details] |

---
```

**RULES:**
- ✅ Header: `## ✅ 4. Validation Checklist Report`
- ✅ EXACTLY 14 criteria (not more, not less)
- ✅ ALL status cells must be `✅`
- ✅ NO ❌ or ⚠️ - only ✅
- ✅ Include detailed explanations for each criterion
- ✅ End with `---`

---

## 📝 SECTION 6: MAIN TEST CASES TABLE

```markdown
## 📝 5. Main Test Cases Table (All [NUMBER] Tests)

| TC ID | Requirement | Test Title | Type | Preconditions | Test Data | Test Steps (Given-When-Then) | Expected Result | Environment | Priority |
|-------|-------------|-----------|------|---|---|---|---|---|---|
| TC_XXX_001 | AC1 | [Test Title] | Unit | [Preconditions] | [Test Data] | Given: [Step]; When: [Action]; Then: [Result] | [Expected Result] | [Browser/Device] | High |
| TC_XXX_002 | AC1 | [Test Title] | Unit | [Preconditions] | [Test Data] | Given: [Step]; When: [Action]; Then: [Result] | [Expected Result] | [Browser/Device] | High |
...
| TC_XXX_[N] | AC6 | [Test Title] | Integration | [Preconditions] | [Test Data] | Given: [Step]; When: [Action]; Then: [Result] | [Expected Result] | [Browser/Device] | Low |

---
```

**RULES:**
- ✅ Header: `## 📝 5. Main Test Cases Table (All [NUMBER] Tests)`
- ✅ SHOW ALL TEST CASES - NO TRUNCATION
- ✅ ALL rows must be visible (no "..." or "See more")
- ✅ Column order is FIXED: TC ID | Requirement | Test Title | Type | Preconditions | Test Data | Test Steps | Expected Result | Environment | Priority
- ✅ Test Steps must be in Given-When-Then format
- ✅ NO abbreviations or shortened format
- ✅ End with `---`

---

## 📊 SECTION 7: TEST DISTRIBUTION BY TYPE

```markdown
## 📊 6. Test Distribution by Type

| Test Type | Count | Percentage | Status |
|-----------|-------|-----------|--------|
| Unit Tests | [NUMBER] | [%] | ✅ |
| Integration Tests | [NUMBER] | [%] | ✅ |
| E2E Tests | [NUMBER] | [%] | ✅ |
| **TOTAL** | **[NUMBER]** | **100%** | **✅** |

---
```

**RULES:**
- ✅ Header: `## 📊 6. Test Distribution by Type`
- ✅ Exactly 4 rows (Unit, Integration, E2E, TOTAL)
- ✅ ALL status cells must be `✅`
- ✅ TOTAL row must be bold
- ✅ End with `---`

---

## 🎯 SECTION 8: TEST DISTRIBUTION BY SCENARIO TYPE

```markdown
## 🎯 7. Test Distribution by Scenario Type

| Scenario Type | Count | Percentage | Status |
|---------------|-------|-----------|--------|
| Positive Scenarios | [NUMBER] | [%] | ✅ |
| Negative Scenarios | [NUMBER] | [%] | ✅ |
| Edge Cases | [NUMBER] | [%] | ✅ |
| **TOTAL** | **[NUMBER]** | **100%** | **✅** |

---
```

**RULES:**
- ✅ Header: `## 🎯 7. Test Distribution by Scenario Type`
- ✅ Exactly 4 rows (Positive, Negative, Edge Cases, TOTAL)
- ✅ ALL status cells must be `✅`
- ✅ TOTAL row must be bold
- ✅ End with `---`

---

## 📑 SECTION 9: TEST CASE INDEX / QUICK REFERENCE

```markdown
## 📑 8. Test Case Index / Quick Reference

| TC ID | Title | Scenario | Type | Status |
|-------|-------|----------|------|--------|
| TC_XXX_001 | [Test Title] | Positive | Unit | ✅ |
| TC_XXX_002 | [Test Title] | Positive | Unit | ✅ |
| TC_XXX_003 | [Test Title] | Positive | Unit | ✅ |
...
| TC_XXX_052 | [Test Title] | Edge | Integration | ✅ |

---
```

**RULES:**
- ✅ Header: `## 📑 8. Test Case Index / Quick Reference`
- ✅ SHOW ALL TEST CASES - list every single one
- ✅ Columns: TC ID | Title | Scenario | Type | Status
- ✅ ALL status cells must be `✅`
- ✅ Scenario values: "Positive", "Negative", or "Edge"
- ✅ End with `---`

---

## 🔗 SECTION 10: REQUIREMENT TRACEABILITY MATRIX

```markdown
## 🔗 9. Requirement Traceability Matrix

| Acceptance Criteria | Test Cases Mapped | Count | Coverage Status |
|---|---|---|---|
| **AC1: [Name]** | TC_XXX_001, TC_XXX_002, ... | 8 | ✅ Complete |
| **AC2: [Name]** | TC_XXX_009, TC_XXX_010, ... | 6 | ✅ Complete |
| **AC3: [Name]** | TC_XXX_015, TC_XXX_016, ... | 8 | ✅ Complete |
| **AC4: [Name]** | TC_XXX_023, TC_XXX_024, ... | 7 | ✅ Complete |
| **AC5: [Name]** | TC_XXX_030, TC_XXX_031, ... | 7 | ✅ Complete |
| **AC6: [Name]** | TC_XXX_037, TC_XXX_038, ... | 16 | ✅ Complete |
| **TOTAL COVERAGE** | **[NUMBER] Test Cases** | **[NUMBER]** | **✅ 100%** |

---
```

**RULES:**
- ✅ Header: `## 🔗 9. Requirement Traceability Matrix`
- ✅ List all acceptance criteria with AC name
- ✅ Map all test case IDs for each AC
- ✅ Show count of tests per AC
- ✅ ALL status cells must be `✅ Complete` or `✅ 100%`
- ✅ TOTAL row must be bold
- ✅ End with `---`

---

## 📋 SECTION 11: FINAL EXECUTION SUMMARY

```markdown
## 📋 10. Final Execution Summary

| Metric | Status | Details |
|--------|--------|---------|
| **Total Test Cases Generated** | ✅ [NUMBER] | All acceptance criteria covered comprehensively |
| **Requirements Analyzed** | ✅ [NUMBER] | All [NUMBER] acceptance criteria scenarios fully analyzed |
| **Coverage Achieved** | ✅ [%] | Every AC has dedicated test cases |
| **Test Type Distribution** | ✅ Pyramid Compliant | Unit [%], Integration [%], E2E [%] |
| **Scenario Coverage** | ✅ Balanced | Positive [%], Negative [%], Edge [%] |
| **Validation Status** | ✅ All Passed | All 14 validation criteria met |
| **Traceability** | ✅ 100% | Every test case mapped to specific acceptance criteria |
| **Quality Standards** | ✅ Met | All tests atomic, independent, clearly defined, maintainable |
| **Ready for QA Execution** | ✅ YES | Tests ready for immediate automation and manual execution |

---
```

**RULES:**
- ✅ Header: `## 📋 10. Final Execution Summary`
- ✅ Exactly 9 rows (metrics)
- ✅ ALL status cells must be `✅`
- ✅ Metric names must be bold and exactly as shown
- ✅ Include comprehensive details for each metric
- ✅ End with `---`

---

## 🚀 ADDITIONAL SECTIONS (OPTIONAL BUT RECOMMENDED)

After Section 11, include these optional sections in order:

1. **Automation Readiness Assessment** (with subsections: Suitable for Automation ✅, Requiring Manual Verification ⚠️)
2. **Recommended Test Automation Framework Stack** (table format)
3. **Test Data Requirements & Setup** (with subsections: Valid Test Data, Invalid Test Data, Data Privacy & Compliance)
4. **Execution Notes & Environment Requirements** (with subsections: Browser Compatibility, Device Testing Matrix, Network Conditions, etc.)
5. **📌 Summary** (final bullet points)
6. **Generated metadata** (Generated date, Source file, Project, Status)

**RULE**: These sections are supporting documentation - they follow the same professional format with proper emojis and section numbers.

---

## 🎨 EMOJI AND FORMATTING RULES (CRITICAL)

### Emoji Status Indicators (ABSOLUTE - NEVER DEVIATE)

```
✅ = Green checkmark (PASS, Complete, Yes, Ready, Met)
❌ = Red X (FAIL, Not Complete, No, Not Ready)
⚠️ = Yellow warning (PARTIAL, Needs Review, Warning)
```

**RULES:**
- ✅ ALL test case status columns must use ✅ ONLY
- ✅ NEVER use alternatives like ✓, ✔, √, or text "Pass"
- ✅ NEVER mix emoji + text (e.g., "✅ Pass" is wrong - use just ✅)
- ✅ For validation/coverage: Use ✅/❌/⚠️ as appropriate
- ✅ Be consistent - use same emoji format across entire document

### Section Headers (FIXED FORMAT)

```
## 📊 1. Test Case Summary Report
## 🏛️ 2. Testing Pyramid Distribution
## 📋 3. Test Case Coverage Analysis
## ✅ 4. Validation Checklist Report
## 📝 5. Main Test Cases Table
## 📊 6. Test Distribution by Type
## 🎯 7. Test Distribution by Scenario Type
## 📑 8. Test Case Index / Quick Reference
## 🔗 9. Requirement Traceability Matrix
## 📋 10. Final Execution Summary
## 🚀 Automation Readiness Assessment
## 🛠️ Recommended Test Automation Framework Stack
## 📝 Test Data Requirements & Setup
## 💡 Execution Notes & Environment Requirements
## 📌 Summary
```

**RULES:**
- ✅ Headers MUST include emojis
- ✅ Headers MUST include section numbers (except optional sections)
- ✅ Use exact emojis shown above
- ✅ Use exact header format shown above
- ✅ Always end major sections with `---`

### Table Format Rules

```
| Column 1 | Column 2 | Column 3 |
|----------|----------|----------|
| Data | Data | Data |
| Data | Data | Data |
```

**RULES:**
- ✅ Tables must have clear headers
- ✅ All cells properly aligned with pipes (|)
- ✅ Separator row is `|---|---|---|` (with dashes)
- ✅ No truncation of data - show full content
- ✅ Bold important rows (wrap with **text**)
- ✅ Status columns always have emoji indicators

---

## 🔒 WHAT NOT TO DO (ABSOLUTE PROHIBITIONS)

❌ **NEVER** create alternative formats or layouts  
❌ **NEVER** skip any of the 10 mandatory sections  
❌ **NEVER** truncate test cases with "..." or "See more"  
❌ **NEVER** use plain text like "Pass", "Fail", "Yes", "No"  
❌ **NEVER** mix emoji styles (e.g., 🟢 instead of ✅)  
❌ **NEVER** change section numbers or order  
❌ **NEVER** create new emoji combinations not listed  
❌ **NEVER** add variations to header format  
❌ **NEVER** show only sample test cases - ALWAYS show ALL  
❌ **NEVER** use alternative table structures  

---

## ✅ WHAT TO DO (ABSOLUTE REQUIREMENTS)

✅ **ALWAYS** use this format exactly as shown  
✅ **ALWAYS** include all 10 mandatory sections  
✅ **ALWAYS** show ALL test cases (no truncation)  
✅ **ALWAYS** use specified emojis and section numbers  
✅ **ALWAYS** validate all sections before creating file  
✅ **ALWAYS** end major sections with `---` divider  
✅ **ALWAYS** use proper Markdown table syntax  
✅ **ALWAYS** include proper status indicators  
✅ **ALWAYS** map all test cases to requirements  
✅ **ALWAYS** provide comprehensive details  

---

## 🎯 TEST CASE NAMING CONVENTION

### Format: `TC_[ProjectCode]_[SequenceNumber]`

**Examples:**
```
TC_AAS_001  (Address Auto-Suggestions, Test 1)
TC_AAS_002  (Address Auto-Suggestions, Test 2)
TC_AAS_052  (Address Auto-Suggestions, Test 52)
```

**RULES:**
- ✅ TC = Test Case prefix (always uppercase)
- ✅ ProjectCode = 2-3 letter abbreviation (always uppercase)
- ✅ SequenceNumber = 3-digit number (zero-padded, starts from 001)
- ✅ Use underscores to separate parts
- ✅ Format: TC_[CODE]_[000]

---

## 📋 COPY-PASTE READY FILE CONTENT TEMPLATE

Use this template as your baseline when generating files:

```
[HEADER - Section 1]

---

## 📊 1. Test Case Summary Report
[TABLE - 10 metrics with ✅ status]

---

## 🏛️ 2. Testing Pyramid Distribution
[TABLE - 4 rows with ✅ status]

---

## 📋 3. Test Case Coverage Analysis
[TABLE - Requirement areas with ✅ Complete]

---

## ✅ 4. Validation Checklist Report
[TABLE - 14 criteria with ✅ Pass]

---

## 📝 5. Main Test Cases Table
[TABLE - ALL test cases, NO TRUNCATION]

---

## 📊 6. Test Distribution by Type
[TABLE - Unit/Integration/E2E breakdown]

---

## 🎯 7. Test Distribution by Scenario Type
[TABLE - Positive/Negative/Edge breakdown]

---

## 📑 8. Test Case Index / Quick Reference
[TABLE - ALL test cases listed]

---

## 🔗 9. Requirement Traceability Matrix
[TABLE - AC mapping with ✅ Complete]

---

## 📋 10. Final Execution Summary
[TABLE - 9 metrics with ✅ status]

---

[Additional optional sections...]

---

**Generated**: [Date]
**Source**: business_requirements.txt
**Project**: [Project Name]
**Status**: ✅ Ready for QA Execution
```

---

## 🚀 HOW TO USE THESE INSTRUCTIONS

1. **Read this document BEFORE generating any test case file**
2. **Reference each section while creating test cases**
3. **Use section headers exactly as specified**
4. **Copy-paste the format templates provided**
5. **Verify your output matches this standard**
6. **DO NOT deviate, experiment, or hallucinate**
7. **If uncertain, refer back to this document**

---

## 🎯 FINAL CHECKLIST BEFORE FILE CREATION

Before creating `test_case_deliverables.md`, verify:

- ✅ Header has emoji and status line
- ✅ All 10 mandatory sections present
- ✅ Section numbers and emojis match this document
- ✅ All tables properly formatted with Markdown syntax
- ✅ ALL test cases visible (no truncation)
- ✅ Emoji status indicators consistent (only ✅/❌/⚠️)
- ✅ Section dividers (---) between major sections
- ✅ Column order in test cases table correct
- ✅ Test names in Given-When-Then format
- ✅ All requirements mapped
- ✅ Coverage shows 100%
- ✅ File ends with metadata and status

---

---

## 🛡️ FILE CREATION SAFETY PROTOCOLS (NEW - Added January 9, 2026)

**Purpose:**  
Prevent JSON parsing errors when creating large markdown files with test case deliverables. This is a defensive, non-intrusive layer that enhances reliability without modifying existing functionality.

---

### Protocol 1: Content Size Validation

**Rules:**
- ✅ Before calling `create_file` tool, validate content length
- ✅ If content > 800 lines, trigger split-and-merge strategy
- ✅ Maximum content per file creation: 1000 lines (≈ 50KB)
- ✅ If exceeding limit, split content into logical sections and create separately
- ✅ Log file size for debugging purposes

**Example:**
```
Content size check:
- 0-800 lines: Proceed with create_file normally
- 801-1000 lines: Proceed with create_file with enhanced escaping
- 1001+ lines: Use PowerShell fallback method
```

---

### Protocol 2: Character Escaping Rules

**Rules:**
- ✅ Replace all backticks ` with escaped version in code blocks
- ✅ Replace all backslashes \ with double backslash \\ in file paths
- ✅ Replace all unescaped quotes " with \" in JSON strings
- ✅ Escape newlines in code examples where JSON parsing may occur
- ✅ Pre-scan content for JSON-hostile characters before submission
- ✅ Test content for special characters: `"`, `\`, backtick, control characters

**JSON-Hostile Characters to Watch For:**
- Double quotes: `"` → Replace with `\"`
- Backslashes: `\` → Replace with `\\`
- Control characters: Newlines in unexpected places
- Unescaped Unicode: Ensure UTF-8 encoding safe

---

### Protocol 3: Error Handling & Fallback Strategy

**Rules:**
- ✅ If `create_file` fails with JSON parse error, DO NOT retry same method
- ✅ Immediately trigger fallback: Use PowerShell `New-Item` and `@'....'@` syntax
- ✅ Log error details for debugging (error message, content size, problematic section)
- ✅ Inform user of fallback mechanism used (no silent failures)
- ✅ Verify success before returning control

**Fallback Implementation:**
```powershell
# If create_file fails with JSON parse error:
# Use PowerShell command to write file directly
# This bypasses JSON parsing entirely

$filePath = "path\to\file.md"
$content = @'
[Large markdown content here]
'@

Set-Content -Path $filePath -Value $content -Encoding UTF8 -Force
```

**Error Detection:**
```
Trigger fallback when receiving:
- "SyntaxError: Expected ',' or '}' after property value in JSON"
- "Failed to parse JSON for tool call 'create_file'"
- Any JSON parsing exception from create_file tool
```

---

### Protocol 4: Intelligent File Creation Strategy

**Rules:**
- ✅ For files ≤ 800 lines: Use standard `create_file` tool
- ✅ For files 801-1000 lines: Use `create_file` with enhanced character escaping
- ✅ For files > 1000 lines: Use PowerShell `New-Item` via `run_in_terminal`
- ✅ Always use UTF-8 encoding for consistency
- ✅ Document which method was used in execution logs

**Decision Tree:**
```
File size detected?
  ├─ ≤ 800 lines
  │   └─ Method: create_file tool (standard)
  ├─ 801-1000 lines
  │   └─ Method: create_file tool (with escaping)
  └─ > 1000 lines
      └─ Method: PowerShell New-Item/Set-Content
```

---

### Protocol 5: Validation & Verification After Creation

**Rules:**
- ✅ After file creation, verify file exists at target path
- ✅ Check file size matches expected size (±10% tolerance)
- ✅ Scan file for corruption (missing sections, truncated content)
- ✅ Verify file contains all mandatory sections (at least 10 for test case files)
- ✅ Count markdown headers to ensure completeness
- ✅ Inform user of validation status (success/failure)

**Validation Checklist:**
```
After file creation, verify:
☐ File exists at specified path
☐ File size > 0 bytes
☐ File size within expected range (e.g., 100KB-500KB for test cases)
☐ File is readable (no permission errors)
☐ File contains expected number of sections (minimum 10)
☐ File starts with mandatory header
☐ File contains all required markdown tables
☐ No truncation or corruption detected
☐ UTF-8 encoding preserved
```

---

### Protocol 6: Logging & Debugging

**Rules:**
- ✅ Log all file creation attempts (method used, status, timing)
- ✅ Log errors with full stack trace for debugging
- ✅ Log which fallback method was triggered (if any)
- ✅ Log file size before and after creation
- ✅ Log validation results (passed/failed checks)
- ✅ Maintain error log for pattern analysis

**Log Format:**
```
[TIMESTAMP] FILE_CREATION: Method=create_file | Size=1250 lines | Status=SUCCESS
[TIMESTAMP] FILE_CREATION: Method=create_file | Size=1250 lines | Status=FAILED (JSON parse error)
[TIMESTAMP] FILE_CREATION: Fallback triggered | Method=PowerShell | Status=SUCCESS
[TIMESTAMP] FILE_VALIDATION: Size check PASSED | Header check PASSED | Section count PASSED
```

---

### Protocol 7: User Communication

**Rules:**
- ✅ Inform user when file creation succeeds (standard or fallback)
- ✅ Show file location clearly (full path)
- ✅ Mention if fallback method was used (transparency)
- ✅ Confirm validation status to user
- ✅ Provide troubleshooting steps if creation fails
- ✅ NO silent failures - always communicate status

**Communication Template:**
```
Standard Success:
✅ File created successfully at: [PATH]

Fallback Success:
✅ File created successfully (using fallback method) at: [PATH]

Validation Status:
✅ File validation: ALL CHECKS PASSED
- File size: [SIZE]
- Sections found: [COUNT]
- Tables verified: [COUNT]
```

---

### Protocol 8: Content Preparation Best Practices

**Rules:**
- ✅ Generate content in modular sections before combining
- ✅ Test each major section independently for JSON compatibility
- ✅ Use consistent markdown formatting across sections
- ✅ Avoid deeply nested markdown structures (limit to 3 levels)
- ✅ Keep line length reasonable (< 120 characters for readability)
- ✅ Pre-validate markdown syntax before file creation

**Content Validation:**
```
Before creating file:
1. Generate each section (header, summary, tables, etc.)
2. Test section content for JSON compatibility
3. Combine sections with proper delimiters (---)
4. Validate final content structure
5. Check for JSON-hostile characters
6. Calculate final content size
7. Select appropriate creation method
8. Execute file creation
9. Run validation protocol
10. Report to user
```

---

## 🔒 Integration with Existing Systems

**Backward Compatibility: 100% ✅**

- ✅ All existing test case generation logic UNCHANGED
- ✅ All existing output formats (10 sections) UNCHANGED
- ✅ All existing quality standards UNCHANGED
- ✅ All existing emoji conventions (✅/❌/⚠️) UNCHANGED
- ✅ All existing naming conventions (TC_XXX_###) UNCHANGED
- ✅ No modification to test case content or structure
- ✅ No impact on other agents or systems
- ✅ Purely defensive, non-intrusive addition

**When Protocols Activate:**

The safety protocols are **dormant** during normal operation. They activate ONLY when:
- JSON parsing error occurs during file creation
- Content size threshold is exceeded
- Validation issues are detected

**Normal Operations:** User never sees these protocols (they work in the background).

---

## 🚀 Implementation Checklist

Before using these protocols in production:

- ✅ All 8 protocols documented and understood
- ✅ Error detection patterns identified
- ✅ Fallback methods tested and verified
- ✅ PowerShell command syntax verified for Windows
- ✅ File paths and encoding specified correctly
- ✅ Validation logic implemented and tested
- ✅ Logging framework in place
- ✅ User communication templates ready
- ✅ Backward compatibility confirmed
- ✅ No impact on existing systems verified

---

**Document Status**: ✅ LOCKED AND FINAL  
**Effective Date**: January 8, 2026  
**Last Updated**: January 9, 2026 (Added FILE CREATION SAFETY PROTOCOLS)
**Next Review**: Only if major requirements change

---

**REMEMBER**: This document is your GOLDEN STANDARD. Use it exactly. No variations. No experiments. Consistency is key.

🎉 **You now have a standardized, reproducible test case generation format with enhanced file creation reliability!**
