# Interview Study Cards 🎴

## Card 1: Priority vs Severity

```
┌─────────────────────────────────────────────┐
│ PRIORITY vs SEVERITY                        │
├─────────────────────────────────────────────┤
│                                             │
│ SEVERITY = "How BROKEN is it?"             │
│ Answer: Technical Impact                    │
│ Levels: Critical > Major > Medium > Low    │
│ Decider: Tech team                          │
│                                             │
│ PRIORITY = "How URGENT is it?"              │
│ Answer: Business Urgency                    │
│ Levels: Blocker > Critical > Major > Minor │
│ Decider: Business stakeholder               │
│                                             │
│ KEY: They DON'T always align!               │
│                                             │
│ Example 1:                                  │
│ Typo on homepage                            │
│ Severity: LOW (just text)                   │
│ Priority: CRITICAL (everyone sees)          │
│                                             │
│ Example 2:                                  │
│ Admin crash for large reports               │
│ Severity: CRITICAL (system crash)           │
│ Priority: MAJOR (affects 0.5% users)        │
│                                             │
└─────────────────────────────────────────────┘
```

---

## Card 2: DOR vs DOD

```
┌─────────────────────────────────────────────┐
│ DEFINITION OF READY (DOR)                   │
├─────────────────────────────────────────────┤
│                                             │
│ WHEN: Before work starts                    │
│ QUESTION: "Ready to start?"                 │
│ GATE: Prevents starting bad work            │
│                                             │
│ DOR CHECKLIST:                              │
│ ✓ Requirements clear                        │
│ ✓ Design approved                           │
│ ✓ Acceptance criteria defined               │
│ ✓ QA knows what to test                     │
│ ✓ No blockers                               │
│                                             │
│ If ANY ✗: NOT READY                         │
│                                             │
└─────────────────────────────────────────────┘

┌─────────────────────────────────────────────┐
│ DEFINITION OF DONE (DOD)                    │
├─────────────────────────────────────────────┤
│                                             │
│ WHEN: After work complete                   │
│ QUESTION: "Ready for production?"           │
│ GATE: Ensures production quality            │
│                                             │
│ DOD CHECKLIST:                              │
│ ✓ Code tested & reviewed                    │
│ ✓ QA approved                               │
│ ✓ Documentation complete                    │
│ ✓ Deployment ready                          │
│ ✓ Rollback plan in place                    │
│                                             │
│ If ANY ✗: NOT DONE                          │
│                                             │
└─────────────────────────────────────────────┘
```

---

## Card 3: Planning vs Analysis

```
┌─────────────────────────────────────────────┐
│ PLANNING                                    │
├─────────────────────────────────────────────┤
│                                             │
│ QUESTION: "What are we doing?"              │
│ ANSWERS: Goals, timeline, budget            │
│ WHEN: Project start                         │
│ TIME: Few days                              │
│ WHO: PM, Leadership, Sponsor                │
│                                             │
│ OUTPUTS:                                    │
│ • Charter                                   │
│ • Timeline                                  │
│ • Budget                                    │
│ • Resources                                 │
│ • High-level risks                          │
│                                             │
└─────────────────────────────────────────────┘

┌─────────────────────────────────────────────┐
│ ANALYSIS                                    │
├─────────────────────────────────────────────┤
│                                             │
│ QUESTION: "How are we doing it?"            │
│ ANSWERS: Detailed strategy & procedures     │
│ WHEN: After planning, before execution      │
│ TIME: 1-2+ weeks                            │
│ WHO: Tech lead, QA, Solutions Architect     │
│                                             │
│ OUTPUTS:                                    │
│ • Detailed requirements                     │
│ • Test cases (50-100+)                      │
│ • RTM                                       │
│ • Procedures & runbooks                     │
│ • Risk mitigation                           │
│                                             │
└─────────────────────────────────────────────┘
```

---

## Card 4: Smoke vs Sanity Testing

