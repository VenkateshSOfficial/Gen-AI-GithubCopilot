# Day 5: Practice Exercises & Solutions

## 🎯 Exercise Set 1: Story Lifecycle Practice

### Exercise 1.1: E-Commerce - "Add to Wishlist" Feature

**Situation**: You're assigned to test a new "Add to Wishlist" feature in an e-commerce platform. Walk through the entire story lifecycle with specific testing activities.

**Your Task**: Create a detailed breakdown for each phase.

---

### ✅ SOLUTION 1.1

**Phase 1: Backlog Grooming**

QA Questions Asked:
```
Q1: Can users add the same item to wishlist multiple times?
A1: No - duplicate addition should show message

Q2: What happens when you add while logged out?
A2: Show login prompt

Q3: Can users share wishlist with others?
A3: That's future scope, not in this story

Q4: Notification on wishlist add?
A4: No, wishlist updates silently

Q5: Max wishlist size?
A5: No limit for now

Q6: Mobile/Desktop responsive?
A6: Must work on all devices
```

Acceptance Criteria Refined:
```
AC1: User can add product from product page to wishlist
AC2: Add button shows confirmation message
AC3: Same product cannot be added twice (show "Already in wishlist")
AC4: Works while logged in
AC5: Logged-out users see login prompt
AC6: Wishlist icon shows count
AC7: Wishlist accessible from user menu
AC8: Works on mobile and desktop
```

---

**Phase 2: Sprint Planning**

Test Strategy Outlined:
```
Happy Path:
✓ Add product to wishlist while logged in
✓ Confirmation message shown
✓ Wishlist icon count updated

Edge Cases:
✓ Add while already in wishlist
✓ Add while logged out
✓ Mobile responsiveness
✓ Different browser support

Integration:
✓ Wishlist persists across sessions
✓ Count updates in real-time
✓ Share to social (if enabled)

Non-Functional:
✓ Load time <500ms
✓ No memory leaks
```

Definition of Done:
```
✓ All 12 test cases pass
✓ No P1/P2 bugs
✓ Code coverage >85%
✓ Critical test cases automated
✓ PO acceptance
✓ Mobile tested on 3+ devices
✓ Cross-browser tested (Chrome, Firefox, Safari, Edge)
```

QA Estimation: 2.5 story points (2-3 days testing)

---

**Phase 3: Development Phase**

QA Activities While Dev Codes:
```
Day 1-2 (Dev Development):

Test Case Design:
TC1: Login → Browse products → Click "Add to Wishlist" → Verify confirmation
TC2: Add same product again → Verify duplicate message
TC3: Logout and try adding → Verify login prompt
TC4: Mobile view (iPhone 12, 8) → Verify button visible and clickable
TC5: Tablet view (iPad) → Verify responsive layout
TC6: Different browsers → Verify consistency
TC7: Add then refresh page → Verify wishlist persists
TC8: Multiple tabs open → Add in one tab, verify count updates in other
TC9: XSS attempt in product name → Verify safe display
TC10: Add with network delay → Verify loading state
TC11: Add product, then delete from catalog → Verify wishlist handling
TC12: Performance test with 1000 items in wishlist → Verify add time <500ms

Test Data Preparation:
- 5 test products (various prices, categories)
- Test user accounts (free, premium tiers)
- Invalid data (null, empty, special chars)
- Performance data (1000 products)

Environment Setup:
- QA test database with products
- Test user accounts created
- Mobile devices/emulators configured
- Browser dev tools ready for monitoring

Traceability Matrix:
AC1 → TC1, TC3, TC7
AC2 → TC1, TC2
AC3 → TC2
AC4 → TC1, TC7
AC5 → TC3
AC6 → TC1, TC4, TC5
AC7 → TC1, TC8
AC8 → TC4, TC5, TC6
```

---

**Phase 4: QA Testing Phase**

Dev Marks "Ready for QA" on Day 3.

Test Execution Results:
```
TC1: Login, add to wishlist → Confirmation message shown ✓ PASS
TC2: Add same product again → "Already in wishlist" message ✓ PASS
TC3: Logged out, try adding → Login modal shown ✓ PASS
TC4: Mobile (iPhone 12) → Button responsive ✓ PASS
TC5: Mobile (iPhone 8) → Button slightly cut off ✗ FAIL
     BUG REPORT: Button overflow on small screens
     Severity: High | Priority: High
     Steps: iPhone 8 → Product page → "Add to Wishlist" button
     Expected: Button fully visible
     Actual: Button right edge cut off
     
TC6: Chrome, Firefox → ✓ PASS | Safari → ✗ FAIL
     BUG REPORT: Wishlist icon not visible in Safari
     Severity: High | Priority: High
     Browser: Safari 15.0
     Steps: Add to wishlist → Check icon in header
     Expected: Icon visible with count
     Actual: Icon missing, count not shown

TC7: Add then refresh → Wishlist persists ✓ PASS
TC8: Multiple tabs → Count updates in real-time ✓ PASS
TC9: XSS attempt (<script>alert('xss')</script>) → Blocked ✓ PASS
TC10: Network delay → Loading spinner shown ✓ PASS
TC11: Add then delete product → Graceful removal ✓ PASS
TC12: 1000 items, add → Response time 120ms ✓ PASS
```

Bugs Reported:
```
BUG #1: Button overflow on iPhone 8
- Dev: Uses CSS media query fix
- Fix time: 30 minutes
- Re-test: TC4, TC5 → PASS

BUG #2: Safari icon not displaying
- Dev: Icon font issue in Safari, fix with fallback
- Fix time: 45 minutes
- Re-test: TC6 → PASS
```

