# Day 4 – Sample Defect Reports: Production Ready

## 📋 DELIVERABLE 1: UI Bug Report

### BUG REPORT ID: BUG-2401
**Status:** NEW → ASSIGNED → IN PROGRESS → RESOLVED → VERIFIED → CLOSED

```
════════════════════════════════════════════════════════════════════════════════
BUG REPORT: UI Bug - Payment Button Disabled for Email with Plus Sign
════════════════════════════════════════════════════════════════════════════════

TITLE:
  "Login button disabled when email contains '+' character"

ISSUE TYPE:
  Bug

PRIORITY:
  Major

SEVERITY:
  Major

ENVIRONMENT:
  Browser: Chrome 120.0.6099.129
  OS: Windows 11 Pro (Build 22631.2861)
  App Version: 2.5.1 (Build 2401)
  Server: staging-us-east-1.example.com
  Date/Time Reported: 2026-01-31 14:30 PST
  Reporter: QA Test Engineer - John Smith
  
AFFECTED USERS:
  Estimated 5% of users (those using Gmail aliases like user+1@gmail.com)

────────────────────────────────────────────────────────────────────────────────
PRECONDITIONS:
────────────────────────────────────────────────────────────────────────────────
  • User is on login page
  • No existing session cookies
  • JavaScript is enabled
  • Using Chrome or Chrome-like browser
  • Email uses '+' character (Gmail alias format)

────────────────────────────────────────────────────────────────────────────────
STEPS TO REPRODUCE:
────────────────────────────────────────────────────────────────────────────────
  1. Open https://staging.example.com/login in Chrome
  2. Click in Email input field
  3. Enter email: testuser+1@example.com
  4. Press Tab to move to Password field
  5. Observe Login button
  
EXPECTED RESULT:
────────────────────────────────────────────────────────────────────────────────
  • Login button should remain ENABLED (clickable)
  • Button text should be white on blue background
  • Button should show pointer cursor on hover
  • Button should be clickable after entering email and password

ACTUAL RESULT:
────────────────────────────────────────────────────────────────────────────────
  • Login button appears DISABLED (grayed out, unclickable)
  • Button appears with gray background and dark text
  • Button shows "not-allowed" cursor on hover
  • User cannot click button even after entering valid password
  • After clicking away and back, button briefly flashes enabled then disabled
  
────────────────────────────────────────────────────────────────────────────────
FREQUENCY:
────────────────────────────────────────────────────────────────────────────────
  • Always reproducible: 100%
  • Steps above reproduce every time
  • Happens consistently with '+' character
  • Does NOT happen without '+' character

────────────────────────────────────────────────────────────────────────────────
EVIDENCE:
────────────────────────────────────────────────────────────────────────────────

  SCREENSHOT 1: Login page with disabled button
  └─ File: bug-2401-screenshot-1-disabled-button.png
  └─ Shows: Email input with "testuser+1@example.com" and grayed-out button
  
  SCREENSHOT 2: Same with email without plus (working)
  └─ File: bug-2401-screenshot-2-working-button.png
  └─ Shows: Email input with "testuser1@example.com" and blue enabled button
  
  BROWSER DEVELOPER CONSOLE LOG:
  └─ File: bug-2401-browser-console.log
  └─ Contains:
    - "Uncaught Error: Invalid email format: '+' character not allowed"
    - Stack trace pointing to validateEmail() function
    - JavaScript error in app.js line 453
    
  NETWORK REQUEST LOG:
  └─ File: bug-2401-network-trace.har
  └─ Shows: Form submission attempt fails silently
    - POST /api/auth/login not sent (validation blocks before API call)
    - Response: N/A (request never sent)

────────────────────────────────────────────────────────────────────────────────
BUSINESS IMPACT:
────────────────────────────────────────────────────────────────────────────────
  • Blocks approximately 5% of users from logging in
  • Primarily affects Gmail users using email aliases (user+label@gmail.com)
  • Gmail aliases are common for account security and filtering
  • Users might think account is locked or system is broken
  • Loss of trust in application
  • Estimated 50-100 users affected based on user analytics

────────────────────────────────────────────────────────────────────────────────
ROOT CAUSE ANALYSIS:
────────────────────────────────────────────────────────────────────────────────
  • validateEmail() function uses regex that doesn't allow '+' character
  • Plus character is valid per RFC 5321 for email addresses
  • Validation logic is overly restrictive
  • Function: app.js lines 450-460
  • Regex pattern: /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
  • Should be: /^[a-zA-Z0-9._+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/

────────────────────────────────────────────────────────────────────────────────
SUGGESTED FIX:
────────────────────────────────────────────────────────────────────────────────
  • Update email validation regex to include '+' character
  • Test with emails containing special characters
  • Verify backend also validates correctly
  • Add test cases for email alias formats

────────────────────────────────────────────────────────────────────────────────
RELATED ISSUES:
────────────────────────────────────────────────────────────────────────────────
  • Related to: BUG-2399 (Email validation failing for some formats)
  • Duplicate of: None identified
  • See also: Feature request FR-234 (Support all valid email formats)

────────────────────────────────────────────────────────────────────────────────
ATTACHMENTS:
────────────────────────────────────────────────────────────────────────────────
  ✓ bug-2401-screenshot-1-disabled-button.png (125 KB)
  ✓ bug-2401-screenshot-2-working-button.png (118 KB)
  ✓ bug-2401-browser-console.log (5 KB)
  ✓ bug-2401-network-trace.har (45 KB)
  ✓ bug-2401-reproduction-test.html (2 KB)

────────────────────────────────────────────────────────────────────────────────
COMMENT HISTORY:
────────────────────────────────────────────────────────────────────────────────

  [2026-01-31 14:32] QA Engineer - John Smith
  "Verified reproducibility. Can reproduce 100% of the time with + in email.
   Browser console shows validation error."
  
  [2026-01-31 15:00] Dev Lead - Sarah Chen
  "Thanks for the detailed report. Assigning to dev team. Looks like regex issue."
  
  [2026-01-31 16:30] Developer - Mike Johnson (ASSIGNED)
  "Investigating. Confirmed it's the validateEmail regex. Will fix today."
  
  [2026-02-01 10:00] Developer - Mike Johnson (IN PROGRESS)
  "Fix submitted for code review. Updated regex to include '+' character.
   Added 5 test cases for special characters in email."
  
  [2026-02-01 11:30] Code Reviewer - Alex Wong (RESOLVED)
  "Code review approved. Fix looks good. Merged to develop branch."
  
  [2026-02-01 14:00] QA Engineer - John Smith (VERIFIED)
  "Verified fix on staging. Login button now works with emails containing '+'.
   Tested with multiple Gmail alias formats. ✅ FIXED"

════════════════════════════════════════════════════════════════════════════════
```

