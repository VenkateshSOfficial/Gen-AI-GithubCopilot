# Practice Exercises & Solutions 🎯

## Exercise Set 1: Priority vs Severity Classification

### Exercise 1.1: Classify These Bugs

**Scenario:** You're a QA for a banking app. Classify each bug:

#### Bug 1: "Charts show incorrect bar colors"
```
Environment: Banking Dashboard, Chrome, v2.5.1

Chart bars should be:
- Green for gains
- Red for losses

Actual: All bars showing blue

Impact: Users can still read chart correctly, just different colors
```

**Your Classification:**
- Severity: _________
- Priority: _________
- Reasoning: _________

**Answer Key:**
```
Severity: LOW
  Reason: Cosmetic issue, no functionality broken
  
Priority: MINOR or TRIVIAL
  Reason: Purely visual, doesn't affect understanding
  
Why Low/Low:
- Users still understand the data
- Not affecting business operations
- Can wait for next sprint
```

---

#### Bug 2: "Users with specific email domain can't complete payment"
```
Environment: Production checkout, affected domain: company.co.uk

Steps:
1. User tries to checkout with company.co.uk email
2. Payment form validates email
3. "Invalid email" error appears (incorrect!)

Impact: All company.co.uk employees can't purchase
Frequency: 100% reproducible for this domain
Estimated affected users: 500+
```

**Your Classification:**
- Severity: _________
- Priority: _________
- Reasoning: _________

**Answer Key:**
```
Severity: CRITICAL
  Reason: Core feature (payment) completely broken for users
  
Priority: BLOCKER or CRITICAL
  Reason: Affects 500+ users, losing revenue right now
  
Why Critical/Blocker:
- Primary payment feature broken
- Affects significant user segment
- Losing transactions every minute
- Must fix immediately
```

---

#### Bug 3: "Admin can export user data as CSV but file truncates after 5000 rows"
```
Environment: Admin panel, v2.5.1

Steps:
1. Admin clicks "Export Users"
2. Selects all 50,000 users
3. File downloads
4. Opens CSV, only 5000 rows visible

Impact: 
- Admins see incomplete data
- Workaround: Export in batches (annoying but works)
- Only admins affected (not customers)
- Affects reporting, not revenue
```

**Your Classification:**
- Severity: _________
- Priority: _________
- Reasoning: _________

**Answer Key:**
```
Severity: MAJOR
  Reason: Feature doesn't work correctly, data incomplete
  
Priority: MAJOR
  Reason: Affects workflow, but workaround exists, not critical path
  
Why Major/Major:
- Feature broken but not completely (has workaround)
- Only affects backend team (admins)
- Doesn't affect customers or revenue
- Can wait until next sprint
```

---

#### Bug 4: "Help center link is broken"
```
Environment: Any page, any browser, v2.5.1

Steps:
1. Click "Help" link in footer
2. Expected: Help center page opens
3. Actual: 404 Not Found error

Impact:
- Help not accessible
- But users can search knowledge base instead
- Workaround: Direct URL still works
```

**Your Classification:**
- Severity: _________
- Priority: _________
- Reasoning: _________

**Answer Key:**
```
Severity: LOW
  Reason: Navigation broken, but workaround exists
  
Priority: MINOR
  Reason: Affects user experience slightly, but workaround available
  
Why Low/Minor:
- Help still accessible through workaround
- Not revenue affecting
- Not blocking functionality
- Can fix whenever time allows
```

---

### Exercise 1.2: Priority Mismatch Detection

**Scenario:** Product Manager marked 3 bugs with different priority/severity combinations. Are they correct?

#### Case 1: "Typo in terms of service"
```
Marked as:
- Severity: CRITICAL
- Priority: CRITICAL

Is this correct? _________
What should it be? _________
Explain: _________
```

**Answer:**
```
NOT correct

Should be:
- Severity: LOW
- Priority: MINOR

Why:
- Spelling doesn't break functionality (low severity)
- Terms of service rarely read carefully (low priority)
- Unless legal issue, this is cosmetic
- Marked too high!
```

---

#### Case 2: "Payment gateway timeout on busy hours"
```
Marked as:
- Severity: MAJOR
- Priority: MAJOR

Is this correct? _________
What should it be? _________
Explain: _________
```

**Answer:**
```
Possibly correct, but could be CRITICAL priority

Should be:
- Severity: MAJOR (feature somewhat broken)
- Priority: CRITICAL (losing revenue right now)

Why:
- Core functionality affected (payment)
- Happens during peak business hours
- Every second = lost transactions
- Could argue BLOCKER priority
- User marked correctly as MAJOR but might be higher
```

---

### Exercise 1.3: Real Interview Question

**Question:** "We have a bug marked 'Critical Severity, Minor Priority.' Can that happen and what would be an example?"

