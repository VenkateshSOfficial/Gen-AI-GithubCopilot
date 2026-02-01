# Definition of Ready (DOR) & Definition of Done (DOD) 📋

## Quick Overview

```
DOR = Before work starts → Is it READY to work on?
DOD = After work done → Is it COMPLETELY finished?
```

---

## Definition of Ready (DOR) – The "GO" Checklist ✅

### What is DOR?

**Definition:** A checklist that defines when a task/user story is ready to be picked up by the development team. It's about preventing wasted work on unclear requirements.

**Real-Time Example:**

```
SCENARIO: New Feature "Add Wishlist to E-Commerce"

BEFORE DOR CHECK (Team sees unclear story):
├─ Requirements vague
├─ Business doesn't know exact behavior
├─ Design not finalized
├─ QA doesn't know what to test
├─ Dev asks: "What should happen when user clicks??"
└─ Result: Team wastes 2 days asking questions

AFTER DOR CHECK (Everything clear):
├─ Requirements documented
├─ Acceptance criteria written
├─ Design approved
├─ QA knows exact test cases
├─ Dev knows exactly what to build
└─ Result: Team starts coding immediately
```

### DOR Checklist (Typical)

```
✅ REQUIREMENT CLARITY
   □ User story title is clear
   □ Description explains the "why"
   □ Acceptance criteria defined (3-5 criteria)
   □ No ambiguity about expected behavior
   
✅ TECHNICAL CLARITY
   □ Technical requirements documented
   □ Dependencies identified
   □ Architecture decision made
   □ Technology stack clear
   
✅ DESIGN READY
   □ UI/UX mockups completed
   □ Design approved by PM/UX team
   □ All edge cases designed
   □ Responsive design specs clear
   
✅ QA READY
   □ QA has test plan
   □ Test cases drafted
   □ Test data prepared
   □ Test environment ready
   
✅ BUSINESS READY
   □ Product owner approved
   □ Acceptance criteria agreed
   □ Priority assigned
   □ Effort estimated
   
✅ NO BLOCKERS
   □ No external dependencies
   □ All information available
   □ No legal/compliance questions
   □ Approved by stakeholders

If ANY checkbox is unchecked → Story is NOT READY
Move back to backlog for refinement
```

### Real-Time DOR Example: Payment Processing Feature

```
STORY: "Enable users to save multiple payment methods"

DOR CHECKLIST:

❌ NOT READY (Before DOR):
   ├─ Requirements: "Allow users to save cards" (too vague)
   ├─ Unclear: How many? Max 5 or unlimited?
   ├─ Unclear: Can they delete saved cards?
   ├─ Unclear: Can they set default card?
   ├─ No design mockups
   ├─ QA doesn't know test scenarios
   ├─ Tech lead: "Which payment processor? Stripe or custom?"
   └─ Result: Blocked, sent back for refinement

✅ READY (After DOR):
   ├─ Requirements: "Users can save up to 5 payment methods"
   ├─ Clear: Can add, delete, set default
   ├─ Clear: Name card as "Visa-1234", "Amex-5678"
   ├─ Design: Mockups approved showing UI
   ├─ QA: Has test matrix for all scenarios
   ├─ Tech: Stripe API integration spec clear
   ├─ Acceptance Criteria:
   │  1. User can add card to account
   │  2. User can save card with custom name
   │  3. User can set one as default
   │  4. User can delete saved card
   │  5. Deleted card removes payment option
   └─ Result: Dev can start immediately
```

---

## Definition of Done (DOD) – The "STOP" Checklist ✅

### What is DOD?

**Definition:** A checklist that defines when a task/user story is completely finished and ready for release/production. It's about quality and completeness.

**Real-Time Example:**

```
SCENARIO: Developer finishes "Add Wishlist" feature

BEFORE DOD CHECK (Incomplete):
├─ Code written but not tested
├─ Code not reviewed
├─ No documentation
├─ QA didn't test all scenarios
├─ No performance checks
├─ "It works on my machine" 😅
└─ Result: Bugs hit production

AFTER DOD CHECK (Complete):
├─ Code written AND tested
├─ Code reviewed and approved
├─ Documentation updated
├─ QA tested all scenarios
├─ Performance verified
├─ Ready for production
└─ Result: Smooth deployment
```