Final Test Execution (After Fixes):
```
✓ TC1: PASS
✓ TC2: PASS
✓ TC3: PASS
✓ TC4: PASS
✓ TC5: PASS (Re-tested)
✓ TC6: PASS (Re-tested)
✓ TC7: PASS
✓ TC8: PASS
✓ TC9: PASS
✓ TC10: PASS
✓ TC11: PASS
✓ TC12: PASS

TOTAL: 12/12 PASS ✓
CODE COVERAGE: 89% ✓
NO CRITICAL BUGS ✓
```

---

**Phase 5: Done Criteria Verification**

Checklist:
```
✓ All 12 test cases executed and passed
✓ No P1/P2 bugs remaining (BUG #1, #2 fixed)
✓ Code coverage: 89% (exceeds target of 85%)
✓ Critical test cases (TC1, TC2, TC7) automated in CI/CD
✓ Product Owner accepted feature
✓ Mobile tested on iPhone 8, iPhone 12, Android
✓ Cross-browser tested on Chrome, Firefox, Safari, Edge
✓ Test cases documented with traceability to AC
✓ Documentation complete (user help text added)
✓ Performance metrics: Add operation <500ms, sustained under load
```

Automation Implementation:
```
Selenium Script (Critical Path):
- Login → Add to wishlist → Verify success message
- Run: Every commit
- Time: 45 seconds
- Flakiness: <1%

Test Framework: TestNG
- Page Object Model used
- No hard waits (Explicit waits only)
- Screenshot on failure
```

---

**What QA Delivered**:
✅ 12 comprehensive test cases
✅ Found and helped fix 2 bugs
✅ 12/12 tests passing
✅ 89% code coverage
✅ Automated critical flows
✅ Cross-browser/mobile verified
✅ PO acceptance obtained
✅ Confidence: HIGH for production

---

---

## 🎯 Exercise Set 2: Regression Decision Making

### Exercise 2.1: "Apply Coupon Code" - Feature Modification

**Situation**: 
Your team is modifying the coupon application logic. Previously, users could apply unlimited coupons. Now, the system allows only 1 coupon per order and automatically selects the highest discount.

**Changes Made**:
- Modified `applyCoupon()` method
- Added `validateCouponLimit()` check
- Added `selectBestDiscount()` logic
- Database schema change to store coupon history

**Your Task**: Decide regression scope. What do you test and why?

---

### ✅ SOLUTION 2.1

**Step 1: Risk Assessment**

Affected Areas:
```
DIRECTLY AFFECTED:
- Coupon application logic
- Coupon validation
- Discount calculation
- Shopping cart display

INDIRECTLY AFFECTED:
- Checkout flow
- Order creation
- Payment processing
- Invoice/receipt generation
- Email notifications
- Refund logic

POTENTIALLY AFFECTED:
- User account order history
- Coupon management (admin)
- Reports/Analytics
- Loyalty program integration
```

---

**Step 2: Regression Scope Decision**

**TIER 1 - CRITICAL (100% Regression, 100% Automated)**
```
Area: Coupon application core logic
Scope:
✓ Apply valid coupon → Discount calculated correctly
✓ Apply 2nd coupon → Only highest discount kept
✓ Remove coupon → Discount removed
✓ Apply expired coupon → Error message
✓ Apply invalid coupon → Error message
✓ Coupon with minimum purchase → Validated correctly
✓ Coupon with max usage limit → Honored
✓ Category-specific coupon → Applied only to matching items

Test Cases: 8
Time: 30 minutes (automated)
Frequency: Every build
Automation: Selenium + TestNG
Critical: Yes - core feature change
```

**TIER 2 - IMPORTANT (80% Regression, 80% Automated)**
```
Area: Checkout & Payment integration
Scope:
✓ Apply coupon → Add to cart → Checkout → Verify price
✓ Apply coupon → Enter shipping → Verify final total
✓ Apply coupon → Payment processing → Order creation
✓ Coupon applied → Refund flow → Coupon handling
✓ Coupon in order history → Display correctly
✓ Invoice/receipt → Shows applied coupon and discount

Test Cases: 6
Time: 45 minutes (mostly automated)
Frequency: Daily
Automation: Selenium for flows, API for order verification
Critical: Yes - payment critical path
```

**TIER 3 - MEDIUM (60% Regression, 70% Automated)**
```
Area: Email notifications & Order management
Scope:
✓ Order confirmation email → Shows coupon discount
✓ Order refund email → References coupon history
✓ Admin order view → Displays coupon info
✓ User order history → Shows applied coupon
✓ Coupon usage count → Updated in admin dashboard

Test Cases: 5
Time: 1 hour
Frequency: Weekly
Automation: API tests for email content, Selenium for UI
Critical: No - but impacts customer communication
```

**TIER 4 - LOW (30% Regression, Manual)**
```
Area: Tangentially related
Scope:
✓ Loyalty program points → Calculated on discounted price
✓ Gift cards → Don't stack with coupons (expected)
✓ Promotional bundles → Work with coupon logic
✓ Mobile cart → Coupon application

Test Cases: 4
Time: 45 minutes
Frequency: Quarterly or before major release
Automation: Manual testing (lower risk, less frequent)
Critical: No - secondary features
```

**NOT INCLUDED - Low Impact**
```
✗ Product page UI changes (unrelated)
✗ User profile (isolated feature)
✗ Wishlist functionality (separate module)
✗ Search feature (no interaction)

Reason: Zero interaction with coupon logic,
save testing time, focus on high-risk areas
```

---

**Step 3: Test Cases by Priority**

**CRITICAL TIER TEST CASES** (Run Every Build - 30 min)

