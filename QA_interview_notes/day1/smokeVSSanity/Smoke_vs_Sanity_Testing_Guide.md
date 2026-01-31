# Smoke vs. Sanity Testing: Complete Guide with Real Examples

## 🎯 Quick Answer

| Aspect | Smoke Testing | Sanity Testing |
|--------|---------------|----------------|
| **When** | After build deployment (NEW version) | After specific bug FIX (same version) |
| **What** | Test CRITICAL paths only | Test SPECIFIC affected feature |
| **Scope** | Broad (all main features) | Narrow (one area) |
| **Goal** | "Is the build stable enough for full testing?" | "Did the fix work?" |
| **Time** | 30 minutes - 2 hours | 5-15 minutes |
| **Example** | After PKCS12 migration deploy → Test all 4 transaction types work | After race condition fix → Test concurrent transactions work |
| **Pass = ?** | "Go ahead with full testing" | "Bug is fixed, move on" |

---

## 📊 Side-by-Side Comparison

```
SMOKE TESTING                          SANITY TESTING
═══════════════════════════════════    ═════════════════════════════════════

TIMING:                                TIMING:
After new build/deployment             After bug fix applied
"Fresh code just deployed"             "Dev says they fixed the bug"

PURPOSE:                               PURPOSE:
Ensure build is stable enough          Ensure specific bug is fixed
for full testing to begin              and not broken again

SCOPE:                                 SCOPE:
Broad - test all critical paths        Narrow - test only affected area
"Does EVERYTHING critical work?"       "Does THIS specific feature work?"

EXAMPLE SCENARIO:                      EXAMPLE SCENARIO:
PKCS12 migration deployed              Race condition in concurrent
to production                          transactions was fixed

SMOKE TESTS:                           SANITY TESTS:
✓ Void transaction works               ✓ Run 50 concurrent void trans
✓ Refund transaction works             ✓ Verify all 50 complete
✓ Authorization works                  ✓ No transactions fail
✓ Capture works                        ✓ No race condition occurs
✓ Certificate validation works
✓ All 4 regions responsive
(Takes: 1-2 hours)                    (Takes: 5-15 minutes)

RESULT:                                RESULT:
"Build is stable, proceed"             "Bug is fixed, proceed"
go to full testing suite               go to production deployment
```

---

## 🎬 Real-Time Fincity Example

### Scenario 1: SMOKE Testing (After PKCS12 Deployment)

**Context**: 
- QA team just deployed PKCS12 certificate migration to pre-production
- New build is ready
- Question: "Is this build stable enough to run our full 95-test-case suite?"

**Smoke Tests (Quick sanity check of critical paths):**

```
SMOKE TEST SUITE - FINCITY PKCS12 MIGRATION
═════════════════════════════════════════════════════════════

Test 1: Void Transaction with Valid PKCS12 Cert
├─ Step 1: Login to payment system
├─ Step 2: Initiate void transaction with valid PKCS12 cert
├─ Step 3: Verify transaction succeeds
└─ Expected: ✅ PASS
   Actual:   ✅ PASS
   Time:     2 minutes

Test 2: Refund Transaction with Valid PKCS12 Cert
├─ Step 1: Initiate refund transaction
├─ Step 2: System validates PKCS12 cert
├─ Step 3: Verify refund completes
└─ Expected: ✅ PASS
   Actual:   ✅ PASS
   Time:     2 minutes

Test 3: Authorization Transaction with Valid PKCS12 Cert
├─ Step 1: Submit authorization request
├─ Step 2: Certificate validation succeeds
├─ Step 3: Payment authorized
└─ Expected: ✅ PASS
   Actual:   ✅ PASS
   Time:     2 minutes

Test 4: Capture Transaction with Valid PKCS12 Cert
├─ Step 1: Submit capture request
├─ Step 2: System processes with PKCS12 cert
├─ Step 3: Verify capture completes
└─ Expected: ✅ PASS
   Actual:   ✅ PASS
   Time:     2 minutes

Test 5: System Responsiveness Across Regions
├─ Step 1: Test system response in US region
├─ Step 2: Test system response in EU region
├─ Step 3: Verify <2 second response time
└─ Expected: ✅ PASS
   Actual:   ✅ PASS
   Time:     5 minutes

═════════════════════════════════════════════════════════════
SMOKE TEST RESULTS:
Total Tests:     5
Passed:          5 ✅
Failed:          0
Time Taken:      15 minutes
Status:          ✅ PASSED - BUILD IS STABLE

DECISION: "Build is stable. Proceed to full 95-test regression suite."
```

