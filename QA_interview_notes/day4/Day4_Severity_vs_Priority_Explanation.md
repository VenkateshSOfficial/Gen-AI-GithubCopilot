# Day 4 – Severity vs. Priority: Your Standard Explanation

## 🎯 Your Perfect Interview Answer

### The Question: "Explain the difference between severity and priority with examples."

---

## 📋 YOUR STANDARD ANSWER (2-3 minutes)

```
"Severity and Priority are two different ways to measure bugs, and it's crucial
to understand the distinction because it drives different business decisions.

SEVERITY: How bad is the bug technically?
├─ Question: "What is the technical impact?"
├─ Determined by: QA, Dev, Technical Team
├─ Levels: Critical → Major → Medium → Low
├─ Focus: Technical impact on the system
└─ Drives: How hard is it to fix? What systems are affected?

PRIORITY: How urgently does it need fixing?
├─ Question: "What is the business impact?"
├─ Determined by: Product Manager, Business Stakeholder
├─ Levels: Blocker → Critical → Major → Minor → Trivial
├─ Focus: Business importance
└─ Drives: What order do we fix bugs in?

KEY INSIGHT:
Sometimes a small technical issue has huge business impact (high priority).
Sometimes a big technical issue affects nobody important (low priority).

Let me give you examples to make this concrete:
"
```

---

## 💼 TOUGH EXAMPLES - Use These in Interviews

### Example 1: Typo in Payment Page

```
BUG: "Confirmation email says 'recieve' instead of 'receive'"

SEVERITY: LOW
├─ Why: Just a typo, 100% functionality works
├─ Technical Impact: None - no system broken
├─ System affected: Email formatting only
└─ Difficulty to fix: 5 minutes

PRIORITY: CRITICAL
├─ Why: All users see this email after payment
├─ Business Impact: Very high visibility
├─ Customer perception: Looks unprofessional
├─ Revenue impact: Could affect trust
├─ Affected users: 100% of users who pay
└─ Fix timing: Today before business hours

DECISION: "Fix immediately but not an emergency"
INTERVIEW INSIGHT: This shows you understand business context matters more
                   than technical severity for prioritization.
```

### Example 2: Intermittent Crash on Edge Case

```
BUG: "App crashes when loading reports with >1 million rows"

SEVERITY: CRITICAL
├─ Why: App completely crashes, data loss risk
├─ Technical Impact: Total system failure
├─ System affected: Core functionality broken
├─ Data at risk: Report data unsaved
└─ Difficulty to fix: Unknown (complex issue)

PRIORITY: MAJOR (or MINOR in some cases!)
├─ Why: Only affects 5% of users
├─ Business Impact: Edge case, not primary use
├─ Affected users: Power users with huge datasets
├─ Workaround available: Export smaller datasets
├─ Fix timing: This sprint
└─ Alternative: Could document as limitation

DECISION: "Fix soon, but not emergency"
INTERVIEW INSIGHT: This shows you understand that severity and priority
                   can differ significantly. Technical criticality ≠ priority.
```

### Example 3: Search Pagination Broken

```
BUG: "Search results - page 2 doesn't load correctly"

SEVERITY: MEDIUM
├─ Why: Page 1 works fine, data is all there, just display
├─ Technical Impact: Partial functionality (1 out of N pages)
├─ System affected: UI rendering
├─ Workaround: View data one page at a time
└─ Difficulty to fix: Probably simple (pagination logic)

PRIORITY: BLOCKER / CRITICAL
├─ Why: Affects 99% of searches with multiple pages
├─ Business Impact: MASSIVE - search is core feature
├─ Affected users: Nearly all users doing searches
├─ Revenue impact: Blocks user engagement
├─ Customer complaints: Emails flooding in
├─ Fix timing: IMMEDIATELY
└─ Business decision: "This blocks everything"

DECISION: "Fix TODAY - high priority despite medium severity"
INTERVIEW INSIGHT: Shows you understand business context. A medium severity
                   bug can be blocker priority if it affects core functionality.
```