```
┌─────────────────────────────────────────────┐
│ SMOKE TESTING                               │
├─────────────────────────────────────────────┤
│                                             │
│ PURPOSE: App deployable?                    │
│ SCOPE: High-level, basic                    │
│ TIME: 5-15 minutes                          │
│ WHEN: Right after deployment                │
│ TEST COUNT: 10-20 scenarios                 │
│ PATH: Happy path only                       │
│                                             │
│ CHECKS:                                     │
│ • Can I log in?                             │
│ • Can I access main page?                   │
│ • Can I perform core action?                │
│                                             │
│ RESULT:                                     │
│ ✓ PASS: Proceed to detailed testing         │
│ ✗ FAIL: STOP! Rollback deployment           │
│                                             │
└─────────────────────────────────────────────┘

┌─────────────────────────────────────────────┐
│ SANITY TESTING                              │
├─────────────────────────────────────────────┤
│                                             │
│ PURPOSE: Feature works completely?          │
│ SCOPE: Feature-specific, detailed           │
│ TIME: 30-60 minutes per feature             │
│ WHEN: After smoke tests pass                │
│ TEST COUNT: 50-100+ scenarios               │
│ PATH: Happy + error + edge cases            │
│                                             │
│ CHECKS:                                     │
│ • Valid inputs work?                        │
│ • Invalid inputs handled?                   │
│ • Edge cases covered?                       │
│ • Errors appropriate?                       │
│                                             │
│ RESULT:                                     │
│ ✓ PASS: Ready for regression & release      │
│ ✗ FAIL: Feature needs fixes                 │
│                                             │
└─────────────────────────────────────────────┘
```

---

## Card 5: Bug Report Structure

```
┌─────────────────────────────────────────────┐
│ GREAT BUG REPORT                            │
├─────────────────────────────────────────────┤
│                                             │
│ 1. TITLE (Specific & searchable)            │
│    ✓ "Login button disabled for '+' email" │
│    ✗ "Login broken"                        │
│                                             │
│ 2. PRIORITY & SEVERITY                      │
│    Classify both correctly                  │
│                                             │
│ 3. ENVIRONMENT                              │
│    Browser, OS, version, date/time          │
│                                             │
│ 4. PRECONDITIONS                            │
│    What must be true first                  │
│                                             │
│ 5. STEPS (Numbered, exact, repeatable)      │
│    1. Go to login page                      │
│    2. Enter test+qa@example.com             │
│    3. Enter password                        │
│    4. Click login                           │
│                                             │
│ 6. EXPECTED RESULT                          │
│    What should happen                       │
│                                             │
│ 7. ACTUAL RESULT                            │
│    What really happens                      │
│                                             │
│ 8. EVIDENCE (Screenshot/video/logs)         │
│    Proof it exists                          │
│                                             │
│ 9. FREQUENCY                                │
│    Always/intermittent/rare                 │
│                                             │
│ 10. BUSINESS IMPACT                         │
│     Why it matters                          │
│                                             │
└─────────────────────────────────────────────┘
```

---

## Card 6: Defect Lifecycle

```
┌─────────────────────────────────────────────┐
│ DEFECT LIFECYCLE                            │
├─────────────────────────────────────────────┤
│                                             │
│ NEW                                         │
│  ↓ (Dev reviews)                            │
│ OPEN / ASSIGNED                             │
│  ↓ (Dev works on fix)                       │
│ IN PROGRESS                                 │
│  ↓ (Fix complete)                           │
│ RESOLVED                                    │
│  ↓ (QA verifies fix)                        │
│ VERIFIED / CLOSED                           │
│                                             │
│ ALTERNATE PATHS:                            │
│ → INVALID (not a bug)                       │
│ → DUPLICATE (already reported)              │
│ → CANNOT REPRODUCE                          │
│ → WONTFIX (business decision)               │
│ → REOPEN (fix didn't work)                  │
│                                             │
└─────────────────────────────────────────────┘
```

---

## Card 7: Testing Hierarchy (Post-Deployment)

```
┌─────────────────────────────────────────────┐
│ TESTING WORKFLOW AFTER DEPLOYMENT           │
├─────────────────────────────────────────────┤
│                                             │
│ DEPLOYMENT COMPLETE                         │
│           ↓                                 │
│ ┌─────────────────────────────────┐         │
│ │ SMOKE TESTS (5-15 min)          │         │
│ │ • Can I log in?                 │         │
│ │ • Can I access dashboard?       │         │
│ │ • Core functions working?       │         │
│ └─────────────────────────────────┘         │
│           ↓                                 │
│    ✗ FAILED → ROLLBACK → STOP               │
│           ↓                                 │
│    ✓ PASSED → Continue                     │
│           ↓                                 │
│ ┌─────────────────────────────────┐         │
│ │ SANITY TESTS (30-60 min)        │         │
│ │ • Feature works completely?     │         │
│ │ • Error handling correct?       │         │
│ │ • Edge cases covered?           │         │
│ └─────────────────────────────────┘         │
│           ↓                                 │
│    ✗ FAILED → Fix feature → Test again      │
│           ↓                                 │
│    ✓ PASSED → Continue                     │
│           ↓                                 │
│ ┌─────────────────────────────────┐         │
│ │ REGRESSION TESTS (if time)      │         │
│ │ • No old features broken?       │         │
│ │ • Performance OK?               │         │
│ └─────────────────────────────────┘         │
│           ↓                                 │
│    ✓ ALL PASSED → READY FOR RELEASE ✓      │
│                                             │
└─────────────────────────────────────────────┘
```