```
TC-COUPON-01: Valid Single Coupon Application
Test Steps:
1. Browse catalog
2. Add item ($100) to cart
3. Apply coupon code "SAVE20" (20% off)
4. Verify discount: $20
5. Verify total: $80

Expected: ✓ Discount applied, total correct
Automation: Selenium + TestNG
Risk: Critical

TC-COUPON-02: Multiple Coupon - Highest Selected
Test Steps:
1. Add item ($100) to cart
2. Apply "SAVE20" (20% off = $20)
3. Apply "SAVE10" (10% off = $10)
4. Verify only highest discount: $20
5. Verify total: $80

Expected: ✓ Only $20 discount, not both
Automation: Selenium + TestNG
Risk: Critical (new feature)

TC-COUPON-03: Remove Coupon
Test Steps:
1. Apply coupon (20% off)
2. Verify discount applied
3. Remove coupon
4. Verify discount removed, total reset

Expected: ✓ Original price shown
Automation: Selenium + TestNG
Risk: Critical

TC-COUPON-04: Expired Coupon
Test Steps:
1. Try to apply expired coupon (expired 2024-01-01)
2. Verify error message: "Coupon expired"
3. Verify no discount applied

Expected: ✓ Error shown, no discount
Automation: Selenium + TestNG
Risk: Important (validation logic)

TC-COUPON-05: Minimum Purchase Not Met
Test Steps:
1. Apply coupon requiring $200 minimum
2. Add item $100 to cart
3. Verify error: "Minimum purchase $200"
4. Add 2nd item
5. Verify coupon now applies

Expected: ✓ Validation enforced
Automation: Selenium + TestNG
Risk: Important

TC-COUPON-06: Category-Specific Coupon
Test Steps:
1. Coupon valid for "Electronics" only
2. Add "Laptop" ($1000, Electronics) → Apply → Works ✓
3. Add "Book" ($20, Books) → Apply → Error ✗

Expected: ✓ Category validation works
Automation: Selenium + TestNG
Risk: Important

TC-COUPON-07: Coupon Max Usage Limit
Test Steps:
1. Coupon has max 5 uses
2. Use 5 times with different orders
3. Try 6th time
4. Verify error: "Coupon limit reached"

Expected: ✓ Limit enforced
Automation: Rest Assured (API test better for this)
Risk: Important (limit logic)

TC-COUPON-08: Coupon + Tax Calculation
Test Steps:
1. Add item $100 to cart
2. Apply 20% coupon → $80
3. Tax 10% on $80 = $8
4. Verify final total: $88 (not $100 + tax)

Expected: ✓ Tax calculated on discounted price
Automation: Selenium + TestNG
Risk: Important (financial)
```

---

**IMPORTANT TIER TEST CASES** (Run Daily - 45 min)

```
TC-CHECKOUT-01: Coupon → Cart → Checkout → Payment
Test Steps:
1. Add item to cart
2. Apply coupon
3. Verify discount in cart
4. Proceed to checkout
5. Verify discount still shows
6. Enter shipping address
7. Verify final total includes discount
8. Complete payment
9. Verify order created with coupon

Expected: ✓ Discount maintained through checkout
Automation: Selenium + TestNG (integrated flow)
Risk: Critical (payment flow)

TC-CHECKOUT-02: Coupon Application in Checkout Page
Test Steps:
1. Add item to cart, go to checkout WITHOUT applying coupon
2. In checkout page, apply coupon
3. Verify discount applies
4. Verify total updates

Expected: ✓ Apply-in-checkout works
Automation: Selenium
Risk: Important

TC-ORDER-01: Coupon in Order Confirmation Email
Test Steps:
1. Apply coupon, complete order
2. Check order confirmation email
3. Verify coupon code shown
4. Verify discount amount shown
5. Verify final total shown

Expected: ✓ Coupon details in email
Automation: Rest Assured (API to get email content)
Risk: Important (customer communication)

TC-ORDER-02: Order History Shows Coupon
Test Steps:
1. Apply coupon, create order
2. Login to account
3. View order history
4. Click on specific order
5. Verify coupon applied shows in details

Expected: ✓ Coupon visible in order details
Automation: Selenium
Risk: Important

TC-REFUND-01: Refund with Coupon Applied
Test Steps:
1. Order with 20% coupon discount
2. Refund entire order
3. Verify refund amount = original discounted price
4. Verify coupon marked as used/available for reuse per policy

Expected: ✓ Refund calculation correct
Automation: Rest Assured (refund API)
Risk: Important (financial)

TC-ADMIN-01: Admin Coupon Dashboard Updated
Test Steps:
1. Apply coupon in customer flow
2. Login as admin
3. Check coupon usage stats
4. Verify usage count increased
5. Verify last used date updated

Expected: ✓ Admin dashboard reflects usage
Automation: Rest Assured (admin API)
Risk: Important
```

---

**Step 4: Automation Strategy**

What I Automate (80%+ of regression):
```
✅ Critical coupon logic (apply, remove, validate)
✅ Checkout integration (cart → payment)
✅ API tests for coupon service
✅ Order creation and data verification
✅ Email notification content (via API)
✅ Refund processing with coupons
✅ Admin dashboard updates

Tools: Selenium (UI), Rest Assured (API), TestNG (framework)
CI/CD: Run on every commit
Execution: ~45 minutes for full regression
Parallelization: 4 threads for 45 min → 12 min

Framework: Page Object Model
Data: Test database reset between runs
Assertions: Multiple per test case
Screenshots: On failure
```

