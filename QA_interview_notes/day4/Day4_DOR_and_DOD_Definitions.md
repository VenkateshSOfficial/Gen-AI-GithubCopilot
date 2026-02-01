# Day 4 – Definition of Ready (DOR) & Definition of Done (DOD)

## 🎯 What is DOR (Definition of Ready)?

### Definition
**DOR (Definition of Ready)** is a checklist that defines what a user story or requirement MUST have BEFORE it enters the sprint/development cycle. It's about being READY for development, not about completing the task.

**Purpose:** Prevent developers from starting work on incomplete or unclear requirements.

**Who uses it:** Product Manager, QA, Business Analyst (BEFORE sprint planning)

**When it's checked:** During sprint planning or backlog refinement

---

## 📋 DOR Checklist Example

```
A User Story is READY for development when:

✅ CLARITY
├─ User story is clear and unambiguous
├─ Acceptance criteria are specific (not vague)
├─ Definition of "done" is documented
└─ No questions remain about what to build

✅ COMPLETENESS
├─ All dependencies identified
├─ All acceptance criteria listed
├─ All edge cases documented
└─ All edge cases documented

✅ TESTABILITY
├─ Acceptance criteria are testable
├─ Test scenarios identified
├─ Test data defined
└─ QA can write test cases

✅ FEASIBILITY
├─ Story is small enough to complete in sprint
├─ Story is not too complex
├─ No external blockers
└─ Dev team understands effort

✅ PRIORITY
├─ Story prioritized by business
├─ Urgency understood
├─ Value to customer clear
└─ Success metrics defined

✅ ATTACHED ARTIFACTS
├─ Wireframes/designs attached (if needed)
├─ Requirements documents linked
├─ Related bugs linked
├─ API documentation attached (if needed)
```

---

## 🎬 Real-Time Example 1: DOR in Action (Registration Feature)

### BEFORE DOR Check: User Story is NOT Ready

```
USER STORY (INCOMPLETE):
"As a user, I want to register on the platform so I can access features"

PROBLEMS (Story is NOT ready):
├─ ❌ Acceptance criteria are vague
│  └─ "register" could mean many things
│
├─ ❌ No test data specified
│  └─ What emails should we test? What passwords?
│
├─ ❌ Edge cases not mentioned
│  └─ What if email already exists? Weak password? Too long?
│
├─ ❌ Design not attached
│  └─ What should registration form look like?
│
├─ ❌ Dependencies unclear
│  └─ Does email verification work? Is it in scope?
│
└─ ❌ Acceptance criteria not testable
   └─ "Users can register" - how do we verify?
   
RESULT: Dev team asks 15 questions before starting work
TIME WASTED: 2-3 hours of discussions
RISK: Dev builds wrong thing
```

### AFTER DOR Check: User Story IS Ready

```
USER STORY (COMPLETE & READY):
"As a new user, I want to register with email and password so I can access 
the dashboard"

ACCEPTANCE CRITERIA (Clear & Specific):
├─ Acceptance Criteria 1:
│  ├─ Title: User can register with valid email and password
│  ├─ Given: User is on registration page
│  ├─ When: User enters email "test@example.com" and password "SecurePass123"
│  ├─ Then: Account created, user redirected to email verification page
│  └─ And: Confirmation email sent within 1 minute
│
├─ Acceptance Criteria 2:
│  ├─ Title: Weak passwords are rejected
│  ├─ Given: User on registration page
│  ├─ When: User enters password "pass" (only 4 chars)
│  ├─ Then: Error message shown: "Password must be 8+ characters"
│  └─ And: Form remains on registration page
│
├─ Acceptance Criteria 3:
│  ├─ Title: Duplicate emails are rejected
│  ├─ Given: Email "existing@example.com" already registered
│  ├─ When: User tries to register with "existing@example.com"
│  ├─ Then: Error message shown: "Email already registered"
│  └─ And: Link to login page provided
│
└─ Acceptance Criteria 4:
   ├─ Title: Required fields validated
   ├─ Given: User on registration page
   ├─ When: User leaves fields empty and clicks Register
   ├─ Then: Error messages show for empty fields
   └─ And: Account not created

TEST DATA PROVIDED:
├─ Valid emails: test@example.com, user+1@gmail.com
├─ Invalid emails: invalid@, user@, plainaddress
├─ Valid passwords: SecurePass123, MyPassword456
├─ Invalid passwords: pass (too short), 12345678 (no letters)
├─ Already registered emails: existing@example.com

EDGE CASES DOCUMENTED:
├─ Email with '+' character (Gmail aliases)
├─ Extremely long email (150+ characters)
├─ Case sensitivity in email (Test@Example.com vs test@example.com)
├─ SQL injection attempts in email field

DESIGN ATTACHED:
├─ Wireframe: registration-form-wireframe.png
├─ Form layout: 4 input fields (name, email, password, confirm)
├─ Error states: Error message styling.png

DEPENDENCIES IDENTIFIED:
├─ Email service: Sendgrid (already set up)
├─ Database: User table exists (migrations done)
├─ Authentication: JWT implementation ready
└─ Frontend: React components available

DEFINITION OF DONE REFERENCED:
├─ Code reviewed and merged
├─ All acceptance criteria passing
├─ Security review completed
├─ Performance acceptable
├─ Documentation updated
└─ Ready for QA testing

EFFORT ESTIMATION:
├─ Dev time: 8 hours (1 day)
├─ QA time: 4 hours
├─ Total: Fits in 1 sprint
└─ Complexity: Medium

RESULT: Dev team ready to start immediately
TIME SAVED: No clarification questions needed
RISK: Minimal - requirements are clear
```