### Example 4: Security Vulnerability

```
BUG: "API key visible in browser local storage"

SEVERITY: CRITICAL
├─ Why: Security vulnerability, all user accounts at risk
├─ Technical Impact: Authentication compromise possible
├─ System affected: All user accounts
├─ Data at risk: All customer data
└─ Difficulty to fix: Medium (needs careful migration)

PRIORITY: BLOCKER
├─ Why: Security vulnerability = must fix immediately
├─ Business Impact: Regulatory violation (GDPR/SOC2)
├─ Legal risk: Breach notification required
├─ Reputation risk: Massive if exploited
├─ Fix timing: IMMEDIATELY (may need emergency patch)
└─ Business decision: "Stop everything, fix this"

DECISION: "Emergency fix, highest priority"
INTERVIEW INSIGHT: This is the rare case where BOTH severity and priority
                   are at maximum. Security issues are always both.
```

### Example 5: Beautiful Visual Bug

```
BUG: "Dashboard animation creates visual glitch during transition"

SEVERITY: LOW
├─ Why: Visual only, no functional impact
├─ Technical Impact: None - animation timing issue
├─ System affected: UI animation library
├─ Workaround: Happens only during transition
└─ Difficulty to fix: Could be easy or hard (depends on cause)

PRIORITY: TRIVIAL / MINOR
├─ Why: Barely noticeable, doesn't affect use cases
├─ Business Impact: None - cosmetic only
├─ Affected users: Only if watching closely during animation
├─ Revenue impact: Zero
├─ Customer complaints: Zero
├─ Fix timing: Backlog, next sprint if time
└─ Business decision: "Nice to fix, if we have time"

DECISION: "Can wait - low priority, low severity"
INTERVIEW INSIGHT: Some bugs are just low on both dimensions. Save your
                   resources for bugs that matter.
```

### Example 6: Data Inconsistency (Race Condition)

```
BUG: "Order total shows £100 in UI but charges £120 from payment processor"

SEVERITY: CRITICAL
├─ Why: Data doesn't match, financial records corrupted
├─ Technical Impact: Database inconsistency across systems
├─ System affected: Orders, Payments, Accounting
├─ Data integrity: Trust in system compromised
└─ Difficulty to fix: Complex (backend synchronization)

PRIORITY: CRITICAL / BLOCKER
├─ Why: IMMEDIATE refunds required
├─ Business Impact: Financial loss, customer trust
├─ Affected users: All users with discounts (widespread)
├─ Revenue impact: Estimated $10K-50K per day in refunds
├─ Customer complaints: Massive support burden
├─ Legal impact: Accounting records incorrect
├─ Fix timing: EMERGENCY - may need to take site down
└─ Business decision: "Fix now, possibly pause orders"

DECISION: "Drop everything - highest priority AND severity"
INTERVIEW INSIGHT: This is a nightmare scenario combining data integrity
                   with massive financial impact. Both critical.
```

### Example 7: Slow Report Generation

```
BUG: "Annual report takes 15 minutes to generate instead of 30 seconds"

SEVERITY: MEDIUM
├─ Why: Feature still works, just slower
├─ Technical Impact: Performance degradation
├─ System affected: Report generation service
├─ Workaround: User can wait 15 minutes
└─ Difficulty to fix: Unknown (performance optimization needed)

PRIORITY: MINOR / MAJOR (depends on business)
├─ If used daily: MAJOR (user frustration builds up)
│  ├─ Why: Affects all users frequently
│  ├─ Lost productivity: 15 min per user per day
│  └─ Fix timing: This sprint
│
├─ If used monthly: MINOR (not urgent)
│  ├─ Why: Occasional wait is acceptable
│  ├─ Workaround: Run overnight
│  └─ Fix timing: Next sprint
│
└─ Business decision: Depends on report usage frequency

DECISION: "Fix soon or accept as limitation"
INTERVIEW INSIGHT: Shows you understand business context determines priority.
                   Same technical issue = different priority based on impact.
```