What I Keep Manual (20%):
```
❌ Visual regression (discount display styling)
❌ Exploratory testing (edge cases discovered)
❌ Performance optimization testing
❌ Different payment gateways (manual setup)
❌ Physical coupon codes (manual entry testing)

When: Weekly exploratory session + before release
Time: 2-3 hours
Scope: Edge cases, unusual combinations, UX quality
```

---

**Step 5: Risk-Based Execution Plan**

If Time is Short:
```
30 minutes available?
→ Run Critical Tier only (TIER 1) - TC-COUPON-01 through TC-COUPON-08
→ Result: Core feature validated, high confidence

2 hours available?
→ Run TIER 1 (30 min) + TIER 2 (45 min) + partial TIER 3
→ Result: Feature + checkout integration validated

4 hours available?
→ Run TIER 1 + TIER 2 + TIER 3 + exploratory
→ Result: Comprehensive regression, very high confidence

What NOT to run if time-pressed?
→ TIER 4 (low priority) - defer to quarterly
→ Exploratory testing - schedule for next week
→ Non-functional tests - focus on functional first
```

---

**Step 6: Metrics & Success Criteria**

```
METRIC: Test Pass Rate
TARGET: >98%
THRESHOLD: If <95%, investigate failures

METRIC: Regression Coverage
TARGET: >90% of changed code
MEASUREMENT: Code coverage tools + test traceability

METRIC: Execution Time
TARGET: <60 minutes for daily regression
MEASUREMENT: CI/CD pipeline execution time

METRIC: Bug Detection Rate
TARGET: Catch 90% of bugs before production
MEASUREMENT: Defects found in QA vs after release

METRIC: Automation ROI
TARGET: Each test run saves 2 hours manual testing time
CALCULATION: (Time saved per run) / (Maintenance effort) > 2

METRIC: Confidence Level
ASSESSMENT: High (if >95% tests pass, coverage good)
COMMUNICATION: "Ready for production with high confidence"
```

---

**Summary - Regression Scope for "Coupon" Feature**:

```
TOTAL REGRESSION EFFORT: 3-4 hours
├─ CRITICAL (30 min): Every build, 100% automated
├─ IMPORTANT (45 min): Daily, 80% automated
├─ MEDIUM (1 hour): Weekly, 70% automated
└─ LOW (45 min): Quarterly, 30% automated

RISK MITIGATION:
✓ Critical paths 100% automated and running on every commit
✓ Payment flow thoroughly tested (financial impact high)
✓ Email notifications verified (customer impact)
✓ Admin dashboard validated (operational impact)

CONFIDENCE LEVEL: Very High
Decision: READY FOR PRODUCTION
```

---

---

## 🎯 Exercise Set 3: Time-Constrained Testing

### Exercise 3.1: "4 Hours to Test" Scenario

**Situation**:
Sprint ends tomorrow. A critical feature "Bulk Product Upload" just finished development. Full regression testing would take 8 hours, but you have only 4 hours before the release candidate needs to be built.

**What Do You Do?**

Your Task: Create a prioritized testing plan with clear trade-offs.

---

### ✅ SOLUTION 3.1

**Step 1: Situation Assessment** (5 minutes)

```
FACTS:
✓ 4 hours available for testing
✓ 8 hours needed for full regression
✓ This is release-critical
✓ Feature is complex (bulk operations)
✓ High business impact (inventory management)
✓ No extension possible

DECISION: Risk-based prioritization + parallel testing
```

---

**Step 2: Risk Assessment** (10 minutes)

```
Feature Complexity: HIGH
- Bulk file import (CSV parsing)
- Product validation logic
- Database transaction handling
- Inventory update synchronization
- Error handling and rollback

Business Impact: CRITICAL
- Affects inventory accuracy
- Used by internal team daily
- Connected to supply chain
- Payment/fulfillment depends on it

Change Scope: LARGE (>500 lines code change)
- File parsing logic completely rewritten
- New transaction manager
- Modified database schema
- Integration with third-party API

Regression Risk: VERY HIGH
- Many integration points
- Previous upload bugs in same area
- New team member implemented (less familiar)
- Time-crunched development (higher bug likelihood)

RECOMMENDATION: Need to test smartly, cannot skip critical areas
```

---

**Step 3: Tiered Testing Plan** (4-hour Window)

**HOUR 0-0.5: Smoke Test (30 minutes)** ⚡ Must-Pass

```
Critical Path Test (Automated):
1. Upload valid CSV file (50 products)
   ✓ File format accepted
   ✓ Products parsed correctly
   ✓ No errors during import
   ✓ Database updated
   ✓ Inventory reflects new products

If FAILS: STOP. Do NOT proceed. Report blocker immediately.
If PASSES: Continue to next phase.

Time: 5 minutes manual
Automation: Selenium/Restful API
Owner: You + 1 team member
```

---

**HOUR 0.5-2: Core Functionality Testing (90 minutes)** 🔥 High Priority

```
PARALLEL TESTING: Assign to team members

Path A - Validation & Error Handling (45 min):
You: Test error scenarios
- Invalid CSV format (wrong headers, missing columns)
- Duplicate products (same SKU)
- Invalid prices (negative, text)
- Missing required fields
- File too large (>100MB)
- Encoding issues (UTF-8 vs ASCII)

Test Cases:
TC1: Upload CSV with wrong headers → Error message shown
TC2: Upload with duplicate SKUs → Duplicates rejected or merged
TC3: Upload with negative prices → Validation error
TC4: Upload with missing required fields → Specific error for each missing field
TC5: Upload 100MB file → "File too large" error or timeout graceful handling
TC6: Upload non-UTF8 encoding → Handles gracefully or converts

Result: Pass/Fail on each scenario
Time: 45 minutes

Path B - Successful Upload Scenarios (45 min):
Colleague: Test happy paths
- Small batch (10 products)
- Medium batch (100 products)
- Large batch (500 products)
- Different product types (simple, with variants)
- Category assignments
- Price updates for existing products

Test Cases:
TC7: Upload 10 valid products → All imported, counts match
TC8: Upload 100 valid products → All imported correctly
TC9: Upload 500 products → Performance acceptable (<5 min)
TC10: Upload different product categories → Categories assigned correctly
TC11: Update existing product prices → Changes reflected
TC12: Products with images → Images linked correctly

Result: Pass/Fail on each scenario
Time: 45 minutes

Parallel Execution: Run both paths simultaneously
Total Time: 45 minutes (not 90)
```

