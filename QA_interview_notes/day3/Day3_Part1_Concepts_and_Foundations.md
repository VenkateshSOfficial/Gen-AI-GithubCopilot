# Day 3 – Test Cases, Scenarios & Traceability: Complete Training

## 🎯 Quick Overview

**Today's Focus:** Master the practical side of testing
1. **Test Case vs. Test Scenario** - When and how to use each
2. **Writing Quality Test Cases** - Clear, concise, business-focused
3. **End-to-End Scenarios** - Complete user journeys
4. **Requirements Traceability Matrix (RTM)** - Map everything systematically

**Why It Matters:** Bridges the gap between theory (test design) and practice (real testing). Your team depends on clear, actionable test cases.

---

## 📚 Part 1: Test Case vs. Test Scenario

### What is a Test Scenario?

**Definition:** A high-level description of a user's journey or business flow. It describes WHAT to test, not HOW.

**Characteristics:**
- High-level and business-focused
- Describes user action sequence
- No step-by-step instructions
- No expected results details
- Usually 2-3 sentences
- Can map to multiple test cases

**Example Scenario:**
```
Scenario: User Registration Flow
"A new user registers with valid credentials, verifies email, and logs in"
```

### What is a Test Case?

**Definition:** A detailed, step-by-step set of conditions and actions to verify specific functionality. It describes exactly HOW to test.

**Characteristics:**
- Detailed and specific
- Step-by-step instructions
- Includes test data
- Clear expected results
- Can be executed by anyone
- Traceable to requirements

**Example Test Case:**
```
Test Case ID: TC-REG-001
Title: Valid User Registration
Precondition: User is on registration page
Steps:
  1. Enter email: john@example.com
  2. Enter password: SecurePass123!
  3. Enter confirm password: SecurePass123!
  4. Click Register button
Expected: Success message "Registration successful. Please verify your email"
```

---

## 🔄 Comparison: Test Case vs. Test Scenario

| Aspect | Test Scenario | Test Case |
|--------|---------------|-----------|
| **Level** | High-level | Detailed |
| **Focus** | Business flow | Technical steps |
| **Scope** | Multiple functions | Single function/path |
| **Detail** | General | Specific |
| **Data** | Implied | Explicit |
| **Execution** | Planning phase | Execution phase |
| **Count** | 5-10 per feature | 30-50 per feature |
| **Example** | "User registers and resets password" | TC-REG-001 with 10 steps |

---

## 📋 Part 2: Writing Quality Test Cases

### Test Case Structure

```
TEST CASE TEMPLATE:
═══════════════════════════════════════════════════════════

Test Case ID:           Unique identifier (TC-REG-001)
Title:                  Clear, concise title
Priority:               Critical/High/Medium/Low
Requirement ID:         Mapped requirement (REQ-001)
Module:                 Login, Registration, etc.
Precondition:           What must be true before execution
Test Data:              Specific values used

STEPS:
├─ Step 1: User action (explicit step)
├─ Step 2: System response (expected outcome)
├─ Step 3: User action
└─ Step 4: System response

Expected Result:        Final expected outcome
Post-condition:         State after test completion
Test Type:              Functional/Security/Performance
Automated:              Yes/No
```

### Writing Best Practices

✅ **DO:**
- Write from user's perspective
- Be specific with test data
- Include both positive and negative cases
- Make steps executable by anyone
- Reference requirements
- Keep language clear and concise
- Test one thing per test case

❌ **DON'T:**
- Use vague language ("test something")
- Assume knowledge ("obvious steps")
- Mix multiple test scenarios in one case
- Include too many steps (>10 steps)
- Forget expected results
- Use ambiguous expected values
- Leave out preconditions

---

## 🎬 Part 3: End-to-End (E2E) Test Scenarios

### What is an E2E Scenario?

**Definition:** A complete user journey from start to finish, covering multiple modules/features working together.

**Characteristics:**
- Starts with user goal
- Covers happy path (success)
- Includes alternative flows
- May include edge cases
- Real-world user journey
- Tests integration between features

### E2E Scenario Structure

```
SCENARIO OUTLINE:
═════════════════════════════════════════════════════════

Scenario Name:        Clear business-focused name
User Role:            Who is performing this
Business Goal:        What is the user trying to achieve
Prerequisite:         What must be set up first

MAIN FLOW (Happy Path):
├─ User Story 1:      First user action
├─ System Response:   System's expected reaction
├─ User Story 2:      Second user action
└─ ...continues...

ALTERNATIVE FLOWS:
├─ Flow A: If X happens → Then Y
├─ Flow B: If Z happens → Then W
└─ ...variations...

SUCCESS CRITERIA:     What indicates success
FAILURE SCENARIOS:    What could go wrong
```

