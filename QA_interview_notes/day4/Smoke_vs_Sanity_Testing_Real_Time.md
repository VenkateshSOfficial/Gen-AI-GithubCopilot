# Smoke vs Sanity Testing – Real-Time Examples 🎯

## The 30-Second Understanding

**SMOKE TESTING** = "Does the app even RUN?" (Basic functionality check)
**SANITY TESTING** = "Does the feature work as expected?" (Detailed functionality check)

---

## Quick Comparison

```
SMOKE TEST: "Is the app alive?"
├─ Can I log in?
├─ Can I navigate to main pages?
├─ Can I load the dashboard?
└─ If NO to any → STOP testing, deployment blocked

SANITY TEST: "Does the feature actually work?"
├─ Login works with valid credentials?
├─ Login fails with invalid credentials?
├─ Login remembers me works?
└─ All features in login work correctly?
```

---

## Real-Time Scenario: E-Commerce App Deployment

### Context:
You have an e-commerce app with payment processing. You're deploying version 2.5.2 to production.

---

## SMOKE TESTING 💨

### What is Smoke Testing?

**Definition:** The first level of testing after deployment. Quick checks to verify the application is in a testable state. If smoke tests fail, stop everything—don't proceed to further testing.

### Smoke Test Checklist (E-Commerce App):

```
✅ SMOKE TEST CHECKLIST (5-10 minutes max)
─────────────────────────────────────────

□ Application starts without crash
  └─ Open app URL in browser
  └─ Expected: Page loads without error

□ User can log in
  └─ Email: testuser@example.com
  └─ Password: TestPassword123!
  └─ Expected: User dashboard appears

□ User can view products list
  └─ Navigate to: Products/Women/Shoes
  └─ Expected: Product list shows with images

□ User can add item to cart
  └─ Click on first product
  └─ Click "Add to Cart"
  └─ Expected: Cart count shows "1"

□ User can proceed to checkout
  └─ Click "Checkout" button
  └─ Expected: Checkout page loads

□ Payment form appears
  └─ On checkout page
  └─ Expected: Credit card fields visible

□ User can place order (without actual payment)
  └─ Fill payment details
  └─ Click "Place Order"
  └─ Expected: Order confirmation page

□ User can log out
  └─ Click "Logout"
  └─ Expected: Login page appears

RESULT:
✓ All checks passed → SMOKE PASSED ✓
  "Application is testable, proceed to detailed testing"

✗ Any check failed → SMOKE FAILED ✗
  "Stop! Don't test further, report critical issue"
```

### Smoke Test Example Execution:

```
TEST: Add to Cart - Smoke Test
──────────────────────────────

STEP 1: Navigate to product page
└─ URL: www.example.com/products/women/shoes
└─ Expected: Product page loads

STEP 2: Click product
└─ Click: First product (Nike Air Max)
└─ Expected: Product details load

STEP 3: Add to cart
└─ Click: "Add to Cart" button
└─ Expected: Button shows "Added to Cart" ✓

STEP 4: Verify cart updated
└─ Check: Cart icon
└─ Expected: Shows "1" item

RESULT: ✓ PASS - Basic functionality works

This is SMOKE TESTING:
• Quick check (< 1 minute)
• Only core path
• Doesn't test edge cases
• Doesn't test error handling
• Goal: Is feature even accessible?
```

### When Smoke Tests Fail:

```
SCENARIO: Smoke Test Fails
──────────────────────────

TEST: User can add item to cart
└─ Action: Click "Add to Cart"
└─ Expected: Cart updates
└─ Actual: 500 Internal Server Error ✗

SMOKE TEST FAILED!

IMPLICATIONS:
❌ Payment feature completely broken
❌ Entire checkout broken
❌ Cannot proceed with testing
❌ Cannot release to production

ACTION:
1. Stop all testing immediately
2. Report as P0 (critical blocker)
3. Rollback deployment or fix bug
4. Re-test smoke tests
5. Only after smoke passes → detailed testing
```

### Smoke Test Purpose:

```
GOAL: Verify application is deployable

Questions Answered:
✓ Did deployment succeed?
✓ Can users log in?
✓ Can users access main features?
✓ Is the app in working state?

NOT Answered:
✗ Does login work for all user types?
✗ Does cart calculate price correctly?
✗ What about invalid inputs?
✗ What about edge cases?
```

---

## SANITY TESTING 🧪