**What's Tested:**
- ✅ All 4 main transaction types (void, refund, auth, capture)
- ✅ Certificate validation working
- ✅ Basic system responsiveness

**What's NOT Tested (Deferred to Full Suite):**
- ❌ Error scenarios (expired certs, invalid certs)
- ❌ Edge cases (concurrent transactions, timeouts)
- ❌ Performance baselines
- ❌ Security validations
- ❌ Negative scenarios

---

### Scenario 2: SANITY Testing (After Race Condition Bug Fix)

**Context**:
- QA found a race condition in concurrent transaction processing
- Dev team fixed the bug
- Question: "Did the fix actually work? Is the race condition gone?"

**Sanity Tests (Focused on the specific bug that was fixed):**

```
SANITY TEST SUITE - RACE CONDITION FIX VERIFICATION
═════════════════════════════════════════════════════════════

Background: Race condition occurred when 50+ concurrent void 
transactions tried to validate the same certificate simultaneously.
Fix Applied: Dev implemented thread-safe certificate caching.

Test 1: Concurrent Void Transactions (The Core Fix)
├─ Setup: Prepare to fire 50 concurrent void transactions
├─ Step 1: Submit 50 void transactions simultaneously
├─ Step 2: All transactions attempt cert validation
├─ Step 3: Monitor for race condition (memory collision)
├─ Step 4: Verify all 50 transactions complete successfully
├─ Step 5: Verify no transactions fail
└─ Expected: ✅ ALL 50 PASS (no race condition)
   Actual:   ✅ ALL 50 PASS (no race condition)
   Time:     3 minutes

Test 2: Concurrent Refunds (Verify Fix Applies Broadly)
├─ Setup: Prepare 50 concurrent refund transactions
├─ Step 1: Submit 50 refunds simultaneously
├─ Step 2: All attempt cert validation
├─ Step 3: Verify all complete without errors
└─ Expected: ✅ ALL 50 PASS
   Actual:   ✅ ALL 50 PASS
   Time:     2 minutes

Test 3: Mixed Concurrent Transactions (Stress the Fix)
├─ Setup: Mix of void, refund, auth, capture (50 total)
├─ Step 1: Submit all 50 mixed transactions simultaneously
├─ Step 2: Verify all types process correctly
├─ Step 3: No race condition occurs
└─ Expected: ✅ ALL 50 PASS
   Actual:   ✅ ALL 50 PASS
   Time:     3 minutes

Test 4: Confirm No Regression (Other Transaction Types)
├─ Setup: Test the main transaction types
├─ Step 1: Single void transaction → Should pass
├─ Step 2: Single refund transaction → Should pass
├─ Step 3: Single auth transaction → Should pass
└─ Expected: ✅ ALL PASS (fix didn't break anything)
   Actual:   ✅ ALL PASS
   Time:     2 minutes

═════════════════════════════════════════════════════════════
SANITY TEST RESULTS:
Total Tests:     4
Passed:          4 ✅
Failed:          0
Race Condition:  NOT DETECTED ✅
Time Taken:      10 minutes
Status:          ✅ PASSED - BUG IS FIXED

DECISION: "Race condition fix verified. Bug is resolved. Ready for production."
```

**What's Tested:**
- ✅ The specific race condition is fixed (50 concurrent transactions)
- ✅ Fix works for multiple transaction types
- ✅ No regression in other areas

**What's NOT Tested (Already covered by previous testing):**
- ❌ Error scenarios
- ❌ Performance baselines
- ❌ Full regression suite (that was already done)
- ❌ Other features

---

## 🔄 Timeline: When Each Happens