---

**HOUR 2-3: Integration & Data Integrity Testing (60 minutes)** 📊 Medium Priority

```
DIVIDE & CONQUER: Assign parallel tasks

Path C - Integration Points (30 min):
You: Database & system integration
- Inventory accuracy after import
- Stock quantity synchronization
- Price changes reflected in catalog
- Product availability updates
- Search index updated
- Reports/analytics include new products

Test Cases:
TC13: Upload products → Check inventory count matches
TC14: Import price change → Frontend catalog shows updated price
TC15: Import set availability → Products show in-stock on site
TC16: Search new products → Found in search within 1 minute
TC17: Daily report → Includes newly imported products

Path D - User Experience (30 min):
Colleague: UI and notifications
- Success notification clear
- Error messages helpful
- Progress indicator (if bulk takes time)
- Retry mechanism for failed items
- History/audit log of uploads

Test Cases:
TC18: Successful upload → Confirmation shows count imported
TC19: Partial failure → Shows which items failed and why
TC20: Long upload (500 items) → Progress indicator present
TC21: Failed items → Option to retry or download error report
TC22: Admin can see upload history with timestamps

Parallel Execution: Both running simultaneously
Total Time: 30 minutes (not 60)
```

---

**HOUR 3-4: Exploratory & Edge Cases (60 minutes)** 🔍 Medium-Low Priority

**Compressed to 30 minutes**: Intelligent sampling

```
Exploratory Testing (Manual - 20 min):
You: Test unusual scenarios
- What if user clicks "Upload" multiple times?
- What if network drops mid-upload?
- What if CSV has inconsistent delimiters (comma vs semicolon)?
- What if product SKU has special characters?
- What if file is empty?
- What if user is unauthorized?

Critical Edge Cases Only:
EC1: Multiple clicks on upload button
     → Only one import should occur (prevent duplicates)
     → Expected: CRITICAL

EC2: Network failure mid-upload
     → Transaction rolls back, no partial data
     → Expected: CRITICAL for data integrity

EC3: Unauthorized user attempts upload
     → Access denied, no import
     → Expected: SECURITY

Edge Cases to SKIP (time not available):
- Browser compatibility testing (different browsers)
- Performance under concurrent uploads
- API rate limiting scenarios
- Advanced error recovery
```

---

**Communication & Risk Documentation** (Last 30 min of Hour 4)

```
What You Tested (4 hours):
✓ Smoke test - Core happy path
✓ 12 validation & error scenarios
✓ 5 successful upload sizes
✓ Database integrity checks
✓ Integration points
✓ UI notifications
✓ 3 critical edge cases

Total Test Cases: 22 (out of full 40-50 cases)
Coverage: ~60% of full regression
Critical Coverage: 95%
Automation: 70% of tests automated for future regression

What You Did NOT Test (due to time):
✗ Browser compatibility (defer to staging)
✗ Performance limits (defer to staging)
✗ Concurrent uploads (defer to staging)
✗ API rate limiting (defer to staging)
✗ Advanced recovery scenarios
✗ Long-term data consistency

Status Summary Report:
┌─────────────────────────────────────────┐
│ SMOKE TESTS: ✅ ALL PASS (100%)         │
│ VALIDATION: ✅ 11/11 PASS (100%)        │
│ HAPPY PATH: ✅ 5/5 PASS (100%)          │
│ INTEGRATION: ✅ 4/5 PASS (80%)          │
│ EDGE CASES: ⚠️  3/3 PASS (100%) - Limited │
│                                         │
│ OVERALL: PASS - Ready for RC            │
│ CONFIDENCE: MEDIUM-HIGH                 │
│ KNOWN RISKS: See below                  │
└─────────────────────────────────────────┘

Confidence Justification:
+ Smoke tests all pass
+ Critical validations covered
+ Happy paths verified
+ Data integrity intact
- Didn't test 40% of scenarios
- Browser compatibility unknown
- Performance not validated
- Edge cases only sampled

Risk Assessment:
HIGH RISK if:
- Concurrent uploads attempted (not tested)
- Non-standard file formats used (limited testing)
- Performance critical for 500+ items (not tested)

LOW RISK:
- Basic file upload (thoroughly tested)
- Data integrity (verified)
- Error handling (comprehensive testing)

MITIGATION STRATEGIES:
1. Monitor production closely for first week
2. Have rollback plan ready
3. Communicate known limitations to stakeholders
4. Schedule full regression for staging environment
5. Plan extended testing if issues arise
```

---

**Recommendation to Stakeholders**:

