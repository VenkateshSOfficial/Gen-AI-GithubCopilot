# Smoke vs. Sanity Testing: Quick Visual Reference

## 🎯 The Simplest Explanation

| Question | Answer |
|----------|--------|
| **Smoke: When?** | After NEW build deployment |
| **Sanity: When?** | After specific BUG FIX |
| **Smoke: What?** | Test ALL critical paths |
| **Sanity: What?** | Test ONLY affected feature |
| **Smoke: Time?** | 30 min - 2 hours |
| **Sanity: Time?** | 5-15 minutes |
| **Smoke Example?** | After PKCS12 deploy: test all 4 transaction types |
| **Sanity Example?** | After race condition fix: test concurrent transactions |

---

## 🔄 Visual Timeline

```
DAY 1: NEW FEATURE DEPLOYED
│
├─→ SMOKE TEST (Quick check)
│   ├─ Test void transaction ✓
│   ├─ Test refund transaction ✓
│   ├─ Test authorization ✓
│   ├─ Test capture ✓
│   └─ Result: "Build is stable" (15 min)
│
├─→ FULL REGRESSION TESTING
│   ├─ Run all 95 test cases
│   └─ Found 1 critical bug: Race condition ✗
│
└─→ Report bug to dev


DAY 3: BUG FIX APPLIED
│
├─→ SANITY TEST (Focused check)
│   ├─ Test 50 concurrent voids ✓
│   ├─ Test 50 concurrent refunds ✓
│   ├─ Test mixed 50 transactions ✓
│   └─ Result: "Bug is fixed" (10 min)
│
└─→ Ready for production
```

---

## 💡 The Core Difference

```
SMOKE TESTING                    SANITY TESTING
══════════════════════════════   ════════════════════════════════
"Is the build working?"          "Is THIS bug fixed?"
                                 
NEW DEPLOYMENT                   AFTER BUG FIX
                                 
5-10 QUICK TESTS                 2-5 FOCUSED TESTS
                                 
15-120 MINUTES                   5-15 MINUTES
                                 
ALL CRITICAL PATHS               SPECIFIC AFFECTED AREA
                                 
PASS = "Do full testing"         PASS = "Deploy to production"
                                 
FAIL = "Reject build"            FAIL = "Send back to dev"
```

---

## 🎬 Fincity Real Examples

### SMOKE TESTING (After PKCS12 Deployment)

**5 Quick Tests to Check Build Stability:**

1. **Void + Valid PKCS12** → ✅ PASS
2. **Refund + Valid PKCS12** → ✅ PASS
3. **Authorization + Valid PKCS12** → ✅ PASS
4. **Capture + Valid PKCS12** → ✅ PASS
5. **System Responsiveness (All Regions)** → ✅ PASS

**Time: 15 minutes**
**Decision: "Build is stable. Proceed to full regression testing."**

---

### SANITY TESTING (After Race Condition Fix)

**4 Focused Tests to Verify Bug Fix:**

1. **50 Concurrent Void Transactions** → ✅ PASS (No race condition)
2. **50 Concurrent Refund Transactions** → ✅ PASS (No race condition)
3. **50 Mixed Transaction Types** → ✅ PASS (No race condition)
4. **Single Transactions (Regression)** → ✅ PASS (No regression)

**Time: 10 minutes**
**Decision: "Bug is fixed. Ready for production deployment."**

---

## 📋 Quick Comparison

| Aspect | Smoke | Sanity |
|--------|-------|--------|
| Trigger | New build available | Bug fix applied |
| Scope | Broad (all critical) | Narrow (one specific) |
| Tests | 5-10 | 2-5 |
| Duration | 15 min - 2 hours | 5-15 min |
| Question | "Is it working?" | "Is it fixed?" |
| Pass = | Full testing OK | Deploy OK |

---

## 🎓 Interview Answer (Ready to Use)

**Q: "What's the difference between Smoke and Sanity Testing?"**

**A:** "Smoke testing validates if a new build is stable enough to proceed with full testing. It tests all critical paths quickly—for Fincity, after PKCS12 deployment, I ran 5 tests (all 4 transaction types + responsiveness) in 15 minutes and confirmed the build was stable.

Sanity testing verifies that a specific bug fix actually works. It's narrowly focused on the affected feature. When we found a race condition in concurrent transactions, dev fixed it, and I ran 4 sanity tests (50 concurrent voids, 50 concurrent refunds, mixed transactions, and regression check) in 10 minutes to confirm the fix was successful.

Key difference: Smoke = new build stability check; Sanity = specific bug fix verification."

---

## ✅ Memory Trick

**SMOKE = "New build Smoke test"**
- S = Stability check
- M = Multiple critical paths
- O = Overall health
- K = Keep it quick (30 min - 2 hours)
- E = Enough to proceed?

**SANITY = "Specific bug Sanity test"**
- S = Specific issue
- A = After fix applied
- N = Narrow scope
- I = In 5-15 minutes
- T = This bug fixed?
- Y = Yes? Deploy!

---

## 🚀 Fincity Numbers

**Smoke Testing:**
- 5 test cases
- 15 minutes
- All 4 transaction types covered
- Result: "Build stable, proceed"

**Sanity Testing:**
- 4 test cases
- 10 minutes
- Concurrent transaction focus
- Result: "Bug fixed, ready"

---

## 🎯 Decision Tree

```
New build just deployed?
├─ YES → Run SMOKE TEST (15-120 min)
│        └─ Pass? → Full regression
│        └─ Fail? → Reject build
│
├─ NO, but dev fixed a bug?
│        → Run SANITY TEST (5-15 min)
│        └─ Pass? → Production ready
│        └─ Fail? → Back to dev
│
└─ Neither? → Regular testing continues
```

---

## 📚 Your Interview Toolkit

**When asked about test types:**
- Functional testing = Does it work?
- Non-functional = Performance/security
- **Smoke testing = New build stable?**
- **Sanity testing = Bug fixed?**
- Regression testing = Nothing else broke?

---

## ✨ Final Takeaway

**SMOKE:** "Is this new build ready for testing?"
**SANITY:** "Is this specific bug fixed?"

**Smoke is broad and happens after deployment.**
**Sanity is narrow and happens after a fix.**

You now understand! 🎯