---

## 📊 Part 4: Requirements Traceability Matrix (RTM)

### What is an RTM?

**Definition:** A table that maps requirements to test cases, ensuring every requirement is tested and no requirement is missed.

**Purpose:**
- ✅ Ensure 100% requirement coverage
- ✅ Identify untested requirements (gaps)
- ✅ Track test case to requirement mapping
- ✅ Verify scope completeness
- ✅ Support compliance/audits

### RTM Structure

```
RTM COLUMNS:
═════════════════════════════════════════════════════════

Requirement ID        | REQ-001, REQ-002, etc.
Requirement Text      | What the system must do
Test Scenario ID      | SCEN-001, SCEN-002, etc.
Test Case IDs         | TC-001, TC-002, TC-003, etc.
Status                | Covered, Uncovered, In Progress
Priority              | Critical, High, Medium, Low
Coverage Type         | Functional, Security, Performance
Verification Method   | Manual, Automated, Both
```

### RTM Example Structure

```
REQ-001: User can register with email
├─ SCEN-001: Valid Registration
│  ├─ TC-001: Valid email & password
│  ├─ TC-002: Weak password rejected
│  └─ TC-003: Duplicate email rejected
├─ SCEN-002: Invalid Input
│  └─ TC-004: Invalid email format
└─ Coverage: ✅ 100% (4 test cases)

REQ-002: User can reset password
├─ SCEN-003: Password Reset Flow
│  ├─ TC-005: Reset with valid email
│  └─ TC-006: Reset with invalid email
└─ Coverage: ✅ 100% (2 test cases)
```

---

## 🎯 Part 5: Choosing Between Test Case and Test Scenario

### When to Use Test Scenarios

✅ **Use Scenario when:**
- Planning testing approach
- Communicating with stakeholders
- Documenting user journeys
- Creating traceability
- Understanding feature scope
- Discussing edge cases

**Example:** "User registration, email verification, and login flow"

### When to Use Test Cases

✅ **Use Test Cases when:**
- Executing tests
- Documenting exact steps
- Training new team members
- Automating tests
- Tracking test execution
- Reporting results

**Example:** TC-REG-001 with 10 specific steps and expected results

---

## 📋 Quick Decision Tree

```
Do you need to PLAN testing?
├─ YES → Use Test SCENARIOS (high-level flows)
│
Do you need to EXECUTE testing?
├─ YES → Use Test CASES (detailed steps)
│
Do you need to COMMUNICATE with stakeholders?
├─ YES → Use Test SCENARIOS (business language)
│
Do you need to DOCUMENT for audits?
├─ YES → Use Test CASES (detailed trail)
│
Do you need to AUTOMATE testing?
├─ YES → Use Test CASES (specific steps)
│
Do you need to TRACE requirements?
├─ YES → Use RTM (map to both SCENARIOS and CASES)
```

---

## 📚 Summary So Far

### Test Case
- **Purpose:** Detailed execution guide
- **User:** Test team executing
- **Detail Level:** Very high
- **Format:** Step-by-step numbered list
- **Count:** Many per feature (30-50)

### Test Scenario
- **Purpose:** Business flow documentation
- **User:** Stakeholders, planners
- **Detail Level:** High-level
- **Format:** User story style
- **Count:** Few per feature (5-10)

### RTM
- **Purpose:** Coverage verification
- **User:** QA lead, test manager
- **Detail Level:** Summary view
- **Format:** Matrix/table
- **Count:** One per project

---

## 🎓 Interview Talking Points

**Q: "What's the difference between a test case and a test scenario?"**

**Good Answer:**
> "A test scenario is a high-level business flow describing what to test—for example, 'User registers, verifies email, and logs in.' A test case is a detailed, step-by-step guide with specific test data and expected results—for example, TC-REG-001 with 10 numbered steps and exact expected outcomes. Scenarios are for planning and stakeholder communication. Test cases are for execution."

**Great Answer:**
> "Test scenarios and test cases serve different purposes in the testing lifecycle. Scenarios are high-level descriptions of user journeys, written in business language. In a registration feature, I might have a scenario like 'Valid user registers with email verification.' From that one scenario, I create multiple test cases: TC-REG-001 for valid registration, TC-REG-002 for weak password, TC-REG-003 for duplicate email, etc. Each test case is detailed with specific steps, test data, preconditions, and expected results.

> I use scenarios for planning—to communicate with stakeholders about what flows we need to test. I use test cases for execution—to ensure testers know exactly what to do. I also create a Requirements Traceability Matrix mapping requirements to scenarios to test cases, ensuring 100% coverage with no gaps."

---

Now let's dive into the practical deliverables in the next files!