### What is Sanity Testing?

**Definition:** Detailed testing of a specific feature to verify it works as designed. Tests both happy path AND error scenarios.

### Sanity Test Checklist (Login Feature Only):

```
✅ SANITY TEST CHECKLIST - LOGIN FEATURE (30-45 minutes)
─────────────────────────────────────────────────────────

VALID CREDENTIALS TESTS:
├─ Standard email + password
│  ├─ Email: testuser@example.com
│  ├─ Password: TestPassword123!
│  └─ Expected: Login successful, dashboard loads
│
├─ Email with special characters (+)
│  ├─ Email: test+qa@example.com
│  ├─ Password: Password123!
│  └─ Expected: Login successful
│
├─ Email variations (uppercase, mixed case)
│  ├─ Email: TestUser@example.com (uppercase)
│  ├─ Expected: Login successful (email lowercase handled)
│
├─ Valid but rarely used password
│  ├─ Password: P@ss#Word$2026!
│  ├─ Special chars: @#$%^&*
│  └─ Expected: Login successful
│
└─ Long email address (80+ characters)
   └─ Expected: Login successful (within limits)

INVALID CREDENTIALS TESTS:
├─ Wrong password
│  ├─ Email: testuser@example.com
│  ├─ Password: WrongPassword123!
│  └─ Expected: Error "Invalid credentials"
│
├─ Email doesn't exist
│  ├─ Email: nonexistent@example.com
│  ├─ Password: ValidPassword123!
│  └─ Expected: Error "User not found"
│
├─ Empty email field
│  ├─ Email: [blank]
│  ├─ Password: ValidPassword123!
│  └─ Expected: Validation error "Email required"
│
├─ Empty password field
│  ├─ Email: testuser@example.com
│  ├─ Password: [blank]
│  └─ Expected: Validation error "Password required"
│
└─ Both empty
   ├─ Email: [blank]
   ├─ Password: [blank]
   └─ Expected: Validation errors appear

EDGE CASES:
├─ SQL injection attempt
│  ├─ Email: admin' OR '1'='1
│  └─ Expected: Safe error, no SQL injection
│
├─ Very long password (1000+ chars)
│  └─ Expected: Either accepted or max-length error
│
├─ Account locked (after 3 failures)
│  ├─ Action: Wrong password 3 times
│  └─ Expected: "Account locked, contact support"
│
├─ Account deactivated
│  ├─ Email: deactivated-user@example.com
│  └─ Expected: "Account deactivated"
│
└─ HTTPS validation
   └─ Expected: Secure connection (padlock icon)

FLOW VALIDATION:
├─ "Remember Me" checkbox works
│  └─ Expected: Credentials saved securely
│
├─ "Forgot Password" link works
│  └─ Expected: Password reset flow initiates
│
├─ Password visibility toggle
│  └─ Expected: Password shows/hides on click
│
└─ Session timeout
   └─ Expected: User logged out after 30 mins inactivity

PERFORMANCE:
├─ Login completes in < 2 seconds
│  └─ Expected: Response time acceptable
│
└─ Multiple simultaneous logins
   └─ Expected: Each session unique

RESULTS VERIFICATION:
├─ User session created
│  └─ Database: session record exists
│
├─ User permissions loaded
│  └─ User role set correctly (admin/user/guest)
│
└─ Session cookie secure
   └─ Cookie: HttpOnly, Secure flags set
```

### Sanity Test Example Execution:

```
TEST: Login with valid credentials – Sanity Test
──────────────────────────────────────────────────

STEP 1: Navigate to login page
└─ URL: www.example.com/login
└─ Expected: Login form visible

STEP 2: Enter email
└─ Field: Email
└─ Value: testuser@example.com
└─ Expected: Value entered successfully

STEP 3: Enter password
└─ Field: Password
└─ Value: TestPassword123!
└─ Expected: Dots/asterisks shown (password hidden)

STEP 4: Verify password visibility toggle
└─ Click: Eye icon
└─ Expected: Password shows as plain text
└─ Click: Eye icon again
└─ Expected: Password hidden again ✓

STEP 5: Click Login
└─ Click: "Login" button
└─ Expected: Loading spinner appears

STEP 6: Verify dashboard loads
└─ Expected: Dashboard page loads (< 2 seconds)
└─ Expected: User name displayed
└─ Expected: Navigation menu visible

STEP 7: Verify session created
└─ Check: Browser cookies
└─ Expected: session_id cookie exists
└─ Expected: Cookie has HttpOnly flag

STEP 8: Test remember me
├─ Clear cookies
├─ Log out
├─ Return to login page
├─ Expected: Email field populated (if Remember Me checked)

RESULT: ✓ PASS - All login scenarios work correctly

This is SANITY TESTING:
• Detailed check (30-45 minutes)
• Tests happy path + error paths
• Tests edge cases
• Tests error handling
• Tests security
• Goal: Feature works completely as designed
```