### DOD Checklist (Typical)

```
✅ CODE QUALITY
   □ Code written and compiles
   □ Follows team coding standards
   □ No code smells or tech debt
   □ Comments added for complex logic
   
✅ TESTING (Developer)
   □ Unit tests written (>80% coverage)
   □ Unit tests passing
   □ Manual testing by dev done
   □ Edge cases tested
   
✅ CODE REVIEW
   □ Code review submitted
   □ Approved by 2+ team members
   □ All comments addressed
   □ No blocking issues
   
✅ QA TESTING
   □ QA received the story
   □ All test cases executed
   □ Test results documented
   □ All acceptance criteria met
   □ No critical/blocking bugs
   
✅ DOCUMENTATION
   □ Code comments clear
   □ API documentation updated (if applicable)
   □ User documentation updated
   □ Test results documented
   □ Known issues documented (if any)
   
✅ INTEGRATION
   □ Code merged to main branch
   □ CI/CD pipeline passed
   □ No merge conflicts
   □ Integration tests passing
   
✅ PERFORMANCE
   □ Performance impact assessed
   □ No significant slowdown
   □ Database queries optimized
   □ Memory usage acceptable
   
✅ SECURITY
   □ No security vulnerabilities
   □ Authentication checks in place
   □ Sensitive data not exposed
   □ OWASP compliance checked
   
✅ DEPLOYMENT READY
   □ Feature flag in place (if needed)
   □ Rollback plan documented
   □ Deployment steps documented
   □ Environment variables configured
   
If ANY checkbox is unchecked → Story is NOT DONE
Cannot move to production
Must complete before closing

Definition: "Ready to deploy to production with confidence"
```

### Real-Time DOD Example: Payment Feature Complete

```
STORY: "Enable users to save multiple payment methods"

✅ CODE READY:
   ├─ PaymentService.java written
   ├─ Unit tests: 92% coverage
   ├─ Code reviewed and approved
   └─ Merged to main branch

✅ QA TESTING COMPLETE:
   ├─ Test case 1: Add card ✓
   ├─ Test case 2: Save with name ✓
   ├─ Test case 3: Set default ✓
   ├─ Test case 4: Delete card ✓
   ├─ Test case 5: Security checks ✓
   ├─ Test case 6: Database consistency ✓
   └─ No bugs found

✅ DOCUMENTATION DONE:
   ├─ API docs updated
   ├─ Code comments clear
   ├─ User guide updated
   └─ Deployment guide written

✅ INFRASTRUCTURE:
   ├─ Feature flag created
   ├─ Rollback plan documented
   ├─ Monitoring set up
   └─ Alert thresholds configured

✅ DEPLOYMENT:
   ├─ Staging deployed ✓
   ├─ E2E tests passed ✓
   ├─ Performance OK ✓
   └─ Ready for production!

Result: Story moved to "DONE" bucket
Can now be released to production
```

---

## DOR vs DOD Comparison

```
┌──────────────────────────────────────────────────────┐
│ DEFINITION OF READY (DOR)                            │
├──────────────────────────────────────────────────────┤
│ TIMING:      Before work starts                      │
│ QUESTION:    "Is this ready to work on?"             │
│ FOCUSED ON:  Clarity & Prevention                    │
│ WHO CHECKS:  Product Owner, Tech Lead, QA Lead      │
│ GOAL:        Prevent wasted effort                   │
│ TYPICAL:     2-3 hours of refinement                 │
│                                                      │
│ CHECKLIST:                                           │
│ ✓ Requirements clear                                 │
│ ✓ Design ready                                       │
│ ✓ Acceptance criteria defined                        │
│ ✓ No blockers                                        │
│ ✓ QA team understands                                │
└──────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────┐
│ DEFINITION OF DONE (DOD)                             │
├──────────────────────────────────────────────────────┤
│ TIMING:      After work complete                     │
│ QUESTION:    "Is this ready for production?"         │
│ FOCUSED ON:  Quality & Completeness                  │
│ WHO CHECKS:  Dev Lead, QA, DevOps                    │
│ GOAL:        Ensure production quality               │
│ TYPICAL:     40-60% of sprint time                   │
│                                                      │
│ CHECKLIST:                                           │
│ ✓ Code tested & reviewed                             │
│ ✓ QA approved                                        │
│ ✓ Documentation complete                             │
│ ✓ Deployment ready                                   │
│ ✓ Rollback plan in place                             │
└──────────────────────────────────────────────────────┘
```

