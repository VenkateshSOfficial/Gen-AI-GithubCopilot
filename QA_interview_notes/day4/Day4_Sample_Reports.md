# Day 4 – Sample Defect Reports (4 Production-Ready Examples)

## 📋 REPORT 1: BUG-2401 - UI Bug (Login Button Disabled)

```
TITLE: Login button disabled when email contains '+' character
PRIORITY: Major
SEVERITY: Major
ENVIRONMENT: Chrome 120, Windows 11, App v2.5.1, staging-us-east-1, Jan 31 2026 14:30 PST

PRECONDITIONS:
- User on login page
- No session cookies
- JavaScript enabled

STEPS:
1. Open login page
2. Click Email field
3. Enter: testuser+1@example.com
4. Press Tab
5. Observe Login button

EXPECTED: Login button enabled and clickable

ACTUAL: Login button disabled (grayed out, unclickable)

FREQUENCY: Always (100% reproducible)

EVIDENCE:
- Screenshot: button-disabled.png
- Console error: "Invalid email: '+' not allowed"
- Stack trace in app.js line 453

IMPACT: Blocks ~5% of users (Gmail alias users)

ROOT CAUSE: Regex validation too restrictive
- Current: /^[a-zA-Z0-9._-]+@/
- Should be: /^[a-zA-Z0-9._+-]+@/
```

---

## 📋 REPORT 2: BUG-2402 - Data Inconsistency (Order Total Mismatch)

```
TITLE: Order total shows different amounts in UI vs. payment processor
PRIORITY: Critical
SEVERITY: Critical
ENVIRONMENT: Safari 17.2, macOS 14.2, Production, EU region, Jan 31 2026 09:15 GMT

PRECONDITIONS:
- User logged in
- Cart has multiple items
- Discount code applied
- EU location (with VAT)

STEPS:
1. Add items to cart (£15.99, £24.50, £8.00)
2. Navigate to checkout
3. Verify totals (£75.19 expected)
4. Apply discount code SAVE20
5. Observe total recalculation

EXPECTED: Consistent total across all systems
- Sidebar: £61.15
- Email: £61.15
- Database: £61.15

ACTUAL: Three different totals displayed
- Sidebar: £61.15 ✓
- Email: £60.79 ✗
- Database/Payment: £75.19 ✗

FREQUENCY: Intermittent (40-60%)

EVIDENCE:
- Video: order-mismatch-3min.mp4
- Network trace: race-condition.har
- Database query: SELECT * FROM orders
  Result: discount_amount = 0 (not applied)
- Stripe confirmation: Charged £75.19

IMPACT: 
- Financial: £5K-10K/day in refunds
- Data integrity: Orders inconsistent across systems
- Business: Loss of trust

ROOT CAUSE: Race condition between frontend discount and backend processing
- Frontend applies discount optimistically
- Backend processes on old request
- Race condition wins → backend overwrites frontend update
```

---

## 📋 REPORT 3: BUG-2403 - Intermittent Bug (Dashboard Won't Load)

```
TITLE: Dashboard occasionally fails to load - blank page with spinner for 30+ seconds
PRIORITY: Blocker
SEVERITY: Major
ENVIRONMENT: Chrome/Firefox/Safari, Windows/macOS/Linux, Production, Jan 30-31 2026

PRECONDITIONS:
- User logged in
- User navigates to Dashboard
- No obvious pattern

STEPS:
1. Log in
2. Navigate to Dashboard
3. Wait for load

EXPECTED: Dashboard loads in 2-3 seconds with all widgets

ACTUAL: 
- Blank page for 30-120 seconds
- Spinner animation continuously spinning
- Eventually timeout error: "Failed to load dashboard"
- User must manually refresh

FREQUENCY: Intermittent (~50% of attempts)

EVIDENCE:
- Video (failed): dashboard-fail.mp4 (90 sec)
- Video (success): dashboard-success.mp4 (same steps, works)
- Console errors: "Failed to fetch dashboard data: Network timeout"
- Network trace: GET /api/dashboard → 504 timeout after 60s
- Server logs: "analytics-service not responding at 18:45"
- CloudWatch metrics: CPU spike to 95% during failure window

IMPACT:
- Blocks core feature (5-10% of users)
- No workaround available
- User frustration high
- Intermittent nature makes debugging hard

ROOT CAUSES (Hypothesis - needs investigation):
1. Backend service timeout (analytics service unresponsive)
2. Race condition in data loading
3. Resource exhaustion during peak times
4. Network issue on client side
5. Load balancer routing to unhealthy instance

TROUBLESHOOTING DONE:
- Multiple users reported (30+)
- Reproduced on multiple browsers/OS
- Collected network traces, console logs, server logs
- No consistent trigger identified yet
```

---

## 📋 REPORT 4: BUG-2404 - Security (SQL Injection)

```
TITLE: SQL injection vulnerability in product search endpoint
PRIORITY: Blocker
SEVERITY: Critical
ENVIRONMENT: Production, all browsers/OS

DESCRIPTION: Search endpoint doesn't sanitize user input

STEPS:
1. Go to product search
2. Enter: ' OR '1'='1
3. Submit search

ACTUAL: Returns ALL products (should error)

SECURITY RISK: Attacker could execute:
' UNION SELECT user_passwords FROM users --
This would return all user passwords

EXPECTED: Input sanitized, error message for invalid characters

IMPACT: 
- User data exposure risk
- All accounts vulnerable
- Regulatory violation (GDPR)
- Must fix immediately

ACTION: Emergency patch required
- Block until fixed
- Require mandatory code review
- Run security audit
```

---

These 4 reports show you ALL bug report types! 🎯