---

## 📋 DELIVERABLE 2: Data Inconsistency Bug Report

### BUG REPORT ID: BUG-2402
**Status:** NEW → ASSIGNED → IN PROGRESS → CANNOT REPRODUCE → RESOLVED

```
════════════════════════════════════════════════════════════════════════════════
BUG REPORT: Data Inconsistency - Order Total Mismatch After Discount
════════════════════════════════════════════════════════════════════════════════

TITLE:
  "Order total shows incorrect amount after applying discount code with regional tax"

ISSUE TYPE:
  Bug

PRIORITY:
  Critical

SEVERITY:
  Critical

ENVIRONMENT:
  Browser: Safari 17.2
  OS: macOS 14.2.1
  App Version: 2.5.1 (Build 2401)
  Server: production-eu-west-1.example.com
  Date/Time Reported: 2026-01-31 09:15 GMT
  Reporter: Product Support Manager - Emma Patel
  Affected User: customer@retailcompany.co.uk
  
AFFECTED USERS:
  Estimated 2-5% of users in EU region with multi-item orders applying discounts

────────────────────────────────────────────────────────────────────────────────
PRECONDITIONS:
────────────────────────────────────────────────────────────────────────────────
  • User is logged in
  • Shopping cart has multiple items (at least 3)
  • Discount code is valid and applicable
  • User location: European Union (tax rate varies by country)
  • Browser localstorage enabled
  • Multiple API calls in flight (concurrent requests)

────────────────────────────────────────────────────────────────────────────────
STEPS TO REPRODUCE:
────────────────────────────────────────────────────────────────────────────────
  1. Login to account
  2. Add to cart:
     - Item A: £15.99 (qty: 1)
     - Item B: £24.50 (qty: 2)
     - Item C: £8.00 (qty: 1)
     └─ Subtotal: £58.49
  
  3. Navigate to checkout page
  4. Verify totals showing correctly:
     • Subtotal: £58.49
     • Tax (20% UK VAT): £11.70
     • Shipping: £5.00
     • Grand Total: £75.19
  
  5. Enter discount code: SAVE20 (20% off)
  6. Click "Apply Discount"
  7. Observe total recalculation
  
EXPECTED RESULT:
────────────────────────────────────────────────────────────────────────────────
  After applying 20% discount:
  • Subtotal: £46.79 (58.49 * 0.8)
  • Tax (20% of new subtotal): £9.36
  • Shipping: £5.00 (unchanged)
  • Discount applied to: Subtotal only
  • Grand Total: £61.15
  
  Order summary should show: "Discount applied: -£11.70"
  
  All values consistent across:
  • Order summary sidebar
  • Checkout page totals
  • Order confirmation email
  • Customer account order history
  • Backend database

ACTUAL RESULT:
────────────────────────────────────────────────────────────────────────────────
  After applying discount code:
  • Order summary sidebar shows: £61.15 ✓ (CORRECT)
  • Checkout page total shows: £75.19 ✗ (INCORRECT - old total)
  • Confirmation email shows: £60.79 ✗ (DIFFERENT - missing shipping)
  • Customer account order history shows: £61.15 ✓
  • Backend database shows: £75.19 ✗ (Order not discounted)
  • Payment processed: £75.19 (customer charged full price)
  
  INCONSISTENCIES:
  • Three different totals displayed ($61.15, $75.19, $60.79)
  • Frontend shows discount applied
  • Backend processed without discount
  • Customer charged full price despite discount display
  
────────────────────────────────────────────────────────────────────────────────
FREQUENCY:
────────────────────────────────────────────────────────────────────────────────
  • Intermittent: Happens 40-60% of attempts
  • More common when:
    - Using discount codes
    - In EU region (with VAT calculation)
    - Cart has multiple items
    - Multiple items with different tax treatments
  • Sometimes works correctly, sometimes doesn't
  
────────────────────────────────────────────────────────────────────────────────
EVIDENCE:
────────────────────────────────────────────────────────────────────────────────

  VIDEO RECORDING: Complete order flow with discount
  └─ File: bug-2402-video-order-flow.mp4 (2.5 MB, 3 min)
  └─ Shows: Each step clearly showing different totals
  
  SCREENSHOT 1: Checkout page with old total
  └─ File: bug-2402-checkout-page-wrong-total.png
  └─ Shows: Sidebar £61.15, but main total £75.19
  
  SCREENSHOT 2: Confirmation email
  └─ File: bug-2402-confirmation-email-different-total.png
  └─ Shows: Email total of £60.79
  
  BROWSER CONSOLE OUTPUT:
  └─ File: bug-2402-browser-console-debug.log
  └─ Shows network requests and calculations:
    - Request 1: Apply discount → returns £61.15
    - Request 2: Validate order → returns £75.19
    - Request 3: Process payment → uses £75.19 from database
    
  NETWORK TRACE WITH TIMING:
  └─ File: bug-2402-network-trace-waterfall.har
  └─ Shows: Race condition - discount API response arrives after checkout loaded
  
  DATABASE QUERY RESULTS:
  └─ File: bug-2402-database-query.sql
  └─ SELECT * FROM orders WHERE id=12345
  └─ Result: discount_amount = 0 (not applied in DB)

  PAYMENT PROCESSOR CONFIRMATION:
  └─ Email from Stripe: Transaction ID stripe_12345
  └─ Amount charged: £75.19 (no discount applied)

────────────────────────────────────────────────────────────────────────────────
BUSINESS IMPACT:
────────────────────────────────────────────────────────────────────────────────
  • CRITICAL: Revenue loss
    - Discount not applied but displayed (customer unhappy)
    - Customer charged full price but sees discount
  
  • CRITICAL: Customer service impact
    - Customers complaining about being overcharged
    - Support team has to manually refund
    - Affects customer trust
  
  • CRITICAL: Data integrity
    - Frontend and backend totals don't match
    - Order data inconsistent across systems
    - Makes debugging and auditing difficult
  
  • Financial impact:
    - Customer refund costs
    - Support staff time (manual investigation)
    - Potential chargebacks
    - Estimated £5,000-10,000 per day in refunds
  
  • Affected users: ~2-5% of EU checkout transactions
  
────────────────────────────────────────────────────────────────────────────────
ROOT CAUSE ANALYSIS:
────────────────────────────────────────────────────────────────────────────────
  
  Race condition between frontend and backend:
  
  1. Frontend applies discount immediately (optimistic update)
  2. Shows £61.15 to user (before API confirmation)
  3. Fetches tax calculation from API for EU region
  4. Meanwhile, backend still processing previous request
  5. When discount API response arrives (delayed), order already moved to checkout
  6. Backend never updated discount amount (request lost)
  7. Backend still shows old total £75.19
  8. Payment processor uses backend total (£75.19)
  
  Root: Frontend and backend not synchronized during discount application
  
  Cause: No request queuing or semaphore to ensure sequential processing
  
  Location: 
  • Frontend: checkout-service.ts lines 234-267 (optimistic update)
  • Backend: orders-api.js lines 450-480 (discount calculation)
  • Missing: Order lock mechanism during discount application

────────────────────────────────────────────────────────────────────────────────
SUGGESTED FIX:
────────────────────────────────────────────────────────────────────────────────
  
  Option 1 (Recommended): Backend-driven state
  • Frontend waits for backend confirmation before updating UI
  • Backend calculates and returns definitive total
  • Frontend displays only what backend confirms
  • Prevents race conditions
  
  Option 2: Order state lock
  • Lock order when discount is being applied
  • Prevent concurrent modifications
  • Unlock after discount application complete
  
  Option 3: Sequence number validation
  • Add sequence number to orders
  • Validate discount application is on current version
  • Reject if order was modified after discount initiated

────────────────────────────────────────────────────────────────────────────────
RELATED ISSUES:
────────────────────────────────────────────────────────────────────────────────
  • Related to: BUG-2398 (Race condition in tax calculation)
  • Related to: BUG-2400 (Payment amount mismatch)
  • Parent issue: BUG-2350 (Checkout flow stability issues)
  • See also: BUG-2401 (UI validation issue)

════════════════════════════════════════════════════════════════════════════════
```

