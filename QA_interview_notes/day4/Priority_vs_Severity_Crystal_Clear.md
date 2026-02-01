# Priority vs. Severity – CRYSTAL CLEAR GUIDE 🎯

## The 30-Second Understanding

**SEVERITY** = "How BROKEN is it?" (Technical Impact)
**PRIORITY** = "How URGENT is it?" (Business Impact)

---

## Analogy: Car Breakdown

```
Imagine your car breaks down:

SEVERITY = The problem itself
├─ Flat tire = Low severity (easy fix)
├─ Broken engine = Critical severity (major damage)
└─ Brake failure = Critical severity (safety risk)

PRIORITY = How urgently you need it fixed
├─ Flat tire on your commute to job interview = URGENT (High priority)
├─ Broken engine on parked car in garage = NOT URGENT (Low priority)
└─ Brake failure while driving = EMERGENCY (Blocker priority)

KEY INSIGHT: Same car problem can have different priorities!
A flat tire (low severity) during your wedding = HIGH priority!
```

---

## Real-Time Examples from Actual Projects

### Example 1: The Typo on Homepage 📝

**Scenario:** Your e-commerce site homepage has a typo: "Welcom to our store" instead of "Welcome"

```
SEVERITY: LOW
Why? 
• Just a typo, doesn't break anything
• Site still works perfectly
• No data lost
• No functionality affected
• Easy to fix (change 1 word)

PRIORITY: CRITICAL / BLOCKER
Why?
• Homepage is seen by ALL users (100% traffic)
• First impression matters
• Looks unprofessional
• Damages brand image
• Could lose sales
• Fix takes 2 minutes, deploy takes 15 minutes
• Must be fixed TODAY before business opens

REAL-TIME DECISION:
Developer gets message: "Fix the typo IMMEDIATELY"
It's marked BLOCKER priority (urgent)
But technically it's LOW severity (not complex)
```

---

### Example 2: The Slow Payment Processing 💳

**Scenario:** Payment checkout takes 30 seconds (normal is 3 seconds)

```
SEVERITY: MAJOR
Why?
• Core functionality affected
• Users can't complete purchases
• System is struggling
• May indicate server issues
• Could have data consistency problems
• Affects primary revenue stream

PRIORITY: CRITICAL
Why?
• Customers are leaving (cart abandonment increasing)
• Losing revenue RIGHT NOW
• Every minute it's down = money lost
• Affects 100% of transactions
• Stakeholders are panicking
• Must be fixed within HOURS

REAL-TIME DECISION:
This is BOTH high severity AND high priority = EMERGENCY
All hands on deck
Dev team pulls from other work
May need incident management
Communicate to customers (transparency)
```

---

### Example 3: The Intermittent Admin Crash 💥

**Scenario:** Admin panel crashes randomly when generating reports with 50k+ records

```
SEVERITY: CRITICAL
Why?
• Complete app crash (data risk)
• Entire function becomes unusable
• Users lose work
• Serious technical problem

PRIORITY: MAJOR (not CRITICAL)
Why?
• Only affects 0.5% of users (small percentage of admins)
• Only happens with large datasets (most reports are small)
• Workaround: Split the query, generate smaller reports
• Users can achieve their goal with extra effort
• Doesn't block primary business
• Can wait until next sprint

REAL-TIME DECISION:
Mark as MAJOR priority (fix this sprint)
But acknowledge it's CRITICAL severity (technically serious)
Schedule dev time
Document the workaround
Let users know when fix will be ready
```

---

### Example 4: The Security Vulnerability 🔐

**Scenario:** User API keys can be stolen from browser local storage