### Sanity Test Example: Invalid Input

```
TEST: Login with wrong password – Sanity Test
──────────────────────────────────────────────

STEP 1: Navigate to login page
└─ URL: www.example.com/login
└─ Expected: Login form visible

STEP 2: Enter email
└─ Value: testuser@example.com
└─ Expected: Email entered

STEP 3: Enter wrong password
└─ Value: WrongPassword123!
└─ Expected: Password entered

STEP 4: Click Login
└─ Click: "Login" button
└─ Expected: Attempt made

STEP 5: Verify error message
└─ Expected: "Invalid email or password"
└─ Expected: Error is specific (not generic)
└─ Expected: No personal info leaked (e.g., "email exists")

STEP 6: Verify session NOT created
└─ Check: No session cookie set
└─ Check: Not redirected to dashboard
└─ Check: Still on login page

STEP 7: Verify retry possible
└─ Action: Enter correct password
└─ Expected: Login succeeds this time

RESULT: ✓ PASS - Error handling works correctly
```

---

## Smoke vs Sanity Comparison

```
┌──────────────────────────────────────────────────────┐
│ SMOKE TESTING                                        │
├──────────────────────────────────────────────────────┤
│ PURPOSE:       Verify app is deployable              │
│ SCOPE:         High-level, basic functionality       │
│ DEPTH:         Shallow (happy path only)             │
│ TIME:          5-15 minutes                          │
│ FOCUS:         "Does it work at all?"                │
│ WHEN:          Right after deployment                │
│ WHO:           QA, DevOps                            │
│ TEST CASES:    10-20 basic scenarios                 │
│ ERROR TESTING: Minimal                               │
│ EDGE CASES:    None                                  │
│ PRECONDITION:  Fresh deployment                      │
│                                                      │
│ RESULTS:                                             │
│ ✓ PASS:  Proceed to detailed testing                 │
│ ✗ FAIL:  STOP! Rollback or fix critical issue        │
│                                                      │
│ QUESTIONS ANSWERED:                                  │
│ • Can users log in?                                  │
│ • Are main pages accessible?                         │
│ • Does core path work?                               │
│ • Is app in testable state?                          │
└──────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────┐
│ SANITY TESTING                                       │
├──────────────────────────────────────────────────────┤
│ PURPOSE:       Verify feature works completely       │
│ SCOPE:         Feature-specific, comprehensive       │
│ DEPTH:         Deep (happy path + errors + edges)    │
│ TIME:          30-60 minutes per feature             │
│ FOCUS:         "Does it work as designed?"           │
│ WHEN:          After smoke tests pass                │
│ WHO:           QA specialized in feature             │
│ TEST CASES:    50-100+ detailed scenarios            │
│ ERROR TESTING: Comprehensive                         │
│ EDGE CASES:    Multiple scenarios                    │
│ PRECONDITION:  App is in working state               │
│                                                      │
│ RESULTS:                                             │
│ ✓ PASS:  Feature ready for regression testing        │
│ ✗ FAIL:  Feature needs fixes before release          │
│                                                      │
│ QUESTIONS ANSWERED:                                  │
│ • Does feature work with valid input?                │
│ • Does it handle invalid input?                      │
│ • Does it handle edge cases?                         │
│ • Is error handling correct?                         │
│ • Are all acceptance criteria met?                   │
└──────────────────────────────────────────────────────┘
```

---

## Real Deployment Workflow

