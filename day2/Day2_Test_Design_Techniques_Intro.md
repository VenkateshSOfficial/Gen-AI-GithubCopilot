# Day 2 – Test Design Techniques Deep Dive

## 🎯 Quick Overview

**Today's Focus:** Master the 4 essential test design techniques
1. **Equivalence Partitioning (EP)** - Divide input into groups
2. **Boundary Value Analysis (BVA)** - Test at boundaries
3. **Decision Tables** - Test all logic combinations
4. **State Transitions** - Test state changes

**Why It Matters:** These techniques prevent you from writing random test cases. They ensure systematic, comprehensive coverage with minimal redundancy.

---

## 📚 Part 1: Equivalence Partitioning (EP)

### What is EP?

**Concept:** Divide input domain into groups (partitions) where all members are treated equally by the application.

**Example:** 
- Age input 1-120 has 3 partitions:
  - **Invalid:** < 1 (negative ages)
  - **Valid:** 1-120 (legitimate ages)
  - **Invalid:** > 120 (unrealistic ages)

You test ONE value from each partition (not all values).

### EP Principle

```
INPUT RANGE: 1-100 (Valid password length)
             
PARTITIONS:
├─ Invalid Partition 1: < 1 (length 0) → Test with: "" (empty)
├─ Valid Partition: 1-100 → Test with: "Pass123" (50 chars)
└─ Invalid Partition 2: > 100 (length 101+) → Test with: "A" × 101 chars

Instead of testing lengths 1, 2, 3...100, 101, 102... (wasteful)
We test: 1 value from each of 3 partitions (efficient)
```

### Why Use EP?

✅ Reduces test cases from 100+ to just 3-4
✅ Covers all input scenarios
✅ Avoids redundancy
✅ Systematic approach

---

## 📚 Part 2: Boundary Value Analysis (BVA)

### What is BVA?

**Concept:** Test at the boundaries between partitions, as bugs often occur at edges.

**Example:**
- Valid age: 18-65 years
  - **Boundaries:** 17, 18, 64, 65, 66
  - Test: 17 (below), 18 (at), 65 (at), 66 (above)

### BVA Principle

```
VALID RANGE: 18-65 (Eligible age)

BOUNDARIES:
├─ Below Lower: 17 → Should REJECT
├─ At Lower: 18 → Should ACCEPT
├─ At Upper: 65 → Should ACCEPT
└─ Above Upper: 66 → Should REJECT

NOT JUST: 30, 40, 50 (middle values)
```

### Why Use BVA?

✅ Catches off-by-one errors
✅ Finds edge case bugs
✅ Tests maximum/minimum values
✅ High probability of finding defects

---

## 🎬 REAL-TIME EXAMPLE #1: Login System (EP + BVA)

### Scenario: Email Input Validation

**Requirement:** 
- Email must be 5-50 characters
- Must contain "@" symbol
- Must have valid domain

### Step 1: Define Partitions (EP)

```
PARTITIONS:
├─ Invalid: < 5 chars (e.g., "a@b")
├─ Valid: 5-50 chars with @ and domain (e.g., "user@company.com")
├─ Invalid: > 50 chars (e.g., "verylongemailaddress...@company.com" × 100 chars)
└─ Invalid: No @ symbol (e.g., "usercompany.com")
```

### Step 2: Test Cases Using EP

| Test Case ID | Email | Partition | Expected Result |
|---|---|---|---|
| TC-1 | "a@b" | Invalid (<5) | ❌ REJECT |
| TC-2 | "user@company.com" | Valid (5-50) | ✅ ACCEPT |
| TC-3 | "x" × 100 + "@company.com" | Invalid (>50) | ❌ REJECT |
| TC-4 | "usercompany.com" | Invalid (no @) | ❌ REJECT |

**Result:** 4 test cases cover all input scenarios

### Step 3: Add BVA (Test Boundaries)

```
BOUNDARY VALUES FOR LENGTH 5-50:

Below Lower Boundary:
├─ 4 chars: "ab@cd" → Should REJECT

At Lower Boundary:
├─ 5 chars: "a@b.c" → Should ACCEPT

At Upper Boundary:
├─ 50 chars: "abcdefghij@company.comabcdefghijklmnopqrst" → Should ACCEPT

Above Upper Boundary:
├─ 51 chars: "abcdefghij@company.comabcdefghijklmnopqrstu" → Should REJECT
```

### Step 4: Complete Test Suite (EP + BVA)

| Test Case ID | Email | Type | Expected Result |
|---|---|---|---|
| TC-EP-1 | "a@b" | EP: Invalid (<5) | ❌ REJECT |
| TC-BVA-1 | "ab@cd" | BVA: Below lower (4 chars) | ❌ REJECT |
| TC-BVA-2 | "a@b.c" | BVA: At lower (5 chars) | ✅ ACCEPT |
| TC-EP-2 | "user@company.com" | EP: Valid (5-50) | ✅ ACCEPT |
| TC-BVA-3 | "abcd@company.com" × 50 | BVA: At upper (50 chars) | ✅ ACCEPT |
| TC-BVA-4 | "abcd@company.com" × 51 | BVA: Above upper (51 chars) | ❌ REJECT |
| TC-EP-3 | "usercompany.com" | EP: Invalid (no @) | ❌ REJECT |

