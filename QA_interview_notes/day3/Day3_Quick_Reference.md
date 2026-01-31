# Day 3 – Quick Reference & Interview Guide

## 🎯 Test Case vs. Test Scenario - Quick Decision

### When to Use What?

```
PLANNING PHASE:
├─ Need business-focused summary? → SCENARIO
├─ Communicating with stakeholders? → SCENARIO
├─ Documenting user journeys? → SCENARIO
└─ Scope definition? → SCENARIO

EXECUTION PHASE:
├─ Need step-by-step instructions? → TEST CASE
├─ Automating tests? → TEST CASE
├─ Training new testers? → TEST CASE
├─ Audit trail? → TEST CASE
└─ Tracking results? → TEST CASE

TRACKING PHASE:
├─ Need coverage verification? → RTM
├─ Need requirement mapping? → RTM
├─ Compliance audit? → RTM
└─ Gap analysis? → RTM
```

---

## 📋 Test Case Template (Quick Reference)

```
Test Case ID:       TC-XXX-001
Title:              Clear, action-focused title
Priority:           Critical / High / Medium / Low
Requirement ID:     REQ-XXX
Precondition:       What must be true before starting
Test Data:          Specific values used
Steps:              Numbered, explicit actions
Expected Result:    Clear outcome verification
Post-condition:     State after test
Automated:          Yes / No
```

---

## 🎬 5 Scenarios Created for Registration/Login/Password Reset

| Scenario | Purpose | Coverage | Test Cases |
|----------|---------|----------|-----------|
| **1. Registration & First Login** | Happy path registration | User journey | 2 cases (TC-REG-001, TC-REG-010) |
| **2. Existing User Login** | Login functionality | Happy path + Remember Me | 2 cases (TC-LOGIN-001, TC-LOGIN-008) |
| **3. Password Reset** | Forgotten password flow | Complete reset process | 9 cases (TC-PASS-001 to 009) |
| **4. Error Handling** | Invalid inputs | 4 error cases | 4 cases (TC-REG-002 to 005) |
| **5. Security & Edge Cases** | Brute force, tokens, injection | Security focus | 6 cases |

**Total: 27 test cases from 5 scenarios**

---

## ✅ RTM Summary

```
Requirements Covered:    26/26 (100%) ✅
Test Cases Created:      27
Scenarios:              5
Coverage Gaps:          0 ✅
Orphaned Test Cases:    0 ✅

Breakdown:
├─ Registration Module: 8 requirements → 10 tests
├─ Login Module: 8 requirements → 8 tests
└─ Password Reset Module: 10 requirements → 9 tests
```

---

## 🎓 Interview Answers Ready

### Q: "What's the difference between a test case and test scenario?"

**Your Answer:**
"Test scenarios are high-level business flows describing what to test, while test cases are detailed step-by-step guides showing exactly how to test.

For example, a scenario might be 'User registers with valid credentials and logs in.' From that one scenario, I create multiple test cases: one for valid registration, one for weak password rejection, one for duplicate email, etc. Each test case has specific steps, test data, preconditions, and expected results.

I use scenarios for planning and stakeholder communication. I use test cases for execution and automation. The key difference is level of detail—scenarios are business language, test cases are technical instructions."

---

### Q: "How do you ensure complete test coverage?"

**Your Answer:**
"I use a Requirements Traceability Matrix (RTM) that maps every requirement to specific test cases. For the registration/login feature I designed, I identified 26 requirements and created 27 test cases ensuring 100% coverage with no gaps.

The RTM has:
- Column 1: Each requirement
- Column 2: Test scenario addressing it
- Column 3: Specific test case(s) verifying it
- Result: Visual proof of 100% coverage

Any uncovered requirement is immediately visible. Any test case without a requirement is identified as orphaned. This ensures both completeness and efficiency—we test everything that matters, nothing more."

---

### Q: "Walk me through writing a test case"

**Your Answer:**
"I start by identifying what functionality needs testing. For example, 'User registration with valid credentials.' Then I create the structure:

1. **Header:** Test case ID (TC-REG-001), title, priority (Critical), requirement it traces to (REQ-REG-001)

2. **Preconditions:** What must be true before starting (User is on registration page, page loaded)

3. **Test Data:** Specific values (Email: john@example.com, Password: SecurePass123, both with 8+ chars)

4. **Steps:** Numbered actions (User enters email, user enters password, user clicks Register)

5. **Expected Result:** What should happen (User sees 'Registration successful' message, verification email sent)

6. **Post-condition:** State after test (User account created but not yet verified)

The key is being specific—not 'enter password' but 'enter SecurePass123 with 8 characters and 1 uppercase.' This makes it executable and auditable."

---

## 📊 Your Day 3 Deliverables

### ✅ Deliverable 1: E2E Scenarios (5 Scenarios)
- New User Registration & First Login (Happy path + verification)
- Existing User Login (Including Remember Me)
- Password Reset Flow (Complete process)
- Error Handling (4 error scenarios)
- Security & Edge Cases (Brute force, token expiry, injection)

### ✅ Deliverable 2: Test Cases (27 Cases)
- Registration: 10 test cases
- Login: 8 test cases
- Password Reset: 9 test cases
- Coverage: Happy paths, error cases, security scenarios

