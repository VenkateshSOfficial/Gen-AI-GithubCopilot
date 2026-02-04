# Day 5: Agile & Regression Strategy – Complete Master Guide

## 📚 Table of Contents
1. [QA in Scrum/Kanban](#qa-in-scrumkanban)
2. [Story Lifecycle with Testing](#story-lifecycle-with-testing)
3. [Regression Testing in Agile](#regression-testing-in-agile)
4. [Interview Answers](#interview-answers)
5. [Real-Time Examples](#real-time-examples)
6. [Practice Scenarios](#practice-scenarios)

---

## QA in Scrum/Kanban

### 🎯 Scrum Framework Overview

**Key Roles:**
- **Product Owner**: Creates user stories, sets priorities
- **Scrum Master**: Facilitates ceremonies, removes blockers
- **Development Team**: Includes developers, QA engineers, DevOps engineers
- **QA Engineer's Role**: Integral part of the team (NOT gatekeeper)

**Key Ceremonies:**
| Ceremony | Frequency | QA Role |
|----------|-----------|---------|
| Sprint Planning | Start of sprint | Define test strategy, estimation |
| Daily Standup | Every day | Report testing progress, blockers |
| Sprint Review | End of sprint | Demo test cases, quality metrics |
| Retrospective | End of sprint | Share lessons learned, improvements |
| Backlog Refinement | Mid-sprint | Clarify test requirements, AC |

**Sprint Duration**: Typically 1-4 weeks (most common: 2 weeks)

---

### 🔄 Kanban Framework Overview

**Key Principles:**
- **Continuous Flow**: Work items flow through the pipeline
- **Limit WIP**: Work In Progress limits prevent bottlenecks
- **Visualize Work**: Kanban board shows status at all times
- **Manage Flow**: Focus on cycle time and throughput

**Kanban Board Typical States:**
```
Backlog → Ready → In Development → In Testing → In Review → Done
```

**QA in Kanban**:
- QA can pull testing work immediately when development is ready
- No waiting for sprint boundaries
- Focus on continuous quality, not sprint bursts

---

## Story Lifecycle with Testing

### 📖 Complete User Story Journey

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    AGILE USER STORY LIFECYCLE                          │
└─────────────────────────────────────────────────────────────────────────┘

1. BACKLOG CREATION
   └─ Product Owner creates user story
   └─ Story Format: As a [user], I want [feature], so that [benefit]
   └─ Initial AC (Acceptance Criteria) defined
   
2. BACKLOG GROOMING/REFINEMENT (Pre-Sprint)
   └─ QA asks clarifying questions
   └─ Identify test scenarios
   └─ Identify edge cases
   └─ Story is made "Ready for Sprint"
   
3. SPRINT PLANNING
   └─ Story pulled into sprint
   └─ QA estimates testing effort
   └─ Team commits to story
   └─ Definition of Done (DoD) agreed upon
   
4. DEVELOPMENT (In Progress)
   └─ Dev starts coding
   └─ QA prepares test cases
   └─ QA sets up test data/environments
   
5. DEV COMPLETE → READY FOR TEST
   └─ Dev does unit testing & code review
   └─ Dev moves story to "Ready for QA"
   
6. QA TESTING (In Progress)
   └─ Functional Testing
   └─ Integration Testing
   └─ Regression Testing (relevant tests)
   
7. BUG FOUND?
   ├─ YES → Dev & QA collaborate, bug fixed → Back to Testing
   └─ NO → Proceed to Done
   
8. TESTING COMPLETE → READY FOR REVIEW
   └─ QA marks all test cases as Pass/Fail
   └─ QA documents coverage
   
9. REVIEW & ACCEPTANCE
   └─ Product Owner accepts work
   └─ Stakeholders verify requirement met
   
10. DONE (Definition of Done met)
   └─ Code merged to main branch
   └─ Deployed to staging/production
   └─ Documentation complete
   └─ All test cases automated (if applicable)
```

### 🎬 Practical Example: "User Registration Feature"

**Story**: As a new user, I want to register with email and password so that I can create an account.

**Phase 1: Backlog Grooming**
```
QA Questions Asked:
Q1: What validations on email? (Format, domain, uniqueness?)
Q2: Password requirements? (Length, special chars, uppercase, lowercase?)
Q3: What happens if email already exists?
Q4: Email verification flow?
Q5: What's the max character limit?
Q6: Case sensitivity on email?
Q7: What about SQL injection attempts?
Q8: Mobile responsiveness?

Result: Story refined with clear AC
```

**Phase 2: Sprint Planning**
```
Acceptance Criteria Finalized:
AC1: User can enter valid email and password
AC2: Email validation: RFC 5322 format
AC3: Password: Min 8 chars, 1 uppercase, 1 lowercase, 1 number, 1 special char
AC4: Duplicate email shows error message
AC5: Success shows confirmation message
AC6: Form works on mobile (responsive)
AC7: XSS/SQL injection protected

QA Estimation: 2-3 days of testing
```

**Phase 3: Development Starts**
```
Day 1-2: Dev codes registration form
QA Activities:
- Prepares test cases for all AC
- Creates test data: valid emails, invalid formats, boundary values
- Sets up test environment
- Prepares SQL injection payloads
```

**Phase 4: Dev Complete → Ready for QA**
```
QA Testing:
✓ Test Case 1: Valid registration (john@example.com, Pass123!) → PASS
✓ Test Case 2: Invalid email format (johnexample.com) → PASS
✓ Test Case 3: Weak password (123) → PASS
✓ Test Case 4: Duplicate email → PASS
✓ Test Case 5: SQL injection ('; DROP TABLE users; --) → PASS
✓ Test Case 6: XSS attempt (<script>alert('hack')</script>) → PASS
✗ Test Case 7: Mobile responsiveness → FAIL (buttons not aligned)
   └─ Bug reported: "Button misalignment on iPhone 12"

Dev fixes the issue → Back to QA for re-testing
```

**Phase 5: All Tests Pass → Done**
```
✓ All test cases pass
✓ PO accepts feature
✓ Code merged and deployed
✓ Test cases automated in CI/CD pipeline
```

---

## Regression Testing in Agile

### 🔁 What is Regression Testing?

**Definition**: Testing that previously working functionality still works after new changes.

**Why Important in Agile**?
- New features can break existing features
- Rapid releases increase regression risk
- Automation is critical for speed

### 🎯 Types of Regression Testing

#### 1. **Smoke Testing**
```
Definition: Quick sanity check of critical flows
Scope: Core business functionality only
Effort: 15-30 minutes
Frequency: Every build
Tool: Automated

Example - E-commerce App:
✓ Login works
✓ Add item to cart works
✓ Checkout works
✓ Payment process works

If ANY of these fail → Stop, report blocker, don't deploy
```

#### 2. **Sanity Testing**
```
Definition: Testing specific functionality after bug fix
Scope: Feature area that was modified
Effort: 1-2 hours
Frequency: After every bug fix in specific component
Tool: Manual or Automated

Example - After fixing "Discount Code" bug:
✓ Apply valid discount code → applies correctly
✓ Apply invalid discount code → shows error
✓ Remove discount code → price updates
✓ Max discounts applied together → works as expected
```

#### 3. **Full Regression Testing**
```
Definition: Complete test suite for all functionality
Scope: Entire application
Effort: Days or weeks
Frequency: Before major release, end of sprint
Tool: Fully Automated

Example - Before Production Release:
✓ All user modules (Login, Register, Profile)
✓ All feature modules (Cart, Checkout, Payment)
✓ All admin features (User Management, Reports)
✓ All integrations (Payment Gateway, Email Service)
✓ Non-functional (Performance, Security, Accessibility)
```

### 🤖 Automation Involvement in Agile

**Automation Strategy Matrix**:

```
┌─────────────────────┬───────────────────┬──────────────────┐
│ Test Type           │ Automation %      │ When to Automate │
├─────────────────────┼───────────────────┼──────────────────┤
│ Smoke Tests         │ 100%              │ From Day 1       │
│ Sanity Tests        │ 80-90%            │ After 2nd sprint │
│ Regression Tests    │ 70-80%            │ When stable      │
│ New Feature Tests   │ 50-70%            │ As you go        │
│ Manual Exploratory  │ 0-10%             │ Just before PO   │
│ Acceptance Tests    │ 80-90%            │ With feature     │
└─────────────────────┴───────────────────┴──────────────────┘
```

**Automation Pyramid in Agile**:
```
           /\
          /  \
         / E2E \      5-10% (UI Tests - Slow, Flaky)
        /______\
       /        \
      / API      \    15-25% (API Tests - Medium speed)
     /____________\
    /              \
   /   Unit Tests   \   60-70% (Unit Tests - Fast, Reliable)
  /________________\
```

### 📊 Decision: What to Automate in Regression?

**✅ AUTOMATE These:**
```
1. High-frequency tests (run multiple times per day)
2. Repetitive scenarios (same test, different data)
3. Critical business flows (login, payment, core features)
4. Stable features (unchanged for 2+ sprints)
5. Performance-sensitive paths
6. API/backend tests (most stable, easiest to automate)
7. Data-driven tests (multiple inputs, same logic)
```

**❌ DON'T AUTOMATE These:**
```
1. UI-heavy, design-changing features (high maintenance)
2. One-time manual exploratory tests
3. Features with unstable requirements
4. Visual/UI regression (difficult to automate reliably)
5. Complex user interactions (multiple dialogs, drag-drop)
6. Tests that rarely run (not cost-effective)
```

**🤔 HYBRID APPROACH These:**
```
1. New UI features → Manual first, automate after stable
2. Complex workflows → Manual + API automation
3. Visual regression → Automated screenshots + manual review
4. Accessibility testing → Automated tools + manual exploration
```

---

## Interview Answers

### 📌 ANSWER 1: "Walk me through how a user story moves through your team with respect to testing"

#### ✨ **Model Answer**:

"I'd be happy to walk you through our story lifecycle with a practical example. Let me use a 'Add to Wishlist' feature:

**Phase 1: Backlog Refinement**
We start during backlog grooming where I sit with the Product Owner and ask clarifying questions about the feature:
- What should happen when you add to wishlist from product page?
- Can you add the same item twice?
- What about when you're logged out?
- Should there be notifications?

These questions help us define clear Acceptance Criteria before the story enters the sprint.

**Phase 2: Sprint Planning**
In sprint planning, I review the refined story with the development team:
- I estimate testing effort (usually 1-2 days for a small feature)
- I outline my test strategy: What I'll test (happy path, edge cases, error scenarios)
- We agree on the Definition of Done: All test cases pass, no high-severity bugs, test cases automated, etc.

**Phase 3: Development Phase**
While developers code, I:
- Design comprehensive test cases covering all AC
- Prepare test data (valid and invalid inputs)
- Set up test environments
- Create a traceability matrix linking test cases to AC

**Phase 4: QA Testing Phase**
Once dev marks it 'Ready for QA', I execute test cases:
- Functional tests: Feature works as per AC
- Edge cases: Boundary values, null inputs, special characters
- Integration tests: How it integrates with existing features
- Non-functional: Performance, security, accessibility

If I find bugs, I:
- Document them clearly with reproduction steps
- Assign severity and priority
- Work with dev to fix them
- Re-test the fixes

**Phase 5: Done Criteria**
Before marking as Done:
- ✅ All test cases pass
- ✅ No unresolved bugs
- ✅ PO accepts the feature
- ✅ Test cases are automated in CI/CD
- ✅ Documentation is complete

This ensures quality is built in, not tested in."

---

### 📌 ANSWER 2: "How do you decide what to include in regression?"

#### ✨ **Model Answer**:

"Great question! Regression strategy is about being smart with our test effort. Here's my approach:

**Step 1: Risk-Based Approach**
I first identify what could break:
- **High Risk**: Payment flow, Login, Checkout (core business critical)
- **Medium Risk**: Features that interact with modified code
- **Low Risk**: Isolated features unchanged for 2+ sprints

**Step 2: Coverage Decisions by Area**

For **Critical Business Flows** (Payment, Login, Cart):
- I do **100% regression** - Full test suite, automated
- Frequency: Every sprint, every release
- Automation: All critical flows are automated

For **Active Feature Areas** (Recently modified modules):
- I do **Smoke + Sanity testing** - Quick checks + specific area testing
- Frequency: Daily builds
- Automation: 80-90% automated

For **Stable Features** (No changes in 3+ sprints):
- I do **Quarterly deep regression** only
- Frequency: Before major releases
- Automation: Reuse existing automated tests

For **New Features** (Just added):
- I do **Initial full regression** to ensure no regressions introduced
- Then: Maintenance regression (critical path only)

**Step 3: Automation vs Manual Balance**

I automate:
- Repetitive smoke/sanity tests (daily execution)
- Critical user journeys (end-to-end flows)
- API regression tests (stable, reliable)
- Data validation tests (multiple data combinations)

I do manually:
- Exploratory testing for new features
- Visual/UI regression (before automation setup)
- Complex user interaction scenarios
- Accessibility testing (initial setup)

**Step 4: Practical Example - E-commerce App**

Say we modified the 'Apply Coupon' feature:

**What I include in regression:**
```
HIGH PRIORITY (Automated):
✓ Login and cart access (smoke)
✓ Add product to cart (sanity - could be affected)
✓ Apply valid coupon (directly modified)
✓ Apply invalid coupon (error handling)
✓ Checkout with coupon (integration)
✓ Remove coupon (sanity)

MEDIUM PRIORITY (Automated):
✓ Multiple coupons (related)
✓ Coupon + discount interaction
✓ Payment with coupon (integration)

LOW PRIORITY (Quarterly only):
□ Wishlist features (unrelated)
□ User profile (unrelated)
□ Admin reports (unrelated)
```

**Step 5: Metrics I Track**
- Regression pass rate: Target >95%
- Regression cycle time: Target <2 hours for smoke
- Bug escape rate: Target <1%
- Automation ROI: Test runs vs maintenance effort

**My philosophy**: Regression isn't about testing everything every time. It's about testing smart - focusing on high-impact areas while maintaining a strong automated safety net. We balance speed (automation) with thoroughness (right test selection)."

---

## Real-Time Examples

### 📱 Example 1: Mobile App - Push Notification Feature

**Story**: As a user, I want to receive push notifications so I don't miss important updates.

**Testing Through Lifecycle**:

```
PHASE 1: BACKLOG GROOMING
QA Questions:
- How often can notifications be sent? (Rate limiting?)
- What happens if app is closed?
- Does it work in Do Not Disturb mode?
- What about different Android/iOS versions?
- Sound + vibration settings?
- Notification clearing behavior?

PHASE 2: SPRINT PLANNING
Test Cases Outlined: 12 scenarios
Estimated Effort: 2-3 days
Automation Strategy: 70% (core features), 30% (manual exploration)

PHASE 3: DEVELOPMENT
QA Activities:
- Create test cases for all AC
- Prepare test devices (iOS 14, 15, 16; Android 11, 12, 13)
- Set up test server for push notifications
- Create test data: different notification types

PHASE 4: QA TESTING
Test Results:
✓ In-app notification display
✓ Notification Center integration
✓ Deep linking from notification
✗ Notification not received on Android 11
   Bug: "Push notification not triggered on Android 11 below API 30"
   Severity: High
   Status: Under Fix

Dev applies fix → QA retests → PASS

PHASE 5: REGRESSION IN NEXT SPRINT
Regression Tests (Automated):
- Notification delivery (mock server)
- Notification display across OS versions
- Deep linking functionality
- Settings respected (DND, sounds)

Automation Tool: Appium + TestNG
Frequency: Every build
Time: ~30 minutes automated run
```

### 🛒 Example 2: Web App - Payment Gateway Integration

**Story**: As a customer, I want to pay via Stripe so I can checkout securely.

**Regression Strategy**:

```
CHANGES MADE: Stripe payment integration
POTENTIALLY AFFECTED AREAS:
- Cart functionality
- Checkout flow
- Order creation
- Email notifications
- Order history
- Admin dashboard

REGRESSION SCOPE:
┌─────────────────────────────────────────────────┐
│ SMOKE TESTS (Run every build)                  │
├─────────────────────────────────────────────────┤
│ ✓ Add items to cart                             │
│ ✓ Proceed to checkout                           │
│ ✓ Complete payment                              │
│ ✓ Order confirmation email sent                 │
│ ✓ Order visible in user account                 │
└─────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────┐
│ SANITY TESTS (After payment fix)               │
├─────────────────────────────────────────────────┤
│ ✓ Valid card payment                            │
│ ✓ Invalid card decline                          │
│ ✓ Expired card handling                         │
│ ✓ 3D Secure flow (if applicable)                │
│ ✓ Partial payment handling                      │
│ ✓ Refund processing                             │
└─────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────┐
│ INTEGRATION TESTS (Weekly)                      │
├─────────────────────────────────────────────────┤
│ ✓ Cart → Checkout → Payment flow                │
│ ✓ Order creation after payment                  │
│ ✓ Inventory update                              │
│ ✓ Email notifications                           │
│ ✓ Admin dashboard update                        │
│ ✓ Shipping integration                          │
└─────────────────────────────────────────────────┘

AUTOMATION:
✅ Payment API tests (Rest Assured) - 100% automated
✅ Order creation workflow - Selenium automated
✅ Email notification checks - API automated
❌ 3D Secure flow - Manual (requires external service)
❌ Visual regression - Manual review

Regression Execution Time:
- Smoke: 30 minutes
- Sanity: 1.5 hours
- Full Integration: 3 hours
```

---

## Practice Scenarios

### 🎯 Scenario 1: Bug Found During Testing

**Situation**: You're testing a new "Bulk Order Upload" feature. You find that when uploading a CSV with 1000 rows, only 500 get imported. Dev says it's "expected behavior" for performance.

**Your Response**:
```
1. Ask clarifying questions:
   - What's the requirement? Does AC specify the limit?
   - Is this documented?
   - What about users who genuinely need to upload 1000?

2. Check Definition of Done:
   - Is "bulk upload of 1000 items" part of AC?
   - Did PO accept 500-item limitation?

3. Document properly:
   - Report as blocker or minor bug based on AC
   - If AC says "1000", it's a blocker
   - If AC says "optimized for performance", discuss with PO

4. Collaborate:
   - Suggest solutions: Pagination, batch uploads, async processing
   - Work with dev on timeline

Decision: If it violates AC → Block. If it's a gap → Escalate to PO.
```

### 🎯 Scenario 2: Regression Failure

**Situation**: A regression test that's been passing for 5 sprints suddenly fails. Login flow is broken.

**Your Response**:
```
1. Immediate Steps:
   - Verify it's not a test flakiness (run twice)
   - Check if test environment is down
   - Check recent deployments

2. If it's a real failure:
   - Reproduction: Can you manually reproduce it?
   - Root cause: Which code change caused it?
   - Severity: Is it a complete blocker or partial issue?

3. Actions:
   - Notify dev team immediately
   - Hold deployment if it's critical
   - If it's not in the latest code, investigate build
   - Once fixed, re-run full regression

4. Prevention:
   - Add to daily smoke tests if not already
   - Consider CI/CD automated checks
   - Post-mortem: Why wasn't this caught earlier?
```

### 🎯 Scenario 3: Time Crunch - Reduced Testing Window

**Situation**: Sprint ends tomorrow but dev just finished testing features. You have 4 hours to test and the full regression would take 8 hours.

**Your Response**:
```
1. Triage immediately:
   - Identify critical features (business-critical)
   - Identify risky changes (complex logic, integrations)
   - Identify stable features (minor tweaks, no dependencies)

2. Risk-Based Testing:
   Priority 1 (2 hours): Critical + risky features - FULL testing
   Priority 2 (1.5 hours): Medium features - Smoke + Sanity
   Priority 3 (0.5 hours): Low-risk tweaks - Smoke only
   
3. Parallel Testing:
   - Assign features to team members (if available)
   - Automate what you can quickly
   - Manual testing for complex scenarios

4. Communication:
   - Flag to Scrum Master: "Need 2 more hours or reduce scope"
   - Propose: Release with known risks documented
   - Decide: Extend sprint or defer low-priority features

5. Post-Sprint:
   - Add regression tests to sprint
   - Improve estimation
   - Investigate why dev finished late
```

---

## Key Takeaways

### ✅ For Scrum/Kanban:
- QA is integral, not a gate
- Participate in all ceremonies
- Estimate testing effort accurately
- Collaborate early with PO and dev

### ✅ For Story Lifecycle:
- Ask questions during grooming
- Define test strategy during planning
- Test thoroughly during sprint
- Automate as you go

### ✅ For Regression:
- Risk-based approach (not test everything)
- Automate critical paths
- Smoke tests run daily
- Balance speed and coverage

### ✅ For Interview:
- Use real examples from your experience
- Show risk assessment thinking
- Demonstrate collaboration
- Explain automation strategy clearly

---

## Quick Interview Checklist

Before your interview, verify you can:
- [ ] Explain Scrum vs Kanban differences
- [ ] Walk through a story from creation to done
- [ ] Explain smoke vs sanity vs regression
- [ ] Describe your automation strategy
- [ ] Give examples from your projects
- [ ] Explain trade-offs in regression decisions
- [ ] Discuss prioritization techniques
- [ ] Describe Definition of Done
- [ ] Explain communication with team
- [ ] Discuss metrics you track

---

## Additional Resources for Practice

**Recommended Reading**:
- Agile Testing: A Practical Guide (Lisa Crispin)
- Scrum: The Art of Doing Twice the Work in Half the Time
- Kanban in Action

**Practice Topics**:
- Sprint planning estimation
- Backlog grooming facilitation
- Bug triage and prioritization
- Automation framework design
- Metrics and reporting in Agile