**Total: 7 test cases** (instead of testing every length 5-50 = 46 cases!)

---

## 🎬 REAL-TIME EXAMPLE #2: Shopping Cart (EP + BVA)

### Scenario: Quantity Input

**Requirement:**
- User can add 1-999 items per product
- 0 items = remove from cart
- 1000+ items = error (warehouse limit)

### EP Partitions

```
PARTITIONS:
├─ Invalid: 0 or negative → Remove item from cart
├─ Valid: 1-999 → Add to cart
└─ Invalid: 1000+ → Error message "Quantity exceeds warehouse limit"
```

### BVA Boundaries

```
BOUNDARIES FOR 1-999:

Below:
├─ 0 items → Remove from cart

At Lower:
├─ 1 item → Add to cart

At Upper:
├─ 999 items → Add to cart

Above:
├─ 1000 items → Error
```

### Complete Test Suite

| Test Case ID | Quantity | Partition | Boundary | Expected |
|---|---|---|---|---|
| TC-1 | 0 | Invalid | Below | Remove item ❌ |
| TC-2 | 1 | Valid | Lower | Add item ✅ |
| TC-3 | 500 | Valid | Middle | Add item ✅ |
| TC-4 | 999 | Valid | Upper | Add item ✅ |
| TC-5 | 1000 | Invalid | Above | Error message ❌ |

**Result: 5 test cases cover all scenarios**

---

## 📚 Part 3: Decision Tables

### What is a Decision Table?

**Concept:** Table showing all combinations of inputs, conditions, and expected outputs.

**Use When:**
- Multiple conditions combine to create outputs
- Complex business logic
- Need to ensure all combinations tested

### Decision Table Structure

```
Columns:
├─ Conditions (Yes/No)
├─ Actions (What happens)
└─ Test Case ID

Rows:
├─ Each row = unique combination of conditions
└─ Each combination should be tested
```

---

## 🎬 REAL-TIME EXAMPLE #3: Money Transfer (Decision Table)

### Scenario: Bank Transfer Rules

**Conditions:**
1. Is amount > $10,000? (Requires manual approval)
2. Is account active? (Inactive accounts blocked)
3. Is sufficient balance available? (Check funds)

**Actions:**
- Transfer approved
- Transfer denied (reason varies)

### Decision Table

```
DECISION TABLE - MONEY TRANSFER
═════════════════════════════════════════════════════════════

Condition                          1  2  3  4  5  6  7  8
─────────────────────────────────────────────────────────────
Amount > $10,000?                  Y  Y  Y  Y  N  N  N  N
Account Active?                    Y  Y  N  N  Y  Y  N  N
Sufficient Balance?                Y  N  Y  N  Y  N  Y  N

─────────────────────────────────────────────────────────────
ACTION:

Approve Transfer?                  Y  N  N  N  Y  N  N  N
Send for Manual Review?            Y  N  N  N  N  N  N  N
Deny Reason:                       MA NS IA IA -  IS IA IS

─────────────────────────────────────────────────────────────
Legend: Y=Yes, N=No, MA=Manual Approval, NS=No Stock, IA=Inactive Account, IS=Insufficient
```

### Test Cases from Decision Table

| Test ID | Amount | Active | Balance | Expected Result |
|---|---|---|---|---|
| TC-DT-1 | $15,000 | Yes | $20,000 | ✅ Pending Manual Approval |
| TC-DT-2 | $15,000 | Yes | $5,000 | ❌ Insufficient Balance |
| TC-DT-3 | $15,000 | No | $20,000 | ❌ Account Inactive |
| TC-DT-4 | $15,000 | No | $5,000 | ❌ Account Inactive |
| TC-DT-5 | $5,000 | Yes | $20,000 | ✅ Approved |
| TC-DT-6 | $5,000 | Yes | $2,000 | ❌ Insufficient Balance |
| TC-DT-7 | $5,000 | No | $20,000 | ❌ Account Inactive |
| TC-DT-8 | $5,000 | No | $2,000 | ❌ Account Inactive |

**Result: 8 test cases cover ALL logic combinations**

---

## 📚 Part 4: State Transitions

### What is State Transition?

**Concept:** Application moves from one state to another based on events/inputs.

**Use When:**
- Application has clear states (Login → Home → Dashboard)
- Events trigger state changes
- Need to test all valid and invalid transitions

### State Transition Diagram

```
States: Idle → Processing → Complete → Failed

Events: Start, Finish, Error

Transitions:
├─ Idle + Start → Processing ✅
├─ Processing + Finish → Complete ✅
├─ Processing + Error → Failed ✅
├─ Idle + Finish → Invalid ❌ (can't finish if not processing)
└─ Complete + Start → Invalid ❌ (can't restart completed transaction)
```

---

## 🎬 REAL-TIME EXAMPLE #4: E-Commerce Checkout (State Transitions)

### States

