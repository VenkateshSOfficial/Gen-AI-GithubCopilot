# ⚡ QUICK REFERENCE CARD - TEST CASE FORMAT
## For Instant Lookup When Generating Files

---

## 🎬 SECTION CHECKLIST (Copy-Paste in Order)

```
1. ✅ Header (Emoji + Status)
2. ✅ Test Case Summary Report (📊 - 10 metrics)
3. ✅ Testing Pyramid Distribution (🏛️ - 4 rows)
4. ✅ Test Case Coverage Analysis (📋 - All ACs)
5. ✅ Validation Checklist Report (✅ - 14 criteria)
6. ✅ Main Test Cases Table (📝 - ALL rows)
7. ✅ Test Distribution by Type (📊 - Unit/Int/E2E)
8. ✅ Test Distribution by Scenario (🎯 - Pos/Neg/Edge)
9. ✅ Test Case Index (📑 - ALL test cases)
10. ✅ Requirement Traceability Matrix (🔗 - AC mapping)
11. ✅ Final Execution Summary (📋 - 9 metrics)
```

---

## 📋 EMOJI MAPPING (EXACT)

| Section | Emoji | Example |
|---------|-------|---------|
| Test Case Summary | 📊 | `## 📊 1. Test Case Summary Report` |
| Testing Pyramid | 🏛️ | `## 🏛️ 2. Testing Pyramid Distribution` |
| Coverage Analysis | 📋 | `## 📋 3. Test Case Coverage Analysis` |
| Validation | ✅ | `## ✅ 4. Validation Checklist Report` |
| Main Test Cases | 📝 | `## 📝 5. Main Test Cases Table` |
| Distribution Type | 📊 | `## 📊 6. Test Distribution by Type` |
| Distribution Scenario | 🎯 | `## 🎯 7. Test Distribution by Scenario Type` |
| Test Index | 📑 | `## 📑 8. Test Case Index / Quick Reference` |
| Traceability | 🔗 | `## 🔗 9. Requirement Traceability Matrix` |
| Execution Summary | 📋 | `## 📋 10. Final Execution Summary` |
| Automation | 🚀 | `## 🚀 Automation Readiness Assessment` |
| Framework Stack | 🛠️ | `## 🛠️ Recommended Test Automation Framework Stack` |
| Test Data | 📝 | `## 📝 Test Data Requirements & Setup` |
| Execution Notes | 💡 | `## 💡 Execution Notes & Environment Requirements` |
| Summary | 📌 | `## 📌 Summary` |

---

## ✅ STATUS EMOJI RULES (ABSOLUTE)

| Emoji | Use Case | Rule |
|-------|----------|------|
| ✅ | PASS, Complete, Yes, Ready, Met | Use ONLY for positive statuses |
| ❌ | FAIL, Not Complete, No | Use only when something is incomplete |
| ⚠️ | PARTIAL, Needs Review | Use for warning/attention items |

**RULE**: Test case tables should show ALL ✅ (never ❌)

---

## 📐 TABLE COLUMN ORDERS (LOCKED)

### Test Case Summary Report
```
| Metric | Value | Status |
```

### Testing Pyramid Distribution
```
| Test Level | Expected % | Actual % | Test Count | Status |
```

### Coverage Analysis
```
| Requirement Area | Test Cases Mapped | Coverage | Details | Status |
```

### Validation Checklist
```
| Criterion | Status | Details |
```

### Main Test Cases Table (CRITICAL)
```
| TC ID | Requirement | Test Title | Type | Preconditions | Test Data | Test Steps (Given-When-Then) | Expected Result | Environment | Priority |
```

### Distribution by Type
```
| Test Type | Count | Percentage | Status |
```

### Distribution by Scenario
```
| Scenario Type | Count | Percentage | Status |
```

### Test Case Index
```
| TC ID | Title | Scenario | Type | Status |
```

### Requirement Traceability
```
| Acceptance Criteria | Test Cases Mapped | Count | Coverage Status |
```

### Final Execution Summary
```
| Metric | Status | Details |
```

---

## 🚫 FORBIDDEN ACTIONS (NEVER DO)