---

## 📋 DELIVERABLE 3: Intermittent Bug Report

### BUG REPORT ID: BUG-2403
**Status:** NEW → ASSIGNED → CANNOT REPRODUCE → IN PROGRESS → RESOLVED

```
════════════════════════════════════════════════════════════════════════════════
BUG REPORT: Intermittent Bug - Dashboard Fails to Load Intermittently
════════════════════════════════════════════════════════════════════════════════

TITLE:
  "Dashboard occasionally fails to load - blank page with spinner for 30+ seconds"

ISSUE TYPE:
  Bug

PRIORITY:
  Blocker

SEVERITY:
  Major

ENVIRONMENT:
  Browser: Multiple (Chrome, Firefox, Safari)
  OS: Windows 11, macOS, Ubuntu 22.04
  App Version: 2.5.1 (Build 2401)
  Server: production-us-east-1.example.com
  Date/Time First Reported: 2026-01-30 18:45 PST
  Date/Time Escalated: 2026-01-31 08:00 PST
  Reporter: Customer Support - Multiple user reports
  
AFFECTED USERS:
  Reported by 30+ users in last 24 hours
  Approximately 5-10% of active sessions encounter this
  Pattern: No specific user group or feature set

────────────────────────────────────────────────────────────────────────────────
PRECONDITIONS:
────────────────────────────────────────────────────────────────────────────────
  • User is logged in
  • User navigates to Dashboard or Dashboard loads on login
  • User previously visited within same session
  • Browser has any version of Chrome, Firefox, or Safari
  • No obvious pattern to reproduce
  
────────────────────────────────────────────────────────────────────────────────
STEPS TO REPRODUCE:
────────────────────────────────────────────────────────────────────────────────
  
  REPRODUCIBLE STEPS (Inconsistent):
  1. Log in to application
  2. Navigate to Dashboard
  3. Wait for page to load
  4. OR: Refresh dashboard multiple times quickly
  5. OR: Leave browser tab inactive for 10+ minutes
  6. OR: Return to active tab
  
  ⚠️  These steps sometimes work, sometimes don't
  ⚠️  No consistent trigger identified yet
  ⚠️  Approximately 50% of attempts show the issue
  
ACTUAL RESULT (When Bug Occurs):
────────────────────────────────────────────────────────────────────────────────
  • Page is blank (white screen)
  • Spinner animation in center of screen
  • Page title shows "Loading..." or blank
  • Spinner continues spinning for 30-120 seconds
  • Eventually times out and shows: "Failed to load dashboard. Please refresh."
  • User must manually refresh page (F5)
  • Sometimes works on refresh, sometimes fails again
  
EXPECTED RESULT:
────────────────────────────────────────────────────────────────────────────────
  • Dashboard should load within 2-3 seconds
  • All widgets should display: Revenue chart, User metrics, Activity feed
  • No loading spinner after initial load
  • All data should be current and visible

FREQUENCY:
────────────────────────────────────────────────────────────────────────────────
  • Intermittent: Happens ~50% of page loads (sporadic)
  • Frequency: Not predictable
  • Pattern: No time pattern, no user pattern, no browser pattern
  • Duration of hang: 30-120 seconds before timeout
  • Severity of frequency: Makes feature unreliable

────────────────────────────────────────────────────────────────────────────────
EVIDENCE:
────────────────────────────────────────────────────────────────────────────────

  VIDEO 1: Dashboard fails to load (90 seconds)
  └─ File: bug-2403-video-failed-load.mp4
  └─ Shows: Blank page, spinner, then timeout error
  
  VIDEO 2: Dashboard loads successfully (same steps)
  └─ File: bug-2403-video-successful-load.mp4
  └─ Shows: Same steps, but works fine
  
  BROWSER CONSOLE ERRORS (When failure occurs):
  └─ File: bug-2403-console-error-log.txt
  └─ Contains:
    [ERROR] Failed to fetch dashboard data: Network timeout
    [WARN] Retrying request 1/3
    [WARN] Retrying request 2/3
    [ERROR] All retries exhausted
    [ERROR] Dashboard rendering failed: Cannot read properties of undefined
    
  NETWORK WATERFALL TRACE:
  └─ File: bug-2403-network-trace-failed.har
  └─ Shows: API requests timing out
    - GET /api/dashboard → Timeout after 60s
    - GET /api/widgets → Response 504 Gateway Timeout
    - GET /api/user-stats → No response (request cancelled)
    
  NETWORK TRACE (Successful Load):
  └─ File: bug-2403-network-trace-success.har
  └─ Shows: Same requests completing normally
    - GET /api/dashboard → 200 OK in 400ms
    - GET /api/widgets → 200 OK in 350ms
    - GET /api/user-stats → 200 OK in 280ms
  
  BROWSER PERFORMANCE METRICS (Failed):
  └─ File: bug-2403-performance-metrics-failed.json
  └─ Page Load Time: > 60000ms (timeout)
  └─ First Contentful Paint: Never happens
  └─ Time to Interactive: Never happens
  
  SERVER LOGS DURING FAILURE WINDOW:
  └─ File: bug-2403-server-logs-2026-01-31-18-45.log
  └─ Entries from 18:45-18:50 PST:
    [2026-01-31 18:45:23] GET /api/dashboard → Processing
    [2026-01-31 18:45:58] Timeout: API call to data service
    [2026-01-31 18:45:58] 504 Gateway Timeout returned to client
    [2026-01-31 18:45:58] Upstream service 'analytics-service' not responding
    
  USER REPORT COMPILATION:
  └─ File: bug-2403-user-reports-summary.txt
  └─ 35 user reports compiled:
    - 20 Chrome users (versions 118-121)
    - 10 Firefox users
    - 5 Safari users
    - All report same symptom: blank page, long loading
  
  CLOUDWATCH METRICS:
  └─ File: bug-2403-cloudwatch-dashboard.png
  └─ Shows spike in API response times 18:30-19:00 PST
  └─ Analytics service CPU jumped to 95% during spike
  └─ Traffic normal, no DDoS detected

────────────────────────────────────────────────────────────────────────────────
BUSINESS IMPACT:
────────────────────────────────────────────────────────────────────────────────
  • Users cannot access critical dashboard feature
  • Affects 5-10% of active sessions
  • No workaround available (must refresh)
  • Intermittent nature makes support difficult
  • User frustration and trust issues
  • Cannot determine root cause due to intermittent nature
  • May indicate infrastructure stability issue
  • P1 / Blocker priority - affects core feature

────────────────────────────────────────────────────────────────────────────────
POSSIBLE ROOT CAUSES (Needs Investigation):
────────────────────────────────────────────────────────────────────────────────
  
  Hypothesis 1: Backend service intermittent failure
  • Analytics service sometimes unresponsive
  • Timeout returns 504 Gateway Timeout
  • Intermittent pattern matches service latency spike
  • Solution: Check analytics service health logs
  
  Hypothesis 2: Race condition in data loading
  • Multiple API calls compete
  • One fails, entire page fails
  • Depends on timing of requests
  • Solution: Implement fallback for partial failures
  
  Hypothesis 3: Resource exhaustion on backend
  • Server runs out of connections during peak
  • New requests timeout waiting for connection
  • Intermittent when peaks occur
  • Solution: Check connection pool settings
  
  Hypothesis 4: Network issue (client side)
  • Client temporarily loses connectivity
  • Browser session becomes stale
  • Solution: Implement network resilience
  
  Hypothesis 5: Load balancer issue
  • Some backend instances unhealthy
  • Load balancer occasionally routes to dead instance
  • Solution: Check load balancer health checks

────────────────────────────────────────────────────────────────────────────────
TROUBLESHOOTING STEPS COMPLETED:
────────────────────────────────────────────────────────────────────────────────
  ✓ Verified issue reproducible by multiple users
  ✓ Confirmed across multiple browsers
  ✓ Confirmed across multiple operating systems
  ✓ Collected browser console errors
  ✓ Collected network traces
  ✓ Collected server logs during failure window
  ✓ Correlate with infrastructure metrics
  ✓ No pattern found yet (frustrating!)
  
  ✗ Exact reproduction steps unknown (intermittent)
  ✗ Root cause not yet identified
  ✗ Workaround not available
  ✗ Cannot test proposed fixes easily (hard to recreate)

────────────────────────────────────────────────────────────────────────────────
REQUESTED ACTIONS:
────────────────────────────────────────────────────────────────────────────────
  1. DevOps: Check analytics service health during failure windows
  2. Backend: Review API response times and timeouts
  3. Infrastructure: Monitor connection pools and resource limits
  4. Frontend: Implement retry logic with exponential backoff
  5. Monitor: Set up alerts for 504 responses and API timeouts

════════════════════════════════════════════════════════════════════════════════
```