---

## 🎯 What is DOD (Definition of Done)?

### Definition
**DOD (Definition of Done)** is a checklist that defines what a completed user story MUST have AFTER development/QA. It's about completion quality and readiness for production.

**Purpose:** Ensure every completed story meets quality standards before moving to production.

**Who uses it:** Dev team, QA team, Team lead (AFTER development)

**When it's checked:** During code review, QA testing, sprint completion

---

## 📋 DOD Checklist Example

```
A User Story is DONE when:

✅ DEVELOPMENT COMPLETE
├─ Code written and committed
├─ Code follows team standards
├─ Code reviewed by at least 1 peer
└─ Code merged to main branch

✅ QUALITY ASSURANCE
├─ All acceptance criteria verified working
├─ Manual testing completed
├─ Edge cases tested
├─ Error scenarios tested
└─ No critical/major bugs
└─ Tested in multiple browsers/devices

✅ AUTOMATION
├─ Unit tests written
├─ Unit tests passing (100% coverage)
├─ Integration tests passing
├─ End-to-end tests passing
└─ Test results documented

✅ SECURITY
├─ Security review completed
├─ No hardcoded credentials
├─ Input validation implemented
├─ SQL injection protection verified
└─ Secrets stored securely

✅ PERFORMANCE
├─ Page loads in < 2 seconds
├─ API response time acceptable
├─ No memory leaks
├─ Database queries optimized
└─ Performance tested under load

✅ DOCUMENTATION
├─ Code comments added
├─ API documentation updated
├─ User documentation updated
├─ Known issues documented
└─ Deployment notes added

✅ DEPLOYMENT READINESS
├─ Database migrations included
├─ Feature flag implemented (if needed)
├─ Rollback plan documented
├─ Monitoring/alerts configured
└─ Ready for production

✅ COMPLIANCE
├─ Accessibility standards met (WCAG)
├─ GDPR compliance checked
├─ Compliance requirements met
└─ Legal review completed (if needed)
```

---

## 🎬 Real-Time Example 2: DOD in Action (Registration Feature)

### AFTER Development: Checking DOD

