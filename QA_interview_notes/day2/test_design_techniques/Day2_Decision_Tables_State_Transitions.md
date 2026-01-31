# Day 2 – Decision Tables & State Transitions (Advanced Scenarios)

## 🎬 ADVANCED SCENARIO 1: Decision Table – Money Transfer Approval Logic

### Business Requirements
```
Transfer Approval Rules:
├─ IF Amount > $10,000 → Requires manual approval
├─ IF Account Status = "Inactive" → Deny transfer
├─ IF Available Balance < Transfer Amount → Deny transfer
└─ Otherwise → Auto-approve

Conditions:
1. Amount > $10,000?
2. Account Status = "Active"?
3. Sufficient Balance Available?

Actions:
- Auto-Approve Transfer
- Send for Manual Approval
- Deny Transfer (specify reason)
```

### STEP 1: Create Decision Table

```
DECISION TABLE – MONEY TRANSFER APPROVAL
═══════════════════════════════════════════════════════════════════

Condition:                    1  2  3  4  5  6  7  8
─────────────────────────────────────────────────────────────────
Amount > $10,000?            Y  Y  Y  Y  N  N  N  N
Account Status = Active?     Y  Y  N  N  Y  Y  N  N
Sufficient Balance?          Y  N  Y  N  Y  N  Y  N

─────────────────────────────────────────────────────────────────
ACTIONS:

Auto-Approve?                N  N  N  N  Y  N  N  N
Manual Review?               Y  N  N  N  N  N  N  N
Deny - Reason:              DR IS  IA  IA  -  IS  IA  IS

─────────────────────────────────────────────────────────────────
Legend:
Y = Yes, N = No
DR = Deny - Requires Review (>$10K needs manual approval)
IS = Insufficient Balance
IA = Inactive Account
```

### STEP 2: Test Case Mapping from Decision Table

| Test # | Amount | Account Status | Balance | Combination | Expected Result |
|--------|--------|----------------|---------|------------|-----------------|
| TC-DT-1 | $15,000 | Active | $20,000 | Y-Y-Y | 📋 Manual Review |
| TC-DT-2 | $15,000 | Active | $5,000 | Y-Y-N | ❌ Deny: Insufficient Balance |
| TC-DT-3 | $15,000 | Inactive | $20,000 | Y-N-Y | ❌ Deny: Inactive Account |
| TC-DT-4 | $15,000 | Inactive | $5,000 | Y-N-N | ❌ Deny: Inactive Account |
| TC-DT-5 | $5,000 | Active | $20,000 | N-Y-Y | ✅ Auto-Approve |
| TC-DT-6 | $5,000 | Active | $2,000 | N-Y-N | ❌ Deny: Insufficient Balance |
| TC-DT-7 | $5,000 | Inactive | $20,000 | N-N-Y | ❌ Deny: Inactive Account |
| TC-DT-8 | $5,000 | Inactive | $2,000 | N-N-N | ❌ Deny: Inactive Account |

### STEP 3: Test Cases with Steps

| Test ID | Amount | Account | Balance | Expected Result | Actual | Pass/Fail |
|---------|--------|---------|---------|-----------------|--------|-----------|
| TC-DT-1 | $15,000 | Active | $20,000 | 📋 Manual Review | | |
| TC-DT-2 | $15,000 | Active | $5,000 | ❌ Insufficient Balance | | |
| TC-DT-3 | $15,000 | Inactive | $20,000 | ❌ Inactive Account | | |
| TC-DT-4 | $15,000 | Inactive | $5,000 | ❌ Inactive Account | | |
| TC-DT-5 | $5,000 | Active | $20,000 | ✅ Auto-Approve | | |
| TC-DT-6 | $5,000 | Active | $2,000 | ❌ Insufficient Balance | | |
| TC-DT-7 | $5,000 | Inactive | $20,000 | ❌ Inactive Account | | |
| TC-DT-8 | $5,000 | Inactive | $2,000 | ❌ Inactive Account | | |

**Result: 8 test cases** (1 per condition combination = 2³ = 8 tests)

---

## 🎬 ADVANCED SCENARIO 2: State Transitions – E-Commerce Order Processing

### States and Transitions

```
STATES:
1. CART              (Items selected, not checked out)
2. CHECKOUT          (Shipping/billing info entered)
3. PAYMENT           (Payment method selected)
4. PROCESSING        (Payment being processed)
5. SUCCESS           (Order confirmed)
6. FAILED            (Payment failed)
7. CANCELLED         (User cancelled checkout)
8. REFUND            (Return/refund initiated)
```

### Valid State Transitions

```
VALID TRANSITIONS (State Machine):

CART ──→ CHECKOUT ──→ PAYMENT ──→ PROCESSING ──→ SUCCESS
  ↓        ↓           ↓            ↓              ↓
CANCELLED CANCELLED  CANCELLED   FAILED      REFUND

FAILED ──→ CART (retry)
REFUND ──→ (end state)
CANCELLED ──→ (end state)
SUCCESS ──→ (end state)

Valid: CART → CHECKOUT → PAYMENT → PROCESSING → SUCCESS ✓
Valid: PAYMENT → CANCELLED → (done) ✓
Invalid: CART → SUCCESS (skip steps) ✗
Invalid: SUCCESS → CANCELLED (can't cancel completed order) ✗
```

### STEP 1: List All Possible Transitions