---

## 📋 DELIVERABLE 4: Additional Critical Bug Example

### BUG REPORT ID: BUG-2404
**Additional Example - Security Issue**

```
════════════════════════════════════════════════════════════════════════════════
BUG REPORT: Security - SQL Injection Vulnerability in Search
════════════════════════════════════════════════════════════════════════════════

TITLE:
  "SQL injection vulnerability in product search - allows database access"

PRIORITY: Blocker
SEVERITY: Critical
ENVIRONMENT: production-us-east-1

DESCRIPTION:
  The search endpoint does not properly sanitize user input, allowing SQL
  injection attacks that could expose customer data.

STEPS TO REPRODUCE:
  1. Go to product search
  2. Enter: ' OR '1'='1
  3. Submit search
  
ACTUAL RESULT:
  Returns all products instead of error
  Potential attacker could execute: ' UNION SELECT user_passwords FROM users
  This would return all user passwords in plaintext

EXPECTED RESULT:
  Input should be sanitized
  Error message for invalid characters
  No data exposure possible

IMPACT: CRITICAL
  • User data exposure risk
  • Customer passwords could be compromised
  • Database access possible
  • Regulatory violation (data protection)
  • Must fix immediately

════════════════════════════════════════════════════════════════════════════════
```

---

Perfect sample defect reports showing different types of bugs with complete details!