```
TO: Dev Manager, Product Owner
FROM: QA Engineer
RE: Bulk Upload Feature - Test Coverage & Risk Assessment

STATUS: Ready for Release Candidate (with conditions)

WHAT WAS TESTED (4 hours):
✓ Core functionality - Happy path complete
✓ Error handling - Validation scenarios comprehensive  
✓ Data integrity - Database accuracy verified
✓ Critical edge cases - Sampled top 3 risks
✓ User experience - Notifications and feedback tested

CONFIDENCE LEVEL: MEDIUM-HIGH (70%)
For a critical feature, this is acceptable given time constraints,
because we tested all critical paths and data integrity.

WHAT WILL BE TESTED IN STAGING:
(Before moving to production)
✓ Browser compatibility (Chrome, Firefox, Safari, Edge)
✓ Performance with large datasets (500+, 1000+ products)
✓ Concurrent uploads (multiple users simultaneously)
✓ Network resilience (drops, timeouts)
✓ API integration completeness
✓ Reporting and audit logs

RISK LEVEL: Medium
We are confident in core functionality but need staging validation
for performance and edge cases.

RECOMMENDATION: 
Proceed to Release Candidate and staging.
Plan 2-hour staging regression before production deployment.
Have rollback procedure ready just in case.

Contact: On-call for issues during staging & release process
```

---

**Lesson for Future**:

```
What went well:
✓ Prioritized by risk
✓ Used parallel testing
✓ Automated repetitive tests
✓ Clear communication of limitations
✓ Focused on critical paths

What to improve:
✗ Started testing late (sprint should include test time)
✗ No continuous testing during development
✗ Limited automation coverage

Recommendation for next sprint:
- Test during development (not after)
- Have 50% automation baseline before sprint ends
- Budget 20% of sprint for testing, not squeeze it at end
- Use CI/CD for continuous testing throughout sprint
```

---

---

## 🎯 Exercise Set 4: Complex Story with Multiple Dependencies

### Exercise 4.1: "Guest to Registered User Conversion"

**The Feature**:
User starts as guest, adds items to cart, then registers during checkout. Cart merges with any existing account cart, and they get 5% registration bonus discount.

**Complexities**:
- Session management changes
- Cart merge logic
- Discount application
- Email notifications
- Loyalty program updates
- Database transactions

**Your Task**: Design complete regression strategy with specific test cases for all dependencies.

---

### ✅ SOLUTION 4.1

**Phase 1: Dependency Mapping**

```
GUEST → REGISTER → MERGE → DISCOUNT → ORDER

Dependencies:
├─ Session Management (new requirement)
├─ Cart System (affected by merge)
├─ User Accounts (new registration flow)
├─ Discount Engine (bonus discount logic)
├─ Email Service (registration confirmation)
├─ Loyalty Program (bonus points)
├─ Payment Gateway (existing cart + new discount)
├─ Inventory System (cart items affected by merge)
└─ Analytics (new conversion tracking)

RISK AREAS:
🔴 CRITICAL: Data loss during cart merge
🔴 CRITICAL: Discount double-counting
🔴 CRITICAL: Session/auth issues post-registration
🟡 MEDIUM: Email delivery timing
🟡 MEDIUM: Loyalty points calculation
🟢 LOW: Analytics tracking accuracy
```

---

**Phase 2: Regression Scope by Dependency**

**REGRESSION FOR CART MERGE** (Most complex)

```
Test Suite: Cart Merge (15 test cases)

Scenario 1: Guest Adds Items, Then Registers

TC1: Guest adds 1 item → Register → Item still in cart
- Steps: Add laptop ($1000) → Register → Check cart
- Expected: Laptop in cart, quantity 1
- Risk: Item loss

TC2: Guest adds multiple items → Register → All items present
- Steps: Add laptop, mouse, keyboard → Register → Check all 3
- Expected: All items in cart with correct quantities
- Risk: Partial item loss

TC3: Guest adds same item twice → Register → Correctly merged
- Steps: Add laptop (qty 1), add again → Register → Check qty
- Expected: Qty 2, not 1
- Risk: Quantity loss in merge

Scenario 2: Guest + Account Cart Merge

TC4: Guest with items + existing account → Register with same email
- Steps: Guest adds $100 item → Register with existing email → Check merge
- Expected: Both guest items + account items in cart
- Risk: One cart overwritten

TC5: Duplicate items in guest + account cart → Merge correctly
- Steps: Guest cart: Laptop qty 2; Account cart: Laptop qty 3 → Merge
- Expected: Laptop qty 5 (or as per business rule)
- Risk: Data loss or incorrect sum

TC6: Different items in guest + account cart → All preserved
- Steps: Guest: Mouse, Keyboard; Account: Monitor, Headphones → Merge
- Expected: All 4 items in merged cart
- Risk: One cart's items lost

Scenario 3: Cart Prices & Discounts During Merge

TC7: Guest cart with outdated price → Merge uses current price
- Steps: Guest adds item (saw $100) → Price changed to $120 → Register → Verify price
- Expected: Uses current price ($120)
- Risk: Incorrect pricing

TC8: Account cart had coupon → Persists after merge
- Steps: Account had "SAVE20" coupon → Guest merges → Check coupon
- Expected: Coupon still applied
- Risk: Lost coupon

TC9: Out of stock item in guest cart → Handled during merge
- Steps: Guest cart has out-of-stock item → Register → Check handling
- Expected: Item flagged/removed with notification
- Risk: Checkout with unavailable item

Scenario 4: Edge Cases

TC10: Guest with empty cart → Register
- Expected: Can still register, empty cart persists
- Risk: Registration blocked if cart empty

TC11: Merge happens at checkout page (last minute)
- Steps: Reach payment page as guest → Register → Merge happens
- Expected: Cart updates, checkout flow continues
- Risk: Data corruption during payment initiation

TC12: Multiple browser tabs (guest in one, register in other)
- Steps: Tab 1: Add items as guest; Tab 2: Register same email; Check Tab 1
- Expected: Both tabs sync after merge (or controlled behavior)
- Risk: Race condition, data inconsistency

TC13: Very large cart merge (1000 items)
- Steps: Guest cart 500 items + Account cart 500 items → Merge
- Expected: All 1000 items merged, performance acceptable (<2 sec)
- Risk: Performance issue, timeout

TC14: Merge with price change (item price updated during merge operation)
- Steps: Merge starts, item price changes mid-operation
- Expected: Transaction rolls back or uses consistent snapshot
- Risk: Data corruption

TC15: Merge failure → Rollback
- Steps: Intentionally cause merge failure (DB error)
- Expected: Original carts intact, user notified
- Risk: Lost data, no rollback
```