```
SEVERITY: CRITICAL
Why?
• Could expose ALL user data
• Could lead to account takeover
• Could be exploited by hackers
• Serious technical vulnerability
• Compliance/regulatory issue
• Could affect billions in transactions if undetected

PRIORITY: BLOCKER (Highest possible)
Why?
• Must be fixed BEFORE any deployment
• Could lose customer trust
• Legal liability
• Could require public notification
• Must be kept confidential (don't announce bug)
• Senior leadership involved

REAL-TIME DECISION:
BOTH highest levels = EMERGENCY
May need to:
• Roll back to previous version
• Notify customers
• Issue security patch
• Root cause analysis
• This is a P0 (highest priority)
```

---

### Example 5: The Typo in Error Message 📄

**Scenario:** Error message says "Eror ocurred" instead of "Error occurred"

```
SEVERITY: LOW
Why?
• Just text, no functionality broken
• Users still understand the error
• Can't damage data or security
• Purely cosmetic

PRIORITY: MINOR or TRIVIAL
Why?
• Rarely seen (only in error scenarios)
• Doesn't affect primary use case
• Users encountering errors are already frustrated
• Typo is secondary to the actual problem
• Can fix in next release
• Won't lose customers

REAL-TIME DECISION:
Add to backlog
Fix when you have free time
Not urgent at all
Users reporting this want the actual error fixed, not the typo
```

---

### Example 6: The Missing Feature (Not Really a Bug) 🎨

**Scenario:** Dark mode not available on mobile app

```
SEVERITY: LOW or N/A
Why?
• Not technically a bug (feature doesn't exist yet)
• App works fine without it
• No broken functionality
• No data affected

PRIORITY: BLOCKER (if it's a launch requirement)
PRIORITY: MINOR (if it's a nice-to-have)

Real example:
• Launch deadline says dark mode required for iOS app
  → BLOCKER priority (must have for launch)
  → Fix before release

• Dark mode nice-to-have after launch
  → MINOR priority (can be v2.0)
  → Backlog item

REAL-TIME DECISION:
Priority depends on BUSINESS decision
Not on technical complexity
```

---

## The Priority vs Severity Matrix 📊

```
                        SEVERITY
                    Low    Medium   High   Critical
                   ────────────────────────────────
PRIORITY  Blocker   🔴     🔴🔴    🔴🔴🔴  🔴🔴🔴🔴
          Critical  🔴     🔴🔴    🔴🔴   🔴🔴🔴
          Major     🟠     🟠🟠    🟠🟠   🟠🟠🟠
          Minor     🟡     🟡🟡    🟡🟡   🟡🟡
          Trivial   ⚪     ⚪      ⚪     ⚪

🔴🔴🔴🔴 = Fix IMMEDIATELY (all hands on deck)
🔴🔴🔴   = Fix TODAY
🔴🔴     = Fix this week
🔴       = Fix this sprint
🟠       = Can wait, normal backlog priority
🟡       = Nice to fix when available
⚪       = Can defer indefinitely
```

---

## Real Project Stories 🏢

### Story 1: Payment Processor Down (Feb 1, 2026)

```
INCIDENT: Stripe integration broken, no transactions going through

SEVERITY: CRITICAL
• Core functionality completely down
• Technical severity = 10/10

PRIORITY: BLOCKER
• Revenue = $0 for every minute it's down
• Estimated loss: $5,000 per minute
• Every second matters

ACTIONS:
✅ Declare P0 incident
✅ Get CEO/CTO involved
✅ Page on-call engineer
✅ Potentially roll back last deployment
✅ Communicate with customers immediately
✅ Open war room / incident command center

THIS IS REAL EMERGENCY MODE
```

---

### Story 2: Dashboard Slow for Reports (Normal Business)

```
INCIDENT: Report generation takes 2 minutes instead of 10 seconds

SEVERITY: MAJOR
• Primary feature affected
• But doesn't completely break
• Technical severity = 7/10

PRIORITY: MAJOR
• Affects productivity
• But users can wait 2 minutes
• Workaround: Smaller time windows work fine
• Not blocking business

ACTIONS:
✅ Create ticket for next sprint
✅ Investigate root cause (cache? query?)
✅ Document workaround for users
✅ Plan fix for sprint planning
✅ Can wait a few days

THIS IS NORMAL PRIORITY
```