```
❌ Don't create new sections
❌ Don't change section numbers
❌ Don't truncate test cases with "..."
❌ Don't show sample data - show ALL
❌ Don't use ✓ or ✔ - use ✅
❌ Don't use 🟢 or 🟥 - use ✅/❌/⚠️
❌ Don't add personal formatting touches
❌ Don't skip any mandatory sections
❌ Don't mix emoji styles
❌ Don't add variations to headers
```

---

## ✅ MANDATORY ACTIONS (ALWAYS DO)

```
✅ Use this exact format
✅ Include all 10 main sections
✅ Show ALL test cases (no truncation)
✅ Use specified section numbers
✅ Use specified emojis only
✅ End sections with --- divider
✅ Use proper Markdown syntax
✅ Map all tests to requirements
✅ Show 100% coverage
✅ Validate before creating
```

---

## 📝 NAMING CONVENTION (TC IDs)

**Format**: `TC_[CODE]_[NUMBER]`

**Examples**:
- `TC_AAS_001` (Address Auto-Suggestions, Test 001)
- `TC_AAS_052` (Address Auto-Suggestions, Test 052)

**RULES**:
- TC = Always "TC"
- CODE = 2-3 uppercase letters (project code)
- NUMBER = 3-digit zero-padded number (001-999)
- Separator = Underscore (_)

---

## 🎯 HEADER TEMPLATE (Copy & Paste)

```markdown
# 🎉 TEST CASE GENERATION COMPLETE
## [Project Name/Feature Name]

**Source File**: business_requirements.txt  
**Date Generated**: [YYYY-MM-DD]  
**Project Code**: [CODE]  
**Status**: ✅ Ready for QA Execution

---
```

---

## 🎬 SECTION DIVIDER RULE

After every major section, add:
```
---
```

(Three dashes on a single line)

---

## 📊 COMMON VALUES

| Metric | Typical Value |
|--------|---------------|
| Test Distribution | Unit 60-70%, Integration 20-25%, E2E 5-15% |
| Scenario Distribution | Positive 60%+, Negative 25-30%, Edge 5-10% |
| Coverage Target | 100% |
| Validation Criteria | Always 14 items |
| Main Sections | 10 mandatory + optional |

---

## 🔄 WORKFLOW (STEP BY STEP)

1. Read business_requirements.txt
2. Generate test cases by requirement
3. Organize into TC_CODE_### format
4. Create file with exact section order
5. Verify header format
6. Fill in Section 1 (Summary)
7. Fill in Section 2 (Pyramid)
8. Fill in Section 3 (Coverage)
9. Fill in Section 4 (Validation)
10. Fill in Section 5 (Test Cases - ALL of them)
11. Fill in Section 6 (Distribution Type)
12. Fill in Section 7 (Distribution Scenario)
13. Fill in Section 8 (Test Index)
14. Fill in Section 9 (Traceability)
15. Fill in Section 10 (Summary)
16. Add optional sections if needed
17. Validate entire file
18. Save as `test_case_deliverables.md`

---

## ✨ FINAL VERIFICATION BEFORE SAVE

- ✅ All 10 main sections present?
- ✅ Section numbers 1-10 in order?
- ✅ Correct emojis on all headers?
- ✅ --- dividers between sections?
- ✅ ALL test cases visible (no truncation)?
- ✅ ✅ emoji status on all relevant rows?
- ✅ 100% coverage shown?
- ✅ All requirements mapped?
- ✅ Test names in Given-When-Then format?
- ✅ Proper Markdown table syntax?

---

## 📌 KEY REMINDERS

1. **This is the GOLDEN STANDARD** - Use exactly as shown
2. **No variations** - Be consistent every time
3. **No hallucination** - Don't experiment with formats
4. **All data visible** - Never truncate test cases
5. **Emoji consistency** - Use only ✅/❌/⚠️
6. **100% coverage** - Always show complete mapping
7. **Professional format** - Keep it clean and organized
8. **Copy-paste ready** - Make it Excel/JIRA friendly

---

**Last Updated**: January 8, 2026  
**Status**: ✅ LOCKED - Follow exactly as written