```
DEPLOYMENT DAY: Version 2.5.2
════════════════════════════════════════════════════════════

8:00 AM - DEPLOYMENT COMPLETE
├─ Code deployed to production
├─ Servers started
└─ Version 2.5.2 running

8:15 AM - SMOKE TESTING (15 minutes)
├─ QA: Can I log in?                           ✓
├─ QA: Can I access dashboard?                 ✓
├─ QA: Can I add item to cart?                 ✓
├─ QA: Can I proceed to checkout?              ✓
├─ QA: Can I see payment form?                 ✓
├─ All smoke tests pass                        ✓
└─ Decision: PROCEED with detailed testing

8:30 AM - SANITY TESTING (1-2 hours per feature)
├─ QA Team 1: Test Login feature
│  ├─ Valid credentials: 5 tests ✓
│  ├─ Invalid credentials: 5 tests ✓
│  ├─ Edge cases: 10 tests ✓
│  └─ Result: Login feature PASSED ✓
│
├─ QA Team 2: Test Payment feature
│  ├─ Authorize transaction: 5 tests ✓
│  ├─ Capture transaction: 5 tests ✓
│  ├─ Refund transaction: 5 tests ✓
│  ├─ Error scenarios: 5 tests ✓
│  └─ Result: Payment feature PASSED ✓
│
└─ QA Team 3: Test Checkout flow
   ├─ Normal checkout: 5 tests ✓
   ├─ With coupon: 5 tests ✓
   ├─ International customer: 3 tests ✓
   ├─ Error handling: 5 tests ✓
   └─ Result: Checkout PASSED ✓

10:30 AM - REGRESSION TESTING (if time permits)
├─ Run full test suite for critical paths
├─ Verify no regressions from v2.5.1
└─ Document any issues

11:00 AM - SIGN-OFF
├─ All tests passed
├─ No critical issues found
├─ Feature ready for customers
└─ Release communication sent

DEPLOYMENT SUCCESSFUL! ✓
```

---

## What Happens If Smoke Test Fails

```
SCENARIO: Smoke test fails during checkout
────────────────────────────────────────────

8:15 AM: Smoke Testing
├─ QA: Can I add item to cart?                 ✓
├─ QA: Can I proceed to checkout?              ✓
├─ QA: Can I see payment form?                 ✗ ERROR
│
│ Error: "500 Internal Server Error"
│ Action: Try again - Same error
│ Conclusion: Payment feature broken!

SMOKE TEST FAILED!
╚═ STOP ALL TESTING IMMEDIATELY

8:16 AM: Critical Response
├─ Notify: Dev lead, Product owner, CTO
├─ Decision: ROLLBACK to v2.5.1
├─ Action: Deployment rolled back (5 min)
├─ New status: Production running v2.5.1 ✓
│
├─ Debug: Dev team investigates
├─ Fix: Bug fixed in v2.5.3
├─ Schedule: Re-deploy tomorrow (after QA sign-off)
│
└─ Lesson: Smoke tests caught critical issue BEFORE customers!

RESULT: 
✓ No customer impact
✓ Issue caught early
✓ Avoided production outage
```

---

## Interview Answer 🎤

### Question: "What's the difference between Smoke and Sanity Testing?"

**GOOD ANSWER:**
"Smoke testing is the first quick check after deployment—we verify the application is in a basic working state. We check if you can log in, access main pages, and perform core functions. It takes 5-15 minutes and is like checking if the engine starts before driving the car.

Sanity testing is a detailed check of a specific feature after smoke tests pass. We verify the feature works completely with valid inputs, invalid inputs, edge cases, and error scenarios. It takes 30-60 minutes per feature and is like test-driving the car to verify it works properly.

For example, after deployment:
• Smoke test: 'Can I log in?' → If yes, proceed. If no, stop everything.
• Sanity test: 'Does login work with all email formats, passwords, remember-me option, lockout after failures, password reset,' etc.?

If smoke tests fail, we don't proceed to sanity testing—we rollback the deployment. If sanity tests fail, we fix the feature before release."

---

## Quick Reference

```
SMOKE TESTING:
├─ When: Right after deployment
├─ Time: 5-15 minutes
├─ Scope: Basic functionality only
├─ Question: "Is app alive?"
└─ Result: Pass = Proceed | Fail = Stop/Rollback

SANITY TESTING:
├─ When: After smoke tests pass
├─ Time: 30-60 minutes per feature
├─ Scope: Complete feature validation
├─ Question: "Does feature work as designed?"
└─ Result: Pass = Release-ready | Fail = Fix feature

KEY DIFFERENCE:
Smoke = Shallow broad check (app works at all)
Sanity = Deep specific check (feature works completely)
```

---

Remember: **Smoke tests catch critical failures. Sanity tests catch quality issues.** Both are essential! 🎯