```
1. CART          (Items selected, not checked out)
2. CHECKOUT      (Checkout form visible)
3. PAYMENT       (Payment method selected)
4. PROCESSING    (Payment being processed)
5. SUCCESS       (Order confirmed)
6. FAILED        (Payment failed)
7. CANCELLED     (User cancelled checkout)
```

### Valid Transitions

```
State Machine:

CART ────────→ CHECKOUT ────────→ PAYMENT ────────→ PROCESSING
  ↓              ↓                  ↓                  ↓ ↓
CANCELLED   CANCELLED          CANCELLED          SUCCESS FAILED
                                                  ↓      ↓
                                                  Both lead back to CART
```

### State Transition Test Cases

| Test ID | From State | Event | To State | Expected | Result |
|---|---|---|---|---|---|
| TC-ST-1 | CART | Proceed Checkout | CHECKOUT | ✅ Valid | ✅ PASS |
| TC-ST-2 | CHECKOUT | Proceed Payment | PAYMENT | ✅ Valid | ✅ PASS |
| TC-ST-3 | PAYMENT | Proceed Process | PROCESSING | ✅ Valid | ✅ PASS |
| TC-ST-4 | PROCESSING | Payment Success | SUCCESS | ✅ Valid | ✅ PASS |
| TC-ST-5 | PROCESSING | Payment Failed | FAILED | ✅ Valid | ✅ PASS |
| TC-ST-6 | PAYMENT | Cancel | CANCELLED | ✅ Valid | ✅ PASS |
| TC-ST-7 | CHECKOUT | Cancel | CANCELLED | ✅ Valid | ✅ PASS |
| TC-ST-8 | SUCCESS | Proceed Checkout | CHECKOUT | ✅ Valid | ✅ PASS |
| TC-ST-9 | FAILED | Proceed Checkout | CHECKOUT | ✅ Valid | ✅ PASS |
| TC-ST-10 | CART | Proceed Payment | PAYMENT | ❌ Invalid | Should skip CHECKOUT ❌ |
| TC-ST-11 | CART | Proceed Processing | PROCESSING | ❌ Invalid | Should skip CHECKOUT & PAYMENT ❌ |
| TC-ST-12 | SUCCESS | Cancel | CANCELLED | ❌ Invalid | Can't cancel after success ❌ |

**Result: 12 test cases cover all valid and invalid transitions**

---

## 🎓 When to Use Each Technique

| Technique | When | Example |
|-----------|------|---------|
| **EP** | Input has clear groups | Age: <18, 18-65, >65 |
| **BVA** | Need edge case coverage | Boundary values: 18, 65 |
| **Decision Table** | Multiple conditions combine | If (age>18 AND income>50k) → Approve |
| **State Transition** | Application has states | Login → Dashboard → Logout |

---

## 💡 Interview Talking Points

### When Asked: "Tell me about test design techniques"

**Good Answer:**
> "I use four main test design techniques: Equivalence Partitioning to divide inputs into groups and test one from each. Boundary Value Analysis to test at the edges where bugs often hide. Decision Tables when multiple conditions combine. State Transitions when the application moves between states.
>
> For example, in Fincity, I used EP and BVA for certificate validation (valid JKS/PKCS12, expired, invalid). I used decision tables for transaction approval logic (amount > $10K, account active, sufficient balance). I used state transitions for order processing (cart → checkout → payment → processing → success/failed)."

**Great Answer (More Detail):**
> "Test design techniques help me write systematic, comprehensive test cases without redundancy.
>
> **Equivalence Partitioning** divides input domain into groups where all members should behave identically. Instead of testing every password length from 1-100, I test one value from each partition: <8 (invalid), 8-20 (valid), >20 (invalid).
>
> **Boundary Value Analysis** focuses on values at partition boundaries, where bugs often occur. For a valid age range of 18-65, I specifically test: 17 (below), 18 (at boundary), 65 (at boundary), 66 (above).
>
> **Decision Tables** are essential when multiple conditions combine to produce outputs. For payment approval with conditions (Amount>10K?, Account Active?, Balance Sufficient?), I create a table showing all 8 combinations and test each.
>
> **State Transitions** test how applications move between states. For e-commerce checkout (Cart → Checkout → Payment → Processing → Success), I test all valid transitions and invalid ones (Cart → Success is invalid).
>
> In my Fincity certificate migration project, I applied these systematically: EP/BVA for certificate formats, decision tables for transaction approval rules, and state transitions for payment processing states."

---

## ✅ Checklist: Do You Understand?

- [ ] EP divides inputs into groups; test one from each
- [ ] BVA tests values at partition boundaries
- [ ] Decision Tables show all condition combinations
- [ ] State Transitions map valid and invalid state changes
- [ ] Each technique reduces redundancy and improves coverage
- [ ] Can explain with real examples (login, cart, transfer)
- [ ] Can create test cases using each technique
- [ ] Can identify which technique to use for different scenarios

If YES to all → Ready for the detailed examples! 🎯

---

## 📚 Summary

**EP + BVA = Input validation testing**
**Decision Tables = Combinatorial logic testing**
**State Transitions = Workflow testing**

All work together to create **comprehensive, systematic test design**.

Next: Detailed solved examples with step-by-step solutions!