---

### Story 3: Admin-Only Feature Broken (Background)

```
INCIDENT: CSV export in admin panel fails for 10k+ rows

SEVERITY: MAJOR
• Feature completely broken
• Technical severity = 8/10

PRIORITY: MINOR/MAJOR
• Only affects 2 admins (out of 100,000 users)
• Workaround: Export smaller batches
• Not customer-facing
• Business doesn't rely on it daily

ACTIONS:
✅ Add to backlog
✅ Let admin know when it'll be fixed
✅ Schedule for "next available sprint slot"
✅ Document workaround
✅ Can wait 2-3 weeks

THIS IS BACKLOG PRIORITY
```

---

## Interview Answers 🎤

### Question: "What's the difference between Priority and Severity?"

**GOOD ANSWER:**
"Severity describes the technical impact—how broken something is. Priority describes the business impact—how urgently it needs fixing.

For example, a typo on our homepage is LOW severity (easy to fix) but CRITICAL priority (everyone sees it, affects brand image).

Another example: If our admin panel crashes when generating large reports, that's CRITICAL severity (complete system failure) but maybe only MAJOR priority (affects only admins with large datasets, workaround exists).

The key insight is that severity and priority don't always align. Security issues are always highest priority regardless of severity. Revenue-affecting bugs are always high priority. But low-visibility bugs might be high severity but low priority if few users are affected."

---

## Key Takeaways ✅

```
1. SEVERITY = Technical Problem Severity
   └─ Asked by: Dev team, QA, Tech lead
   └─ Question: "How broken is this?"
   └─ Levels: Critical > Major > Medium > Low
   └─ Determines: Complexity and effort to fix

2. PRIORITY = Business Urgency
   └─ Asked by: Product Manager, Business stakeholder
   └─ Question: "How urgently do we need this?"
   └─ Levels: Blocker > Critical > Major > Minor > Trivial
   └─ Determines: When it gets fixed

3. They Can Be Different!
   └─ Low severity, high priority = Quick fix needed urgently
   └─ High severity, low priority = Complex problem, can wait

4. Most Important Combinations:
   ├─ Blocker + Critical = P0 Emergency (all hands on deck)
   ├─ Low + Minor = Backlog (nice to fix someday)
   ├─ Critical + Minor = Schedule fix properly
   └─ Low + Blocker = Quick visual/UX fixes
```

---

## Practice Exercise 🎯

### Classify These Bugs:

**Bug 1:** Button text color is slightly off (should be #333, is #336)
- Severity? _________
- Priority? _________

**Bug 2:** Login doesn't work for users with '+' in email
- Severity? _________
- Priority? _________

**Bug 3:** Database occasionally loses transactions for payment API
- Severity? _________
- Priority? _________

**Bug 4:** Help documentation has outdated screenshots
- Severity? _________
- Priority? _________

**Bug 5:** App crashes for admins generating year-long reports (rare)
- Severity? _________
- Priority? _________

---

## Answers:

**Bug 1:** 
- Severity: LOW (cosmetic, no functionality broken)
- Priority: MINOR (looks unprofessional but not urgent)

**Bug 2:**
- Severity: MAJOR (core feature completely broken for those users)
- Priority: CRITICAL (blocks users from accessing system, affects revenue)

**Bug 3:**
- Severity: CRITICAL (data loss, security risk)
- Priority: BLOCKER (fix immediately before production)

**Bug 4:**
- Severity: LOW (doesn't affect functionality)
- Priority: MINOR/TRIVIAL (can update documentation whenever)

**Bug 5:**
- Severity: CRITICAL (system crash)
- Priority: MAJOR (affects small user segment, workaround exists, can wait)

---

## Next Time Someone Asks...

If someone asks "What's the severity?" → Focus on technical impact
If someone asks "What's the priority?" → Focus on business urgency

They're not the same thing! 🎯