| From State | To State | Event | Valid? | Reason |
|-----------|----------|-------|--------|--------|
| CART | CHECKOUT | Click Checkout | ✅ | Normal flow |
| CHECKOUT | PAYMENT | Submit Address | ✅ | Normal flow |
| PAYMENT | PROCESSING | Submit Payment | ✅ | Normal flow |
| PROCESSING | SUCCESS | Payment Approved | ✅ | Normal completion |
| PROCESSING | FAILED | Payment Declined | ✅ | Error handling |
| SUCCESS | REFUND | Customer Initiates Return | ✅ | Valid after success |
| CART | CANCELLED | Click Cancel | ✅ | Can cancel from cart |
| CHECKOUT | CANCELLED | Click Cancel | ✅ | Can cancel from checkout |
| PAYMENT | CANCELLED | Click Cancel | ✅ | Can cancel from payment |
| FAILED | CART | Click Retry | ✅ | Can retry from failed |
| REFUND | CART | Return to Shopping | ✅ | Can continue shopping |
| CART | PAYMENT | Skip Checkout | ❌ | Invalid: Skip step |
| CHECKOUT | SUCCESS | Skip Payment | ❌ | Invalid: Skip payment |
| SUCCESS | CANCELLED | Cancel After Success | ❌ | Invalid: Order confirmed |
| SUCCESS | PROCESSING | Reprocess | ❌ | Invalid: Already processed |

### STEP 2: Create Test Cases for All Transitions

#### Valid Transitions (✅ Should Allow)

| Test ID | From | Event | To | Expected | Step-by-Step |
|---------|------|-------|----|----|-----------|
| TC-ST-1 | CART | Proceed Checkout | CHECKOUT | ✅ Allow | 1. Add items to cart 2. Click Checkout 3. Verify CHECKOUT state |
| TC-ST-2 | CHECKOUT | Enter Address | PAYMENT | ✅ Allow | 1. Fill address form 2. Click Continue 3. Verify PAYMENT state |
| TC-ST-3 | PAYMENT | Submit Payment | PROCESSING | ✅ Allow | 1. Select payment method 2. Click Pay 3. Verify PROCESSING state |
| TC-ST-4 | PROCESSING | Payment Approved | SUCCESS | ✅ Allow | 1. Wait for processing 2. Payment succeeds 3. Verify SUCCESS state |
| TC-ST-5 | PROCESSING | Payment Declined | FAILED | ✅ Allow | 1. Wait for processing 2. Payment fails 3. Verify FAILED state |
| TC-ST-6 | SUCCESS | Initiate Return | REFUND | ✅ Allow | 1. View order 2. Click Return Item 3. Verify REFUND state |
| TC-ST-7 | CART | Click Cancel | CANCELLED | ✅ Allow | 1. In cart 2. Click Cancel 3. Verify CANCELLED state |
| TC-ST-8 | FAILED | Click Retry | CART | ✅ Allow | 1. In FAILED state 2. Click Retry 3. Return to CART |

#### Invalid Transitions (❌ Should Deny)

| Test ID | From | Event | To | Expected | Result |
|---------|------|-------|----|----|---------|
| TC-ST-9 | CART | Skip to Payment | PAYMENT | ❌ Deny | Error: "Must complete checkout first" |
| TC-ST-10 | CHECKOUT | Skip to Processing | PROCESSING | ❌ Deny | Error: "Must complete payment first" |
| TC-ST-11 | SUCCESS | Cancel Order | CANCELLED | ❌ Deny | Error: "Cannot cancel completed order" |
| TC-ST-12 | PROCESSING | Go Back to CART | CART | ❌ Deny | Error: "Cannot go back during processing" |
| TC-ST-13 | SUCCESS | Retry Payment | PROCESSING | ❌ Deny | Error: "Order already completed" |

### STEP 3: Complete State Transition Test Suite

**Summary: 13 test cases** (8 valid + 5 invalid transitions)

---

## 📊 Decision Table vs. State Transitions

| Aspect | Decision Table | State Transitions |
|--------|----------------|-------------------|
| **Purpose** | Test all condition combinations | Test all state changes |
| **Use When** | Multiple conditions combine | Application has states |
| **Coverage** | All logic paths | All workflows |
| **Example** | 3 conditions = 8 tests | 5 states = 10-15 tests |
| **Fincity Use** | Transfer approval (8 tests) | Payment processing (13 tests) |

---

## 🎯 Key Insights

### Decision Tables:
✅ Ensure NO condition combination is missed
✅ Catch logic errors early
✅ 3 conditions = 2³ = 8 combinations = 8 tests
✅ Formula: 2^(number of conditions) = number of test cases

### State Transitions:
✅ Test valid workflows
✅ Test error recovery paths
✅ Test invalid transitions (security)
✅ Ensure no unexpected state changes

---

## ✅ Complete Day 2 Deliverables Summary

**3 Solved Problems (EP + BVA):**
1. Login Email Validation → 11 tests
2. Shopping Cart Quantity → 10 tests
3. Bank Transfer Amount → 11 tests
**Subtotal: 32 tests**

**Advanced Scenarios:**
1. Decision Table (Money Transfer) → 8 tests
2. State Transitions (E-Commerce) → 13 tests
**Subtotal: 21 tests**

**TOTAL: 53 comprehensive test cases** 🎯

All demonstrating systematic, thorough test design!