---

## Real-World Workflow

```
SPRINT PROCESS
═════════════════════════════════════════════════════════════════

WEEK 1: REFINEMENT
├─ Product owner creates user stories
├─ Team discusses requirements
├─ Design team creates mockups
├─ QA creates test plans
└─ When DOR met → Story ready for sprint

SPRINT PLANNING
├─ Team picks "READY" stories only
├─ Story: "Enable saved payment methods"
├─ Tech lead estimates: 13 story points
├─ Team commits to story
└─ Sprint begins

SPRINT EXECUTION (3 Days for Dev)
├─ Dev 1: Write payment service code (1 day)
├─ Dev 1: Write unit tests (0.5 day)
├─ Dev 2: Code review (0.5 day)
├─ Dev 1: Fix review comments (1 day)
└─ Code merged to staging

QA TESTING (2 Days)
├─ QA: Execute all test cases
├─ QA: Find edge case bug
├─ Dev: Fix bug (0.5 day)
├─ QA: Retest (0.5 day)
└─ All tests pass

DEPLOYMENT CHECKLIST (1 Day)
├─ Verify DOD checklist: All passed ✓
├─ Deploy to staging: Success ✓
├─ Run smoke tests: Pass ✓
├─ Get final approval: Yes ✓
└─ Feature ready for production

RESULT:
• DOR prevented wasted time (clear requirements)
• DOD ensured quality (comprehensive testing)
• Story deployed to production successfully!
```

---

## Common Mistakes

### DOR Mistakes ❌

```
❌ Starting work without DOR met:
   └─ Leads to: Rework, confusion, missed requirements

❌ DOR too strict (perfectionist):
   └─ Leads to: Bottleneck in refinement

❌ DOR too loose (anything goes):
   └─ Leads to: Wasted sprint time asking questions

❌ Skipping DOR for "urgent" stories:
   └─ Leads to: More urgent fixes needed later
```

### DOD Mistakes ❌

```
❌ Shipping without DOD met:
   └─ Leads to: Bugs in production, customer support load

❌ DOD too strict (perfectionistic):
   └─ Leads to: Nothing ever ships

❌ DOD too loose (minimal checking):
   └─ Leads to: Production outages

❌ Different DOD for different teams:
   └─ Leads to: Inconsistent quality
```

---

## Interview Answers 🎤

### Question: "What's the difference between DOR and DOD?"

**GOOD ANSWER:**
"DOR (Definition of Ready) is the checklist BEFORE work starts—it ensures requirements are clear, design is approved, and there are no blockers.

DOD (Definition of Done) is the checklist AFTER work finishes—it ensures code is tested, reviewed, documented, and ready for production.

For example, a story isn't ready (DOR not met) if the design isn't approved or QA doesn't understand what to test. A story isn't done (DOD not met) if it hasn't been code-reviewed, QA hasn't tested it, or documentation isn't updated.

Both prevent wasted work—DOR prevents starting bad work, DOD prevents shipping incomplete work."

---

## Quick Reference

```
DOR = Gate BEFORE work
DOD = Gate AFTER work

DOR Questions:
• Do we understand what to build?
• Do we have everything we need?
• Are there any blockers?
• Can we start immediately?

DOD Questions:
• Is code tested and reviewed?
• Has QA approved?
• Is it documented?
• Is it ready for production?

DOR Owners: Product Owner, QA, Tech Lead
DOD Owners: Dev, QA, DevOps
```

---

This is how professional teams prevent chaos and ensure quality! 🎯