**Your Answer:** (2-3 minutes)
```
_____________________________________________________________________
_____________________________________________________________________
_____________________________________________________________________
```

**Model Answer:**
```
"Yes, that's absolutely possible. Severity and Priority are independent.

Example: An admin-only feature crashes when processing large datasets 
(say 50,000+ records). That's CRITICAL severity because the application 
crashes completely. But it could be MINOR priority because:

1. Only 0.5% of users have access to that feature (admins)
2. A workaround exists - process smaller datasets in batches
3. Doesn't affect revenue or customer-facing operations
4. Can be scheduled for the next sprint

The key insight is that not all technical severity translates to 
business urgency. We need to consider the impact scope when setting priority."
```

---

## Exercise Set 2: DOR & DOD Gates

### Exercise 2.1: Is the Story Ready? (DOR Check)

**Story:** "Implement Two-Factor Authentication (2FA)"

```
Current State:
├─ Requirements: "Add 2FA to login"
├─ Design: Not started yet
├─ Acceptance Criteria: None written
├─ QA Test Plan: "We'll figure it out during testing"
└─ Dependencies: None identified

QUESTIONS:
1. Is this story READY to start? YES or NO?
   _________

2. What's missing for DOR to be met?
   _________

3. What will happen if we start with incomplete DOR?
   _________
```

**Answer:**
```
1. NO - Not ready

2. Missing:
   - Design mockups for 2FA flow
   - Detailed requirements (SMS? Email? Authenticator app?)
   - Acceptance criteria (success/failure scenarios)
   - QA test plan (security, UX, error cases)
   - Security requirements documented

3. If we start:
   - Dev and QA ask conflicting questions
   - Rework mid-sprint
   - Developer makes assumptions
   - Test coverage incomplete
   - Missed security considerations
   - Schedule slips
```

---

### Exercise 2.2: Is the Story Done? (DOD Check)

**Story:** "Implement Two-Factor Authentication (2FA)" - Status: "Dev says it's complete"

```
Current State:
├─ Code written and compiles ✓
├─ Developer unit tested it ✓
├─ Code review completed ✓
├─ QA testing: Not started yet
├─ Documentation: Empty
├─ Deployment plan: "We'll deploy Monday"
└─ Rollback plan: None

QUESTIONS:
1. Is this story DONE? YES or NO?
   _________

2. What's missing for DOD to be met?
   _________

3. What could happen if we release with incomplete DOD?
   _________
```

**Answer:**
```
1. NO - Not done

2. Missing:
   - QA testing (not executed at all!)
   - Acceptance criteria verification (not verified)
   - Documentation (API docs, deployment guide, runbook)
   - Integration testing (2FA with other systems)
   - Security review (authentication mechanisms)
   - Deployment procedures documented
   - Rollback procedures in case of issues

3. If we release:
   - Security vulnerabilities go to production
   - 2FA might not work in production environment
   - Users affected, customer support overloaded
   - If issues, no rollback plan
   - Team doesn't know how to deploy
   - Other systems might break due to 2FA changes
   - DISASTER!
```

---

### Exercise 2.3: DOR & DOD in Real Scenarios

**Scenario:** Your team is working on payment processing optimization.

**Story in Progress:**
```
Status: Dev just started
├─ Code: 30% complete
├─ Design: Approved ✓
├─ Requirements: Written, some ambiguity
├─ QA: Waiting for dev to finish
└─ PM: Wants feature in this sprint
```

**Question:** Can QA start test planning now?

**Your Answer:**
```
_____________________________________________________________________
_____________________________________________________________________
_____________________________________________________________________
```

**Model Answer:**
```
"Yes, QA should start test planning NOW, even though dev isn't done.

Why:
- Design is approved, so QA knows the flow
- Requirements written (even if some ambiguity remains)
- QA can draft test cases based on what's clear
- QA can raise ambiguity questions early

What QA should do:
1. Review requirements and design with PM
2. Create draft test cases
3. Create RTM (requirement traceability)
4. Prepare test data
5. Flag ambiguities to clarify

This prevents the common mistake of QA waiting until dev is done,
then asking 'What do I test?' 2 days before release."
```

---

## Exercise Set 3: Smoke vs Sanity Testing

### Exercise 3.1: Create Test Checklists

**Scenario:** New "Wishlist" feature deployed to production

#### Smoke Test Checklist (Fill in the blanks)

```
SMOKE TEST: Wishlist Feature (Target: 10 minutes)

□ ___________________ (Can I access wishlist page?)
□ Can I add item to wishlist?
□ ___________________ (Can I see items in wishlist?)
□ Can I remove item from wishlist?
□ ___________________ (Does checkout still work with wishlist?)
□ ___________________ (App doesn't crash?)

RESULT: All ✓ = PASS (proceed to sanity)
RESULT: Any ✗ = FAIL (stop testing, investigate)
```