```
USER STORY: "User registration with email and password"

CHECKING AGAINST DOD CHECKLIST:

1️⃣ DEVELOPMENT COMPLETE
   ✅ Code written in registration-service.js
   ✅ Follows team coding standards (linting passed)
   ✅ Code reviewed by Sarah (peer review approved)
   ✅ Merged to main branch commit: abc123def456

2️⃣ QUALITY ASSURANCE
   ✅ AC1 - Valid registration: PASS
   ✅ AC2 - Weak password rejection: PASS
   ✅ AC3 - Duplicate email rejection: PASS
   ✅ AC4 - Required field validation: PASS
   ✅ Edge case - Gmail + alias: PASS
   ✅ Edge case - Long email: PASS
   ✅ Error handling - Network timeout: PASS
   ✅ Tested in Chrome, Firefox, Safari: PASS
   ✅ Bug log: 0 critical, 0 major, 2 minor bugs
   
   Minor bugs (accepted for production):
   ├─ Error message font size slightly small (0.9rem)
   └─ Spacing between form fields could be tighter
   
   Decision: Acceptable for production

3️⃣ AUTOMATION
   ✅ Unit tests written: 24 test cases
   ✅ Unit test coverage: 95% code coverage
   ✅ All unit tests passing: ✓ PASS
   ✅ Integration tests written: 12 test cases
   ✅ Integration tests passing: ✓ PASS
   ✅ E2E tests written: 8 test scenarios
   ✅ E2E tests passing: ✓ PASS
   ✅ Test results: 44/44 passing

4️⃣ SECURITY
   ✅ Security review completed by InfoSec
   ✅ No hardcoded credentials found
   ✅ Input validation: Email regex, Password rules
   ✅ SQL injection protection: Parameterized queries used
   ✅ Password hashing: bcrypt with salt rounds = 12
   ✅ Secrets stored in: Environment variables
   ✅ OWASP Top 10 review: Passed

5️⃣ PERFORMANCE
   ✅ Page load time: 1.2 seconds (< 2 sec target)
   ✅ API response time: 450ms (acceptable)
   ✅ Memory profile: No leaks detected
   ✅ Database query: Properly indexed, < 100ms
   ✅ Load test (100 concurrent users): Passed
   └─ Response time under load: 800ms (acceptable)

6️⃣ DOCUMENTATION
   ✅ Code comments added:
      ├─ Complex validation logic: Documented
      └─ Email verification flow: Documented
   ✅ API documentation updated:
      ├─ POST /api/auth/register endpoint: Updated
      └─ Request/response examples: Added
   ✅ User documentation: Updated help center
   ✅ Known issues: None identified
   ✅ Deployment notes: 
      ├─ Database migration: add_users_table.sql
      └─ Feature flag: ENABLE_NEW_REGISTRATION

7️⃣ DEPLOYMENT READINESS
   ✅ Database migrations: Included (3 migration files)
   ✅ Feature flag: ENABLE_NEW_REGISTRATION (default: false)
   ✅ Rollback plan:
      ├─ If issues: Set ENABLE_NEW_REGISTRATION=false
      ├─ Data: Can be rolled back (new users will be deleted)
      └─ Estimated rollback time: 5 minutes
   ✅ Monitoring configured:
      ├─ Alert: Registration failures > 5%
      ├─ Alert: Response time > 1 second
      └─ Alert: Memory usage > 80%
   ✅ On-call support: Scheduled

8️⃣ COMPLIANCE
   ✅ Accessibility: WCAG 2.1 AA standard met
      ├─ Form labels present
      ├─ Error messages linked to fields
      └─ Keyboard navigation working
   ✅ GDPR compliance:
      ├─ User consent collected
      ├─ Privacy policy linked
      └─ Data retention policy: 3 years
   ✅ Terms & Conditions: Updated
   ✅ Legal review: Completed and approved

════════════════════════════════════════════════════════════════

FINAL RESULT: ✅ STORY IS DONE

All DOD checklist items: PASSED ✓
Ready for: Production Deployment
Deployment scheduled: Tomorrow 10:00 AM UTC
Deployed to: Staging → Canary → Production (gradual rollout)
```

---

## 📊 DOR vs. DOD Comparison

```
                    DOR                          DOD
                    (Definition of Ready)        (Definition of Done)
─────────────────────────────────────────────────────────────────────

WHEN                Before sprint                After development/QA
WHEN CHECKED        Sprint planning              Code review, QA testing
WHO CHECKS          Product Owner, QA           Dev Lead, QA Lead
PURPOSE             Ready to develop?            Ready for production?

FOCUSES ON:
├─ Requirements     ✓ Complete & clear           Implemented
├─ Design           ✓ Provided                   Used
├─ Dependencies     ✓ Identified                 Resolved
├─ Testing          ✓ Planned                    Executed
├─ Code             ✗ Not started                ✓ Written & reviewed
├─ Automation       ✗ Not started                ✓ Tests pass
├─ Security         ✓ Requirements analyzed      ✓ Security verified
├─ Performance      ✓ Estimated                  ✓ Measured
├─ Documentation    ✗ Requirements documented    ✓ Code & user docs

EXAMPLE:
├─ DOR: "User story has clear AC, design attached, 
│        QA knows how to test"
│
└─ DOD: "All AC passing, tests automated, 
         code reviewed, ready for production"
```