### ✅ Deliverable 3: RTM (Complete Matrix)
- 26 requirements mapped
- 27 test cases traced
- 100% coverage verified
- No gaps, no orphans

---

## 💡 Key Concepts You Now Own

### Test Scenario Characteristics
✅ High-level description of user journey
✅ Business-focused language
✅ Describes WHAT to test, not HOW
✅ Usually 2-3 sentences
✅ Maps to multiple test cases
✅ Used for planning and communication

### Test Case Characteristics
✅ Detailed step-by-step instructions
✅ Specific test data included
✅ Preconditions and expected results
✅ Can be executed by anyone
✅ Traceable to requirements
✅ Used for execution and automation

### RTM Purpose
✅ Maps requirements to test cases
✅ Verifies 100% coverage
✅ Identifies gaps
✅ Provides audit trail
✅ Compliance verification
✅ Stakeholder communication

---

## 🎯 Before Your Interview

**Practice explaining:**
- [ ] Difference between scenario and test case
- [ ] How you'd write a test case for [any feature]
- [ ] How you ensure complete test coverage
- [ ] What an RTM is and why it matters
- [ ] Your 3 specific examples (registration, login, password reset)

**Have ready:**
- [ ] Your scenario descriptions (5 scenarios)
- [ ] Sample test cases (know 2-3 in detail)
- [ ] RTM explanation (coverage and mapping)
- [ ] Specific numbers: 26 requirements, 27 tests, 100% coverage

---

## 📈 Interview Impact

**When you say:**
"I designed 5 end-to-end scenarios covering registration, login, and password reset. From those scenarios, I created 27 detailed test cases. I mapped each test case back to specific requirements in a traceability matrix, achieving 100% coverage with zero gaps."

**Interviewer thinks:**
✅ "This person knows the difference between planning and execution"
✅ "They ensure systematic, complete coverage"
✅ "They understand business and technical perspectives"
✅ "They would catch missing requirements before starting tests"
✅ "They could audit and verify my test quality"

---

## 🎬 Sample Scenario (Ready to Explain)

```
SCENARIO 1: New User Registration & First Login

User Role: New/Guest user
Goal: Create account and access dashboard

Main Flow:
1. User navigates to /register
2. Fills form: Name, Email, Password (8+ chars, 1 uppercase, 1 number)
3. Accepts Terms & Conditions
4. Clicks Register
5. Receives verification email within 1 minute
6. Clicks email link to verify
7. Redirected to login page
8. Logs in with email and password
9. Authenticated and redirected to dashboard
10. Can access protected resources

Happy Path: ✅ Registration successful → Email verified → Logged in
Error Cases: ❌ Weak password, duplicate email, invalid format
Edge Cases: Token expiry, concurrent registration, SQL injection

Associated Test Cases: TC-REG-001 (happy path), TC-REG-002 (weak password),
                      TC-REG-004 (duplicate), TC-REG-009 (security)
```

---

## 📝 Practical Checklists

### When Writing a Scenario:
- [ ] Clear business goal stated
- [ ] User role defined
- [ ] Happy path documented (main flow)
- [ ] Alternative flows listed (if any)
- [ ] Error scenarios identified
- [ ] Starting and ending points clear
- [ ] Real user journey (not technical)
- [ ] Can be read by non-technical person

### When Writing a Test Case:
- [ ] Unique test case ID
- [ ] Clear, specific title
- [ ] Preconditions stated (can be repeated)
- [ ] Test data explicit (not generic)
- [ ] Steps numbered and actionable
- [ ] Expected result specific (not "works")
- [ ] One test per case (not multiple scenarios)
- [ ] Can be executed by anyone
- [ ] Traceable to requirement
- [ ] Documented and version controlled

### When Creating RTM:
- [ ] Every requirement has at least one test case
- [ ] Every test case traces to a requirement
- [ ] Coverage percentage calculated
- [ ] Gaps identified and noted
- [ ] Orphaned test cases identified
- [ ] Priority levels assigned
- [ ] Automated vs manual noted
- [ ] Status tracked (Covered, Uncovered, Blocked)

---

## 🌟 Your Competitive Edge

**Most QA candidates:**
❌ "I write test cases"
❌ "I test different scenarios"
❌ "I make sure everything works"

**YOU say:**
✅ "I design end-to-end scenarios describing complete user journeys"
✅ "I create detailed test cases with specific steps and data"
✅ "I map requirements to test cases in an RTM ensuring 100% coverage"
✅ "I can demonstrate zero testing gaps and complete audit trail"

---

## 📚 Files in Your Day 3 Package

```
day3/
├─ Day3_Part1_Concepts_and_Foundations.md
│  └─ Concepts, difference between scenario/case, RTM intro
│
├─ Day3_E2E_Scenarios_Registration_Login_Reset.md
│  └─ 5 complete scenarios with all flows
│
├─ Day3_Detailed_Test_Cases.md
│  └─ 27 production-ready test cases
│
├─ Day3_Requirements_Traceability_Matrix.md
│  └─ Complete RTM with 26 requirements mapped
│
└─ Day3_Quick_Reference.md (this file)
   └─ Interview prep, quick reference, decision guides
```

---

**You're ready for Day 3 interviews!** 💪🎯