**Answer:**
```
□ Can I navigate to wishlist page?
□ Can I add item to wishlist?
□ Does wishlist count update?
□ Can I remove item from wishlist?
□ Does app stay stable overall?
□ Are there any crashes or errors?

All basic questions answered:
- Is the feature accessible?
- Do core actions work?
- Is the app stable?
```

---

#### Sanity Test Checklist (Your turn to create)

```
SANITY TEST: Wishlist Feature (Target: 60 minutes)

VALID SCENARIOS:
□ ___________________ (Add single item)
□ ___________________ (Add multiple items)
□ ___________________ (Add duplicate item)
□ ___________________ (Remove item)
□ ___________________ (Clear all wishlist)

INVALID SCENARIOS:
□ ___________________ (Try to add item without login)
□ ___________________ (Remove item that doesn't exist)
□ ___________________ (Very long wishlist 1000+ items)

EDGE CASES:
□ ___________________ (Session timeout while viewing wishlist)
□ ___________________ (Switch browsers while wishlist open)
□ ___________________ (Mobile responsiveness)

INTEGRATION:
□ ___________________ (Move wishlist item to cart)
□ ___________________ (Wishlist persists across sessions)

PERFORMANCE:
□ ___________________ (Wishlist loads within 2 seconds)
□ ___________________ (No lag when adding items)

RESULT: All ✓ = PASS (ready for regression)
RESULT: Any ✗ = FAIL (feature needs fixes)
```

---

### Exercise 3.2: When to Stop Testing

**Scenario:** After deployment, you run smoke tests and find this:

```
SMOKE TEST RESULT:
├─ Navigate to wishlist: ✓ PASS
├─ Add item: ✓ PASS
├─ View wishlist: ✓ PASS
├─ Remove item: ✗ FAIL - 500 Error
├─ Checkout: Can't test, depends on remove working
```

**Questions:**
1. Should you proceed to Sanity Testing?
   _________

2. What should you do?
   _________

3. Who should be notified?
   _________

**Answer:**
```
1. NO - Smoke test FAILED

2. Actions:
   - STOP all further testing immediately
   - Investigate the 500 error
   - Report as P0 / Critical
   - Consider rollback if critical
   - Dev team needs to fix ASAP

3. Notify:
   - Dev lead
   - Product manager
   - DevOps (potential rollback)
   - Project manager (delays testing)
```

---

## Exercise Set 4: Writing Bug Reports

### Exercise 4.1: Fix the Bad Bug Report

**Original (Poor) Bug Report:**

```
Title: "Login broken"

Description: "The login doesn't work. It's really bad. 
I've tried to log in multiple times and it keeps failing. 
Please fix this ASAP. It's urgent!"

Priority: BLOCKER
Severity: CRITICAL

Attachments: None
```

**Your Task:** Rewrite this as a professional bug report

```
REWRITTEN BUG REPORT:

Title: ________________________________________________________________

Environment: 
├─ Browser: ___________
├─ OS: ___________
├─ Version: ___________
└─ Time: ___________

Preconditions:
├─ _________________________________________________________________
└─ _________________________________________________________________

Steps to Reproduce:
1. _________________________________________________________________
2. _________________________________________________________________
3. _________________________________________________________________

Expected Result:
_____________________________________________________________________

Actual Result:
_____________________________________________________________________

Evidence:
└─ _________________________________________________________________

Frequency:
□ Always  □ Intermittent  □ Rare
└─ Details: ___________

Severity: _________ (Explain: ______________________)
Priority: _________ (Explain: ______________________)

Business Impact:
_____________________________________________________________________
```

**Model Answer:**
```
Title: "Login fails with 'Invalid credentials' error for valid email"

Environment:
├─ Browser: Chrome 120.0
├─ OS: Windows 11
├─ Version: v2.5.2
└─ Time: 2026-02-01 14:30 PST

Preconditions:
├─ User has active account (testuser@example.com)
└─ Password: Correct (verified in database: hash matches)

Steps to Reproduce:
1. Navigate to https://example.com/login
2. Enter email: testuser@example.com
3. Enter password: ValidPassword123!
4. Click "Login" button
5. Wait for response

Expected Result:
- User authenticated successfully
- Redirected to dashboard
- User name displayed in top right
- Login success message (optional)

Actual Result:
- Error message: "Invalid email or password"
- User remains on login page
- Not authenticated
- Happens 100% of the time

Evidence:
- Screenshot: login-error.png (shows error message)
- Video: login-failed.mp4 (10 seconds, shows full flow)
- Network log: Shows 401 response from /api/login

Frequency:
✓ Always (100% reproducible)

Severity: CRITICAL
(Core authentication feature completely broken for affected users)

Priority: BLOCKER / CRITICAL
(Payment users can't access system, losing revenue every minute)

Business Impact:
- All users attempting login failing
- Cannot access platform
- Revenue impact: Estimated $X per minute
- Customer support overload expected
- Potential reputational damage
```