---

## Card 8: Classification Matrix

```
┌─────────────────────────────────────────────┐
│ SEVERITY vs PRIORITY MATRIX                 │
├─────────────────────────────────────────────┤
│                                             │
│              SEVERITY                       │
│        Low    Med   High   Critical         │
│       ─────────────────────────             │
│Bl     🔴     🔴🔴  🔴🔴🔴 🔴🔴🔴🔴        │
│Cr     🔴     🔴🔴  🔴🔴   🔴🔴🔴          │
│Ma     🟠     🟠🟠  🟠🟠   🟠🟠🟠          │
│Mi     🟡     🟡🟡  🟡🟡   🟡🟡            │
│Tr     ⚪     ⚪    ⚪     ⚪               │
│                                             │
│ 🔴🔴🔴🔴 = Fix NOW (P0 emergency)         │
│ 🔴🔴🔴   = Fix TODAY                      │
│ 🔴🔴     = Fix this week                   │
│ 🔴       = Fix this sprint                 │
│ 🟠-⚪     = Normal backlog                  │
│                                             │
│ REMEMBER:                                   │
│ Don't assume high Severity = high Priority  │
│ Each dimension is INDEPENDENT               │
│                                             │
└─────────────────────────────────────────────┘
```

---

## Card 9: Your 2-Minute Answer

### "Tell me about yourself (QA perspective)"

```
┌─────────────────────────────────────────────┐
│ TEMPLATE (2 MINUTES)                        │
├─────────────────────────────────────────────┤
│                                             │
│ "Hi, I'm [Name], a QA professional with    │
│ X years of experience in manual and        │
│ automation testing.                         │
│                                             │
│ In my current role, I focus on:             │
│ • Test planning and strategy development    │
│ • Creating comprehensive test cases        │
│ • Defect management and reporting           │
│ • Smoke and sanity testing post-deployment  │
│                                             │
│ Key methodologies I follow:                 │
│ • DOR/DOD gates for quality                 │
│ • Proper Severity/Priority classification   │
│ • Risk-based test approach                  │
│ • RTM for traceability                      │
│                                             │
│ Example: On our certificate migration,      │
│ I analyzed test coverage for 4 regions,     │
│ created RTM with 50+ test cases, and        │
│ ensured zero-downtime deployment.           │
│                                             │
│ I'm passionate about quality and believe    │
│ great QA is about understanding business    │
│ impact, not just finding bugs."             │
│                                             │
└─────────────────────────────────────────────┘
```

---

## Card 10: Quick Decision Matrix

```
┌─────────────────────────────────────────────┐
│ DECISION MAKING                             │
├─────────────────────────────────────────────┤
│                                             │
│ SITUATION → DECISION                        │
│ ───────────────────────────────             │
│                                             │
│ "Bug found in UI but core works"            │
│ → Severity: LOW, Priority: MINOR            │
│ → Action: Add to backlog                    │
│                                             │
│ "Payment processing fails"                  │
│ → Severity: CRITICAL, Priority: BLOCKER    │
│ → Action: STOP! Emergency response          │
│                                             │
│ "Typo on homepage"                          │
│ → Severity: LOW, Priority: CRITICAL         │
│ → Action: Fix immediately (quick fix)       │
│                                             │
│ "Admin report crashes (rare, has workaround)"
│ → Severity: CRITICAL, Priority: MAJOR      │
│ → Action: Schedule for sprint               │
│                                             │
│ "After deployment, app won't start"         │
│ → Test: SMOKE TEST FAILED                   │
│ → Action: ROLLBACK deployment               │
│                                             │
│ "All smoke tests passed, testing login"     │
│ → Test: SANITY TESTING in progress          │
│ → Action: Detailed scenario validation      │
│                                             │
└─────────────────────────────────────────────┘
```

---

## 🎯 Before Your Interview, Practice:

1. **Shuffle the cards** and quiz yourself
2. **Answer the question** before revealing
3. **Use examples** from your experience
4. **Explain out loud** to practice communication
5. **Time yourself** - keep answers concise
6. **Connect concepts** - show how they relate

---

These cards are your quick reference for interview prep! 🚀