```
DEVELOPMENT & DEPLOYMENT TIMELINE
═══════════════════════════════════════════════════════════════

DAY 1: DEVELOPMENT
├─ Dev builds PKCS12 feature
└─ Code ready for testing

DAY 2: SMOKE TEST (Quick stability check)
├─ QA receives new build
├─ Runs 5-test smoke suite: ✅ PASS (15 min)
├─ Decision: "Build is stable"
└─ → PROCEED TO FULL TESTING

DAYS 3-5: FULL REGRESSION TESTING
├─ QA runs all 95 test cases
├─ Found race condition in concurrent processing
├─ Logged as CRITICAL bug
└─ → REPORT TO DEVELOPERS

DAY 6: BUG FIX
├─ Dev analyzes race condition
├─ Implements thread-safe certificate caching fix
├─ Commits fix to code
└─ → READY FOR VERIFICATION

DAY 7: SANITY TEST (Verify specific fix)
├─ QA receives bug-fixed build
├─ Runs 4-test sanity suite: ✅ PASS (10 min)
├─ Decision: "Race condition is fixed"
└─ → READY FOR PRODUCTION

DAY 8: PRODUCTION DEPLOYMENT
└─ Deploy with confidence


KEY DIFFERENCE:
Smoke = "Is the build stable?" (After new feature deployed)
Sanity = "Is the bug fixed?" (After specific bug fix applied)
```

---

## 🎯 Different Scenarios, Different Testing

### Scenario A: New Feature Deployment
```
Developer deployed PKCS12 migration feature
                            ↓
              SMOKE TEST (5 critical tests)
              "Is the build working at all?"
                            ↓
                    ✅ PASS (15 min)
                            ↓
              FULL REGRESSION TESTING
              (All 95 test cases)
                            ↓
                  1 Critical Bug Found
          (Race condition in concurrent processing)
```

### Scenario B: Bug Fix Verification
```
Developer fixed race condition bug
                            ↓
              SANITY TEST (4 focused tests)
              "Is THIS specific bug fixed?"
                            ↓
                    ✅ PASS (10 min)
                            ↓
              READY FOR PRODUCTION
          (No need for full regression again)
```

---

## 💡 Key Interview Talking Points

### When Asked: "What's the difference between Smoke and Sanity Testing?"

**Good Answer:**
> "Smoke testing is about determining if a new build is stable enough to proceed with full testing. It's a quick validation of critical paths. Sanity testing is about verifying that a specific bug fix actually works. They serve different purposes at different times.
>
> In my Fincity project, after we deployed the PKCS12 migration, I ran a smoke test with 5 critical test cases (all 4 transaction types + system responsiveness) in 15 minutes. When we found a race condition in concurrent processing, I ran a sanity test with 4 focused tests on that specific issue in 10 minutes to verify the fix."

**Great Answer (More Detail):**
> "Smoke testing is performed AFTER a new build is deployed and checks if the basic critical functionality works. It's a 'quick health check.' For Fincity, when the PKCS12 migration deployed, I ran 5 tests: void, refund, authorization, capture, and region responsiveness—all passed in 15 minutes, giving confidence to proceed with the full 95-test regression suite.
>
> Sanity testing is performed AFTER a specific bug fix and verifies that the fix works and hasn't broken other areas. It's focused and narrow in scope. When we found a race condition in concurrent transactions, dev fixed it, and I ran 4 sanity tests: 50 concurrent voids, 50 concurrent refunds, 50 mixed transactions, and regression check on single transactions—all passed in 10 minutes, confirming the fix was successful.
>
> The key difference: Smoke is broad and happens when new code arrives. Sanity is narrow and happens after a specific fix. Smoke asks 'Is the build usable?' Sanity asks 'Is this bug fixed?'"

---

## 📋 Comparison Table

| Dimension | Smoke Testing | Sanity Testing |
|-----------|---------------|----------------|
| **When** | After new build deployment | After bug fix application |
| **Who initiates** | QA lead (after build available) | QA tester (after dev fixes bug) |
| **Scope** | All critical paths (broad) | One specific feature (narrow) |
| **Tests run** | 5-10 quick tests | 2-5 focused tests |
| **Time** | 30 min - 2 hours | 5-15 minutes |
| **Purpose** | "Is build stable enough?" | "Is bug fixed?" |
| **Pass decision** | "Proceed to full testing" | "Ready for deployment" |
| **Fail decision** | "Reject build, ask dev to fix" | "Back to dev to fix again" |
| **Document** | Smoke test report | Defect closure verification |
| **Fincity Example** | After PKCS12 deployment | After race condition fix |