---

### Exercise 4.2: Classify These Bug Reports

**Report 1: "Submit button doesn't work"**

Can you write this professionally?

```
Original (Bad):
"The submit button on the form is broken. When I click it nothing happens. 
Fix please!"

Rewritten (Professional):
Title: __________________________________________________________________
Severity: _________ Priority: _________
Steps: __________________________________________________________________
Expected: _______________________________________________________________
Actual: __________________________________________________________________
Impact: __________________________________________________________________
```

---

## Exercise Set 5: Real Interview Scenarios

### Scenario 5.1: The Urgent Bug

**You receive this message from Product Manager:**

```
"OMG! Our customers are complaining that payment processing 
is down! This is critical! What's your priority/severity? 
Fix immediately!"
```

**Your Response:**
```
_____________________________________________________________________
_____________________________________________________________________
_____________________________________________________________________
```

**Good Response:**
```
"I'll classify this as:

Severity: CRITICAL (core payment feature completely broken)
Priority: BLOCKER (affects 100% of transactions, revenue at risk)

Immediate Actions:
1. Stop regression testing
2. Create detailed bug report with evidence
3. Notify dev team for P0 investigation
4. Check if rollback needed
5. Monitor production closely
6. Prepare customer communication

This needs emergency response - I'll coordinate with DevOps 
for potential rollback if needed."
```

---

### Scenario 5.2: The Priority Debate

**Developer says:** "This bug is low priority, I'll fix it in the next sprint"

**You found:** Users can't export reports larger than 1GB, but 99% of reports are < 100MB

**What do you say?**

```
_____________________________________________________________________
_____________________________________________________________________
_____________________________________________________________________
```

**Good Response:**
```
"I'd propose we classify it as:

Severity: MEDIUM (Export works but fails for large datasets)
Priority: MINOR or MAJOR (depends on usage)

Since 99% of reports are small enough, most users won't hit this.
It's good to fix in this sprint IF we have time after critical items,
but backlog is acceptable if we're stretched.

However, we should:
1. Document the limitation for users
2. Add warning message for large exports
3. Suggest workaround (smaller time windows)
4. Track how many users actually hit this limit
5. Prioritize in future sprints if it grows

This way users aren't surprised and we make informed prioritization."
```

---

### Scenario 5.3: The Quick Question

**Interviewer:** "Give me an example of when Smoke Test would fail but Sanity Test would pass"

**Your Answer:**
```
_____________________________________________________________________
_____________________________________________________________________
_____________________________________________________________________
```

**Good Answer:**
```
"That's actually rare because if smoke fails, we usually don't proceed to sanity.

But the concept exists: If a DIFFERENT feature's smoke test fails while the 
feature we're testing has passing smoke tests, then we DO proceed to sanity 
testing for our feature.

Better example: A smoke test might fail on a rarely-used path but pass on 
the main path. If we're only testing the main path in smoke, then sanity 
tests on that main path would pass. The rarely-used path would fail later 
in sanity testing.

The key is that smoke tests aren't comprehensive - they hit the happy path. 
Sanity tests hit edge cases and errors that smoke tests might miss."
```

---

## 🎯 Self-Assessment

After completing these exercises, rate yourself:

```
PRIORITY vs SEVERITY:
Rating: 1=Not confident, 5=Very confident
Can classify bugs correctly: [ ] 1 [ ] 2 [ ] 3 [ ] 4 [ ] 5

DOR vs DOD:
Can explain when stories are ready/done: [ ] 1 [ ] 2 [ ] 3 [ ] 4 [ ] 5

SMOKE vs SANITY:
Can design test checklists: [ ] 1 [ ] 2 [ ] 3 [ ] 4 [ ] 5

BUG REPORTS:
Can write professional reports: [ ] 1 [ ] 2 [ ] 3 [ ] 4 [ ] 5

INTERVIEW READINESS:
Overall confidence level: [ ] 1 [ ] 2 [ ] 3 [ ] 4 [ ] 5
```

**If all scores are 4+: You're interview ready! 🚀**
**If any score is < 3: Review that section again**

---

## Next Practice Steps

1. **Tomorrow:** Create real examples from your projects
2. **This week:** Do mock interviews using these scenarios
3. **Before interview:** Practice explaining out loud
4. **During interview:** Remember these frameworks

---

You've now got real practice material! Go master this! 💪