---

## 🎯 Real-Time Example 3: When DOR is NOT Met (Bad Story)

```
SPRINT PLANNING - Story Review:

Story: "Fix the dashboard"
Priority: High
Assigned to: Dev team

DOR CHECKLIST:
❌ Acceptance Criteria: Vague ("dashboard should work")
❌ Test scenarios: Not provided
❌ Design: Not attached
❌ Dependencies: Unknown (data service? APIs?)
❌ Effort: "Maybe 2-3 days?" (unclear)
❌ Test data: Not defined
❌ Edge cases: Not documented
❌ Success metrics: "Users will be happy"

TEAM REACTION:
Dev 1: "What does 'fix' mean? It already works for me."
Dev 2: "Do we need to change the backend?"
QA: "How will I know if it's fixed?"
PM: "Just make it faster"

RESULT: 
❌ STORY NOT ADDED TO SPRINT
Decision: "Refinement needed. Story goes back to backlog."

ACTION TAKEN:
Product Owner must:
├─ Define what "broken" actually means
├─ Specify exact changes needed
├─ Attach designs/mockups
├─ Write clear acceptance criteria
├─ Identify dependencies
└─ Story returns when DOR is met

TIME IMPACT: 
├─ Wasted: 30 minutes in sprint planning
├─ Delayed: Story moved to next sprint
└─ Prevention: DOR protects the team
```

---

## 🎯 Real-Time Example 4: When DOD is NOT Met (Incomplete Feature)

```
SPRINT REVIEW - Feature Completion Check:

Feature: "User can upload profile picture"
Developer: "It's done! Users can upload pictures"

DOD CHECKLIST:

✅ Development: Code written ✓
✅ Manual testing: Works on Chrome ✓
❌ Automated tests: Not written (skipped due to time)
❌ Edge cases: File size limit not tested
❌ Error handling: What if upload fails? Not handled
❌ Security: File type validation not implemented (anyone can upload .exe!)
❌ Performance: Large files cause page freeze
❌ Documentation: No code comments
❌ Accessibility: Alt text for uploaded images missing

RESULT: ❌ STORY IS NOT DONE

Issues found:
├─ Critical (security): No file type validation → Security risk!
├─ Major (functionality): Large files freeze page → Bad UX
├─ Major (quality): No error handling → Users confused on failure
└─ Minor (quality): No automated tests → Future regression risk

DECISION: Story returned to "In Progress"
Dev must:
├─ Add file type validation
├─ Implement file size limit
├─ Add error handling
├─ Write automated tests
├─ Fix performance issue
└─ Add accessibility

RESULT: Story NOT deployed to production
Impact: Delayed release by 1-2 days
Prevention: DOD ensures quality before deployment
```

---

## 💡 Key Insights

### DOR Prevents:
✅ Starting work on unclear requirements
✅ Developers asking endless questions
✅ Building the wrong thing
✅ Wasted development time
✅ Incomplete features

### DOD Prevents:
✅ Deploying buggy code
✅ Production security issues
✅ Poor user experience
✅ Technical debt accumulation
✅ Regression issues

### Together They Ensure:
✅ Requirements clear before development
✅ Quality high after development
✅ Production ready always
✅ Team efficiency maximized
✅ Continuous delivery possible

---

## 🎓 Interview Answer Ready

**Q: "What is DOR and DOD and why do they matter?"**

**Your Answer:**
"DOR (Definition of Ready) ensures requirements are READY for development. DOD (Definition of Done) ensures work is READY for production.

DOR is checked BEFORE sprint planning to prevent wasted time on unclear requirements. If a user story doesn't have clear acceptance criteria, attached designs, and identified dependencies, it's not ready and goes back to the product owner.

DOD is checked AFTER development to ensure quality. It includes code review, automated tests, security verification, performance testing, and documentation. A story isn't done until ALL DOD items are checked.

Together they ensure: clear requirements → good development → production-ready features.

A real example: If a story arrives without acceptance criteria (fails DOR), we send it back. If code is written but has no tests or security review (fails DOD), we don't deploy.

This prevents most production issues before they happen."

---

This gives you complete DOR and DOD knowledge for interviews! 🎯
