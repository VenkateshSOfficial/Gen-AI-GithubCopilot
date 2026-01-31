# Day 4 – Quick Reference & Interview Guide

## 🎯 Your Deliverables Summary

**What You've Received:**
✅ Complete defect lifecycle (JIRA example)
✅ Perfect bug report structure
✅ 4 sample defect reports (UI, Data, Intermittent, Security)
✅ Standard "severity vs. priority" explanation
✅ Tough examples with business context
✅ Interview-ready answers

---

## 📋 Bug Report Checklist (Save This!)

### Essential Components:
```
□ Title: Specific, searchable, includes condition
□ Priority: Blocker/Critical/Major/Minor/Trivial
□ Severity: Critical/Major/Medium/Low
□ Environment: Browser, OS, version, date/time, server
□ Preconditions: What must be true first
□ Steps: Numbered, exact, repeatable by anyone
□ Expected: What should happen
□ Actual: What really happens
□ Frequency: Always/Frequently/Intermittent/Rare
□ Evidence: Screenshots, video, logs, network trace
□ Impact: Business impact explained
□ Attachments: Supporting files included
```

---

## 🎬 The 4 Sample Reports You Have

| Report | Type | Key Issue | Priority | Severity |
|--------|------|-----------|----------|----------|
| **BUG-2401** | UI | Email field validation | Major | Major |
| **BUG-2402** | Data | Order total mismatch | Critical | Critical |
| **BUG-2403** | Intermittent | Dashboard won't load | Blocker | Major |
| **BUG-2404** | Security | SQL injection | Blocker | Critical |

---

## 💡 Severity vs. Priority in One Slide

```
SEVERITY = Technical Impact (How broken?)
├─ Critical: System crashed, data loss risk
├─ Major: Core feature broken
├─ Medium: Feature partially broken
└─ Low: Cosmetic issue, no functional impact

PRIORITY = Business Impact (How urgent?)
├─ Blocker: Stop everything
├─ Critical: Fix today
├─ Major: Fix this week
├─ Minor: Fix next sprint
└─ Trivial: Backlog

KEY: They're INDEPENDENT
• Low severity + High priority = Typo on payment page
• High severity + Low priority = Crash in unused feature
• Both high = Security vulnerability
• Both low = Help text typo
```

---

## 🎓 Your Perfect Interview Answers

### Q: "Walk me through writing a great bug report"

**Your Answer:**
"I start with a specific, searchable title that includes what's broken and when.
For example: 'Login button disabled for emails with plus sign' not just 'login broken.'

Then I include:
1. Environment details (browser, OS, version, date/time) - so it's reproducible
2. Preconditions - what must be true first
3. Numbered steps that anyone can follow
4. Expected vs. actual result - what should happen vs. what really happens
5. Evidence: screenshots for visual bugs, video for intermittent issues, logs for system bugs
6. Business impact - why this matters
7. Correct severity and priority

The key is being specific enough that someone in another country could reproduce
the exact issue without asking me questions. No vague descriptions."

---

### Q: "Explain severity and priority with examples"

**Your Answer:**
"Severity is technical impact, priority is business impact. They're independent.

For example:
• Typo in payment email: LOW severity (system works fine) but CRITICAL priority
  (all users see it, affects brand perception)

• App crashes loading huge reports: CRITICAL severity (system broken) but MAJOR
  priority (only affects 5% of power users, workaround exists)

The business decides priority based on who's affected and what it costs. That's
more important than how severe the bug is technically. A low-severity cosmetic
bug could be high priority if it affects the CEO's dashboard, while a severe
bug affecting .1% of users might be low priority.

This is why understanding business context matters in QA."

---

### Q: "What makes a bug report good vs. bad?"

**Your Answer:**
"A good bug report can be reproduced by anyone without talking to me. A bad report
makes the dev say 'I can't reproduce this, close it.'

Good reports have:
✓ Specific title (not just 'bug')
✓ Exact environment (Chrome 120 on Windows 11, not just 'chrome')
✓ Reproducible steps (numbered, exact)
✓ Specific test data (not generic values)
✓ Evidence (screenshot showing the problem)
✓ Expected vs. actual (clear difference)
✓ Business impact (why this matters)

Bad reports have:
✗ Vague titles ('it's broken')
✗ No environment details
✗ Steps like 'click some button'
✗ No evidence
✗ Just one sentence
✗ Can't be reproduced by anyone

The difference: a good report gets fixed. A bad one gets closed."

---

## 📊 Defect Lifecycle Quick Reference

```
NEW
 ↓
OPEN/ASSIGNED
 ↓
IN PROGRESS
 ↓
RESOLVED
 ↓
VERIFIED/CLOSED

Alternative paths:
→ INVALID (not a bug)
→ DUPLICATE (already reported)
→ CANNOT REPRODUCE (dev can't recreate)
→ WONTFIX (business decision)
→ REOPEN (fix didn't work)
```

---

## 🎯 Tough Examples (Memorize These)

### #1: Typo in Payment Page
```
Severity: LOW (just a typo)
Priority: CRITICAL (all users see it)
Fix: Today before business hours
Why: High visibility affects brand perception
```

### #2: Crash on Edge Case
```
Severity: CRITICAL (app crashes, data loss)
Priority: MAJOR (only 5% of users affected)
Fix: This sprint
Why: Affects few users, workaround available
```

### #3: Search Pagination Broken
```
Severity: MEDIUM (page 1 works, display issue)
Priority: BLOCKER (99% of searches hit this)
Fix: Today
Why: Core feature, affects nearly everyone
```

### #4: Security Vulnerability
```
Severity: CRITICAL (all accounts at risk)
Priority: BLOCKER (regulatory, legal risk)
Fix: Emergency patch NOW
Why: Both critical AND blocker - highest priority
```

---

## ✅ Before Your Interview

**Practice:**
- [ ] Write a bug report from memory
- [ ] Explain severity vs. priority with 2 examples
- [ ] Defend your severity/priority assessment
- [ ] Describe defect lifecycle
- [ ] Discuss how to handle "cannot reproduce" bugs
- [ ] Explain why evidence matters
- [ ] Show understanding of business context

**Have Ready:**
- [ ] Your 4 sample bug reports (know them well)
- [ ] Your severity vs. priority matrix
- [ ] Your tough examples
- [ ] Your interview answers

---

## 💪 Your Competitive Advantage

**Most QA candidates say:**
- "I write bug reports"
- "I put priority and severity"
- "I include steps to reproduce"

**YOU say:**
- "I write bug reports so detailed that anyone can reproduce them without asking questions"
- "I understand that severity (technical) and priority (business) are completely independent"
- "I've written 100+ bug reports with this structure and most get fixed immediately"
- "I use evidence and business context to justify my severity/priority assessment"

---

## 📁 Your Files

All in: `C:\Users\venkatesh_swaminatha\Desktop\Learn-gen-AI\day4\`

1. Day4_Part1_Defect_Management_Foundations.md
   └─ Lifecycle, structure, severity vs. priority explained

2. Day4_Sample_Defect_Reports.md
   └─ 4 production-ready bug reports (UI, Data, Intermittent, Security)

3. Day4_Severity_vs_Priority_Explanation.md
   └─ Your standard explanation with tough examples

4. Day4_Quick_Reference.md (this file)
   └─ Quick lookup before interviews

---

**Ready for Day 4 interviews!** 💪🎯
