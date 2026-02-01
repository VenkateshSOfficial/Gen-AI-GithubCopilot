# Day 4 – Part 1: Defect Management Foundations

## 🎯 Quick Overview

**Today's Focus:** Master practical defect management
1. **Defect Lifecycle** - How bugs move through stages
2. **Bug Report Structure** - What makes a GREAT bug report
3. **Severity vs. Priority** - The critical distinction
4. **DOR & DOD** - When work is ready

---

## 📚 Part 1: Understanding Defects

### What is a Defect?

**Definition:** A gap between expected behavior and actual behavior.

**Types of Defects:**
- Functional (Feature doesn't work)
- UI/UX (Visual issues)
- Performance (Too slow)
- Security (Vulnerability)
- Data (Corruption)
- Integration (Systems don't work together)
- Intermittent (Happens sometimes, not always)

---

## 📊 Defect Lifecycle (JIRA Example)

```
NEW → OPEN/ASSIGNED → IN PROGRESS → RESOLVED → VERIFIED → CLOSED

Alternative paths:
→ INVALID (not a bug)
→ DUPLICATE (already reported)
→ CANNOT REPRODUCE (dev can't recreate)
→ WONTFIX (business decision)
→ REOPEN (fix didn't work)
```

### Stage Details:

**1. NEW** (1-2 days)
- QA just filed the bug
- Ready for review
- Transition: → OPEN or → INVALID

**2. OPEN/ASSIGNED** (2-7 days)
- Dev team acknowledged
- Assigned to developer
- Status: OPEN or ASSIGNED

**3. IN PROGRESS** (1-5 days)
- Developer actively fixing
- Code changes being made

**4. RESOLVED** (Ready for QA)
- Dev marked fix complete
- Code committed and merged

**5. VERIFIED** (QA confirms)
- QA verified fix works
- Bug completely resolved

**6. CLOSED**
- Bug fixed and verified
- Ready for production

---

## 📋 Perfect Bug Report Structure

### 12 Essential Components:

```
1. TITLE: Specific, searchable
   ✅ "Login button disabled for emails with '+' character"
   ❌ "Login broken"

2. PRIORITY: Blocker/Critical/Major/Minor/Trivial

3. SEVERITY: Critical/Major/Medium/Low

4. ENVIRONMENT: Exact details
   ├─ Browser: Chrome 120.0.6099.129
   ├─ OS: Windows 11 Pro
   ├─ Version: 2.5.1
   ├─ Server: staging-us-east-1
   └─ Date/Time: 2026-01-31 14:30 PST

5. PRECONDITIONS: What must be true first
   ├─ User on login page
   ├─ No session cookies
   └─ JavaScript enabled

6. STEPS: Numbered, exact, repeatable
   1. Open https://example.com/login
   2. Click Email field
   3. Enter: testuser+1@example.com
   4. Click Login button

7. EXPECTED RESULT: What should happen
   └─ Login button enabled and clickable

8. ACTUAL RESULT: What really happens
   └─ Login button disabled (grayed out)

9. FREQUENCY: How often
   └─ Always (100% reproducible)

10. EVIDENCE: Prove it exists
    ├─ Screenshots
    ├─ Video recording
    ├─ Browser console logs
    └─ Network traces

11. BUSINESS IMPACT: Why it matters
    └─ Blocks 5% of users (Gmail aliases)

12. ATTACHMENTS: Supporting files
```

---

## 🎯 Severity vs. Priority

### Key Insight: They're INDEPENDENT

**SEVERITY = Technical Impact**
- Critical: System crashed, data loss
- Major: Core feature broken
- Medium: Feature partially broken
- Low: Cosmetic issue

**PRIORITY = Business Impact**
- Blocker: Stop everything
- Critical: Fix today
- Major: Fix this week
- Minor: Fix next sprint
- Trivial: Backlog

### Examples:

**Example 1: Typo in Payment Email**
- Severity: LOW (system works)
- Priority: CRITICAL (all users see it)

**Example 2: Crash on Edge Case**
- Severity: CRITICAL (system broken)
- Priority: MAJOR (only 5% affected)

**Example 3: Search Pagination Broken**
- Severity: MEDIUM (page 1 works)
- Priority: BLOCKER (99% of searches hit)

---

## 🎯 DOR (Definition of Ready)

**When:** BEFORE development starts
**Purpose:** Ensure requirements are READY

```
User story is ready when:
✅ Acceptance criteria specific (not vague)
✅ Design/wireframes attached
✅ Dependencies identified
✅ Test scenarios documented
✅ Test data provided
✅ Edge cases documented
✅ Effort estimated
✅ No unanswered questions
```

**Example:**
```
❌ NOT Ready: "User can register"
✅ Ready: "User can register with email/password"
   ├─ AC1: Valid registration works
   ├─ AC2: Weak password rejected
   ├─ Design: form-design.png attached
   ├─ Test data: 5 valid + 5 invalid emails
   └─ Ready for sprint!
```

---

## 🎯 DOD (Definition of Done)

**When:** AFTER development complete
**Purpose:** Ensure work is PRODUCTION-READY

```
Story is done when:
✅ Code written and reviewed
✅ Unit tests passing (95%+ coverage)
✅ Integration tests passing
✅ All acceptance criteria verified
✅ Security review completed
✅ Performance tested
✅ Documentation updated
✅ Database migrations included
✅ No critical/major bugs
```

**Example:**
```
❌ NOT Done: "Code written, works"
✅ Done: "Feature ready for production"
   ├─ Code reviewed and merged
   ├─ 24 unit tests passing
   ├─ 8 E2E tests passing
   ├─ Security review: Passed
   ├─ Performance: < 2 seconds
   └─ Ready for production!
```

---

## 🎓 Interview Answers Ready

**Q: "Explain severity and priority"**

"Severity is technical impact. Priority is business impact. They're independent.

A typo in payment email: LOW severity (works fine) but CRITICAL priority (all users see).

App crash on huge datasets: CRITICAL severity (broken) but MAJOR priority (only 5%).

The business decides priority. That's what matters."

---

**Q: "What's DOR and DOD?"**

"DOR ensures requirements are READY for development. DOD ensures work is READY for production.

DOR prevents: starting work on unclear requirements
DOD prevents: deploying buggy code

Together they ensure clear requirements → good development → production-ready."

---

This is your complete Day 4 foundation! 🎯