---

**REGRESSION FOR REGISTRATION DISCOUNT** (Business Logic)

```
Test Suite: Registration Bonus Discount (10 test cases)

TC16: New registration → 5% discount applied
- Steps: Register as new user → Check cart discount
- Expected: 5% discount shown, calculated correctly
- Risk: Discount not applied

TC17: Discount applies to merged cart total
- Steps: Guest adds $100 → Register → Check if 5% of total or just new items
- Expected: 5% applied to entire merged cart (business decision)
- Risk: Applied wrong amount

TC18: Registration discount + existing coupon → Both applied correctly
- Steps: Account had 20% coupon → Register → 5% registration bonus
- Expected: Total discount = 20% + 5% (or whichever is best per policy)
- Risk: Incorrect stacking, one ignored

TC19: Registration discount → Cannot be removed/disabled
- Steps: Register, receive 5% discount, try to remove
- Expected: Cannot remove (locked for registration)
- Risk: Discount removed, unfair to company

TC20: One-time discount → Not applied twice
- Steps: Register, receive discount, add more items, check if existing items also get discount
- Expected: 5% applied only at registration, not per item add
- Risk: Applied multiple times

TC21: Discount on shipping cost
- Steps: Register, items ship separately, check if discount includes shipping
- Expected: Per business rule (typically on items only, not shipping)
- Risk: Incorrect calculation

TC22: Discount in email confirmation
- Steps: Register → Check confirmation email
- Expected: Email mentions "5% registration bonus applied"
- Risk: Customer unaware of discount

TC23: Discount visibility in invoice/receipt
- Steps: Complete order after registration → Check invoice
- Expected: Invoice shows "Registration Discount: -5%"
- Risk: Customer confused about pricing

TC24: Tax calculation with discount
- Steps: $100 item, 5% discount = $95, then 10% tax
- Expected: Tax calculated on $95 (discounted price)
- Risk: Tax on wrong amount

TC25: Loyalty points calculated with discount
- Steps: Register, earn loyalty points on discounted amount
- Expected: Points based on $95 (after discount)
- Risk: Points calculation error
```

---

**REGRESSION FOR SESSION & AUTHENTICATION** (Security/Technical)

```
Test Suite: Session Management (8 test cases)

TC26: Guest session → Converted to authenticated session
- Steps: Guest browsing (no login) → Register → Should be logged in
- Expected: Session token updated, can access account
- Risk: Not logged in after registration

TC27: Old guest session abandoned after registration
- Steps: Register as guest → Old session token invalid
- Expected: Old token rejects requests, new token works
- Risk: Old session still valid (security issue)

TC28: Cart persists with correct user after registration
- Steps: Guest session with cart → Register → New session → Cart belongs to logged-in user
- Expected: Cart accessible from account, not guest anymore
- Risk: Cart accessible to wrong user

TC29: Concurrent sessions (guest in one browser, account in another)
- Steps: Browser 1: Guest cart; Browser 2: Register same email; check both
- Expected: Controlled behavior (e.g., guest session invalidated)
- Risk: Data inconsistency between sessions

TC30: Guest session timeout before registration completes
- Steps: Guest session expires → User clicks Register → Verify flow
- Expected: Graceful handling, can still register
- Risk: Registration fails or cart lost

TC31: Register from different device (guest on mobile, register on web)
- Steps: Mobile: Add items as guest; Web: Register same email; Mobile: Check cart
- Expected: Cart synced across devices after registration
- Risk: Mobile doesn't see registered user cart

TC32: CSRF protection during registration
- Steps: Attempt Cross-Site Request Forgery during registration
- Expected: Blocked, error message
- Risk: Security vulnerability

TC33: Session hijacking prevention (guest → registered)
- Steps: Attempt to hijack session during merge
- Expected: Session tokens secure, hijacking prevented
- Risk: Security breach
```

---

**REGRESSION FOR EMAIL NOTIFICATIONS** (Communication)

```
Test Suite: Email Notifications (6 test cases)

TC34: Registration confirmation email sent
- Steps: Register during checkout
- Expected: Email sent within 1 minute with confirmation link
- Risk: Email not sent, user cannot confirm

TC35: Confirmation email includes cart summary
- Steps: Register with items in cart
- Expected: Email shows "Items in your cart: Laptop, Mouse..."
- Risk: Email doesn't mention cart

TC36: Confirmation link works and confirms account
- Steps: Click confirmation link in email
- Expected: Account confirmed, user can access features
- Risk: Link broken or confirmation fails

TC37: Welcome email sent (different from confirmation)
- Steps: Register
- Expected: Separate welcome email with 5% discount info
- Risk: Email not sent or wrong content

TC38: Email includes registration discount info
- Steps: Register
- Expected: Confirmation/Welcome email mentions "5% registration bonus"
- Risk: Customer doesn't know about discount

TC39: No duplicate emails sent
- Steps: Register, verify email sent exactly once
- Expected: One confirmation + one welcome (2 total)
- Risk: Multiple emails sent (looks like spam)
```