---

## 📊 Quick Reference Matrix

```
SEVERITY vs. PRIORITY DECISION MATRIX
═════════════════════════════════════════════════════════════════

                   LOW PRIORITY      MEDIUM PRIORITY    HIGH PRIORITY    BLOCKER
─────────────────────────────────────────────────────────────────────────────
LOW SEVERITY    ✓ Backlog           ✓ Next Sprint       ⚠ Review         ❌ Invalid
                  (Nice to have)      (Can wait)         (Visible bug?)    (Can't be blocking)
                  
                  Example: Typo in   Example: Color      Example: Button   
                  help text          slightly off        edge misaligned

MEDIUM SEVERITY ✓ Backlog           ✓ This Sprint       ⚠ Urgent          ❌ Rare
                  (Minor impact)      (Feature affected)  (Core impact)     (Shouldn't happen)
                  
                  Example: Unused    Example: Search     Example: Slow
                  admin field        missing results     dashboard load

MAJOR SEVERITY  ✓ Review            ⚠ URGENT            🔴 FIX TODAY      🔴 FIX NOW
                  (Impact??)          (Feature broken)    (Major impact)    (Drop everything)
                  
                  Example: Edge      Example: Export     Example: Corrupted
                  case failure       produces errors     customer data

CRITICAL        ❌ Invalid          🔴 EMERGENCY         🔴 EMERGENCY      🔴 EMERGENCY
SEVERITY          (Can't be low)      (Major impact)      (Critical impact) (All hands)
                                      
                                      Example: Race       Example: Security  Example: Payment
                                      condition in       vulnerability      failure
                                      payment
```

---

## 🎯 How to Explain in an Interview

### Opening Statement:
```
"Severity and Priority are often confused but they're completely different.

Severity measures TECHNICAL IMPACT - how broken is the system?
Priority measures BUSINESS IMPACT - how urgently do we fix it?

The key insight is: they're independent. A small technical issue can have
huge business priority. A huge technical issue can have low priority.
"
```

### Tell a Story:
```
"Let me give you a concrete example:

Imagine a typo in the payment confirmation email. Says 'recieve' instead of
'receive'. That's technically LOW severity - the system works fine, it's just
a typo.

But it's CRITICAL priority because:
• All users who pay see this email
• They form first impression of our company
• Could damage brand trust
• Takes 5 minutes to fix
• High visibility issue

So we'd fix it immediately, even though it's not a severe bug. That's the
distinction that matters in real teams.
"
```

### Use the Matrix:
```
"If I put this on a matrix:

Bottom-left corner (low severity, low priority):
• Backlog items - nice to have, not urgent

Top-right corner (high severity, high priority):
• Emergency items - drop everything, fix now
• Example: Payment system down

Interesting cases:
• Top-left: Low severity but high priority (visibility issues)
  - Fix immediately despite not being severe
  
• Bottom-right: High severity but low priority (edge cases)
  - Fix eventually but not urgent
  - Affects 0.1% of users even though system breaks
"
```

---

## ✅ Interview Checklist

When answering this question:
- [ ] Distinguish between severity (technical) and priority (business)
- [ ] Use at least 2 concrete examples
- [ ] Show you understand they're independent
- [ ] Mention that priority matters more for business
- [ ] Explain decision-making process
- [ ] Show maturity in understanding business context
- [ ] Be able to defend your severity/priority assessment
- [ ] Show understanding of stakeholder perspectives

---

## 💪 Your Competitive Edge

**Most QA candidates say:**
"Severity and priority are like how bad something is and how fast to fix it"
(Too vague, misses the point)

**YOU say:**
"Severity measures technical impact. Priority measures business impact. They're
independent - a typo can be high priority (all users see it) but low severity
(no system broken). This distinction determines what we fix first."

This shows you think like a business person, not just a technician.

---

Your standard explanation is ready for any interview! 🎯