---

## 🔴 Common Mistakes

### Mistake 1: Confusing Smoke and Sanity
❌ "I ran sanity testing on the new PKCS12 build"
✅ "I ran smoke testing on the new PKCS12 build"
(New build = Smoke; Bug fix = Sanity)

### Mistake 2: Doing Smoke Testing After Every Small Fix
❌ "I run smoke tests every time dev fixes a bug"
✅ "I run sanity tests after a bug fix and smoke tests after a new build"
(Smoke is for new builds; Sanity is for bug fixes)

### Mistake 3: Thinking Sanity Testing Replaces Regression
❌ "After the race condition fix, I just ran sanity tests and deployed"
✅ "After the race condition fix, I ran sanity tests to verify the fix, then we ran regression to ensure no other issues"
(Sanity verifies a specific fix; Regression verifies nothing else broke)

### Mistake 4: Not Knowing When to Stop Testing
❌ "I ran 50 test cases as sanity testing"
✅ "I ran 4 focused test cases as sanity testing to verify the race condition fix"
(Sanity is quick and focused; if it takes too long, it's not sanity)

---

## ✅ Checklist: Do You Understand?

- [ ] Smoke testing = New build stability check
- [ ] Sanity testing = Specific bug fix verification
- [ ] Smoke is broad; Sanity is narrow
- [ ] Smoke happens after deployment; Sanity happens after bug fix
- [ ] Smoke takes 30 min - 2 hours; Sanity takes 5-15 minutes
- [ ] Smoke tests all critical paths; Sanity tests specific affected feature
- [ ] In Fincity: Smoke tested PKCS12 migration (4 transaction types); Sanity tested race condition fix
- [ ] Pass smoke = Proceed to full testing
- [ ] Pass sanity = Bug is fixed, ready for deployment

If YES to all → You understand the difference! 🎯

---

## 🎓 Real-World Analogy

**Smoke Testing = Car Inspection After Assembly**
You just assembled a new car. Before testing the transmission, brakes, suspension separately, you do a smoke test: Does it start? Do the lights work? Can it drive in a straight line? If yes, proceed to detailed testing.

**Sanity Testing = Verification After Repair**
The transmission had a problem. Mechanic fixed it. You do a sanity test: Does the car shift gears smoothly? Did the fix work? If yes, you're done.

---

## 🎬 Fincity Timeline Summary

```
WEEK 4 - DEPLOYMENT TIMELINE
═════════════════════════════════════════════════════════════

Monday 9 AM: PKCS12 Migration Deployed
            └─ New build available
            └─ → SMOKE TEST NOW (15 min)
            
Monday 10 AM: Smoke Test Results
             └─ All 5 critical tests PASS ✅
             └─ Decision: "Build is stable"
             └─ → Proceed to Full Testing
             
Monday-Wednesday: Full Regression Testing (95 test cases)
                 └─ Found 1 CRITICAL bug: Race condition
                 └─ 50 concurrent transactions fail
                 └─ → Report to Dev
                 
Thursday: Dev Fixes Race Condition
         └─ Implements thread-safe caching
         └─ Commits fix
         └─ → SANITY TEST NOW (10 min)
         
Thursday 2 PM: Sanity Test Results
              └─ All 4 focused tests PASS ✅
              └─ Race condition is fixed
              └─ No regression detected
              └─ Decision: "Ready for production"
              └─ → Deploy to Production
              
Friday: Production Deployment
       └─ Zero payment failures
       └─ Full stakeholder confidence ✅
```

---

## 📚 Summary

**SMOKE TESTING:**
- ✅ When: After new build deployed
- ✅ What: Test all critical paths quickly
- ✅ Why: Ensure build is stable enough for full testing
- ✅ Time: 30 min - 2 hours
- ✅ Example: After PKCS12 migration deploy, test all 4 transaction types

**SANITY TESTING:**
- ✅ When: After specific bug fix
- ✅ What: Test only the fixed feature
- ✅ Why: Verify bug is fixed and not broken again
- ✅ Time: 5-15 minutes
- ✅ Example: After race condition fix, test concurrent transactions

**Remember:** If you're testing a NEW BUILD → SMOKE. If you're testing a BUG FIX → SANITY.

Now you understand! 🚀