---

**REGRESSION FOR INTEGRATION** (End-to-End)

```
Test Suite: Full Integration (7 test cases)

TC40: Complete flow: Browse → Add → Register → Checkout → Payment
- Steps: As guest, add items → Register → Checkout → Pay
- Expected: All steps work, order placed successfully
- Risk: Any integration point fails, order doesn't complete

TC41: Order confirmation includes registration discount
- Steps: Order after registration
- Expected: Order confirmation shows 5% discount applied
- Risk: Order missing discount info

TC42: User account shows merged items in order history
- Steps: Register as guest → Add items → Checkout → Check "My Orders"
- Expected: Order shows all items (guest + account merged)
- Risk: Order history incomplete

TC43: Inventory decremented correctly for merged cart
- Steps: Register with merged cart → Checkout → Verify inventory
- Expected: Inventory decreased by correct quantities
- Risk: Incorrect decrement, overselling possible

TC44: Loyalty points awarded after registration purchase
- Steps: Register, make purchase → Check loyalty account
- Expected: Points awarded based on (final amount after discount)
- Risk: Points calculation wrong

TC45: Analytics tracks guest-to-registered conversion
- Steps: Register as guest during checkout
- Expected: Analytics records conversion event
- Risk: No conversion tracking, can't measure feature impact

TC46: Performance: Merge + Discount + Email all complete <5 seconds
- Steps: Register with 100 items in cart
- Expected: Everything completes in <5 seconds
- Risk: Timeout, user sees loading spinner too long
```

---

**Phase 3: Automation Strategy**

```
TOTAL TEST CASES: 46

Recommended Automation Distribution:

✅ AUTOMATE (100%):
- Cart merge logic (TC1-TC7): 7 tests → API tests + DB verification
- Discount calculation (TC16-TC25): 10 tests → API tests (most logic)
- Session management (TC26-TC28, TC30): 4 tests → API tests
- Integration flows (TC40-TC44): 5 tests → Selenium E2E
- Performance (TC46): 1 test → Load test tool

Total Automated: 27 tests (60%)
Execution Time: 45 minutes
Tools: Selenium, Rest Assured, TestNG, JUnit

⚠️ HYBRID (Manual + Automated):
- Session security (TC29, TC31-TC33): 4 tests → Manual + Security tools
- Email notifications (TC34-TC39): 6 tests → Automated check + Manual review
- Integration edge cases (TC45): 1 test → Manual setup, automated checks

Total Hybrid: 11 tests (24%)

❌ MANUAL ONLY:
- UI/UX during registration (flow, validation messages, error handling)
- Concurrent session behavior on different devices (TC29)
- Edge cases requiring creative testing

Total Manual: 8 tests (16%)

REGRESSION EXECUTION PLAN:

Daily (15 min): Smoke tests
- TC1 (basic merge)
- TC16 (discount application)
- TC26 (session conversion)
- TC40 (complete flow)

Weekly (45 min): Full automated regression
- All 27 automated tests run in parallel

Before Release (2 hours): 
- Full automated + manual exploratory testing
- Performance testing under load
- Edge case validation
```

---

**Phase 4: Regression Success Criteria**

```
CRITICAL PASS CRITERIA (Must all pass):
✓ Cart merge: No data loss, correct quantities
✓ Discount: Correct percentage, applied to correct amount
✓ Session: User logged in after registration
✓ Complete flow: Order placed successfully
✓ Order integrity: Amount correct, items correct

HIGH PASS CRITERIA (90%+ must pass):
✓ Email notifications: Sent to correct address, on time
✓ Loyalty points: Calculated correctly
✓ Inventory: Decremented by correct amount
✓ Security: No unauthorized access
✓ Performance: All operations <5 seconds

MEDIUM PASS CRITERIA (75%+ must pass):
✓ UI functionality: Buttons, validation, messages work
✓ Analytics: Conversion tracked
✓ Device compatibility: Works on mobile and desktop
✓ Multiple languages/regions: Applicable if supported
```

---

---

## 📝 Practice Tips

### For Exercise 1.1 (Story Lifecycle):
- ✅ Use a real feature from your project
- ✅ Be specific with test cases (not just "test feature")
- ✅ Think about edge cases and error scenarios
- ✅ Consider integration points
- ✅ Plan automation realistically

### For Exercise 2.1 (Regression Decision):
- ✅ Always start with risk assessment
- ✅ Categorize by impact, not just effort
- ✅ Show your decision-making logic
- ✅ Consider automation ROI
- ✅ Communicate trade-offs clearly

### For Exercise 3.1 (Time-Constrained):
- ✅ Prioritize ruthlessly
- ✅ Use parallel testing when possible
- ✅ Automate repetitive work
- ✅ Document what was NOT tested (important!)
- ✅ Present risk clearly to stakeholders

### For Exercise 4.1 (Complex Dependencies):
- ✅ Map out all dependencies first
- ✅ Identify integration points
- ✅ Test data consistency
- ✅ Consider security implications
- ✅ Think about end-to-end flow

---

## ✨ Key Learnings

After working through these exercises, you should be able to:

1. **Map feature journey** with testing at each phase
2. **Identify regression scope** based on risk, not guess
3. **Prioritize testing** under time constraints
4. **Design comprehensive test cases** for complex features
5. **Automate strategically** (not everything, not nothing)
6. **Communicate risk** and trade-offs to stakeholders
7. **Handle dependencies** and integration points
8. **Measure success** with clear metrics

---

**These exercises prepare you for real-world interview scenarios and actual project situations.** 

Good luck with your practice! 🚀

