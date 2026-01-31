# Day 2 – Quick Reference & Interview Prep

## 🎯 The 4 Test Design Techniques at a Glance

### 1. Equivalence Partitioning (EP)
```
What:     Divide inputs into groups; test one from each
Why:      Reduces 100 tests → 3-4 tests (no redundancy)
When:     Input validation (age, email, length, amounts)
Formula:  1 test per partition
Example:  Age <18, 18-65, >65 → Test 15, 30, 80 (3 tests)
```

### 2. Boundary Value Analysis (BVA)
```
What:     Test at partition boundaries
Why:      Catches off-by-one errors (most common bug)
When:     After EP (to test edges)
Formula:  4 tests per boundary (below, at-lower, at-upper, above)
Example:  Age 18-65 → Test 17, 18, 65, 66 (4 tests)
```

### 3. Decision Tables
```
What:     Show all condition combinations
Why:      Ensures all logic paths tested
When:     Multiple conditions combine
Formula:  2^n combinations (3 conditions = 8 tests)
Example:  Loan approval (age, income, credit) → 8 tests
```

### 4. State Transitions
```
What:     Map valid and invalid state changes
Why:      Ensures workflows work correctly
When:     App has distinct states
Formula:  (valid transitions) + (invalid attempts)
Example:  Cart→Checkout→Payment→Success (13+ tests)
```

---

## 📋 Problem-Solving Flowchart

```
Test Design Problem
        ↓
    Input Validation?
    ├─ YES → Use EP + BVA
    │   ├─ Define partitions
    │   ├─ Create EP tests
    │   ├─ Identify boundaries
    │   ├─ Create BVA tests
    │   └─ Combine into suite
    │
    └─ NO
        ├─ Multiple conditions combine?
        │   ├─ YES → Use Decision Table
        │   │   ├─ List conditions
        │   │   ├─ Create table
        │   │   ├─ 2^n combinations
        │   │   └─ 1 test per row
        │   │
        │   └─ NO
        │       └─ Application has states?
        │           ├─ YES → Use State Transitions
        │           │   ├─ Map states
        │           │   ├─ Valid transitions
        │           │   ├─ Invalid attempts
        │           │   └─ Test all paths
        │           │
        │           └─ NO → Combination approach
```

---

## 🎬 Quick Examples from Your Training

### EP + BVA Quick Example: Password Length
```
Requirement: 8-20 characters

Partitions:
├─ < 8: "pass" (4 chars)
├─ 8-20: "mypassword" (10 chars)
└─ > 20: "x" × 25 chars

Boundaries:
├─ 7 chars: Below
├─ 8 chars: Lower
├─ 20 chars: Upper
└─ 21 chars: Above

Total: 7 tests (4 partitions + 4 boundaries - 1 overlap)
```

### Decision Table Quick Example: Loan Approval
```
Conditions:  Age≥21?  Income≥$50k?  Credit≥700?
─────────────────────────────────────────────────
Test 1:      Y        Y             Y  → ✅ Approve
Test 2:      Y        Y             N  → 📋 Review
Test 3:      Y        N             Y  → 📋 Review
Test 4:      Y        N             N  → 📋 Review
Test 5:      N        Y             Y  → ❌ Deny
Test 6:      N        Y             N  → ❌ Deny
Test 7:      N        N             Y  → ❌ Deny
Test 8:      N        N             N  → ❌ Deny

Total: 8 tests (2³ combinations)
```

### State Transitions Quick Example: Checkout
```
Valid Path: CART → CHECKOUT → PAYMENT → SUCCESS ✓
Invalid Path: CART → SUCCESS (skip steps) ✗

Test valid transitions (5):
  1. CART → CHECKOUT
  2. CHECKOUT → PAYMENT
  3. PAYMENT → PROCESSING
  4. PROCESSING → SUCCESS
  5. SUCCESS → REFUND

Test invalid transitions (3):
  1. CART → SUCCESS (skip)
  2. CHECKOUT → SUCCESS (skip)
  3. SUCCESS → CANCELLED (can't cancel)

Total: 8+ tests
```

---

## 💡 Interview Talking Points

### Opening Answer
"I use four systematic test design techniques to ensure comprehensive coverage with minimal redundancy:

**Equivalence Partitioning** divides inputs into groups and tests one value from each group. For a password length requirement of 8-20 characters, instead of testing all 13 values, I test 3: one below (7 chars), one in range (15 chars), one above (21 chars).

**Boundary Value Analysis** focuses on values at partition edges where bugs often hide. For age 18-65, I specifically test 17, 18, 65, 66 to catch off-by-one errors.

**Decision Tables** show all combinations of conditions and ensure each logic path is tested. For loan approval with three conditions (age, income, credit score), I create a table showing all 8 combinations and test each one.

**State Transitions** map valid and invalid state changes. For e-commerce checkout (Cart→Checkout→Payment→Success), I test all valid paths and error cases like trying to skip steps.

Together, these techniques ensure systematic, comprehensive test coverage."

### Follow-Up: "Can you give a specific example?"
"Sure! For a shopping cart quantity field with rules:
- Minimum: 1 item
- Maximum: 999 items
- 0 = remove from cart
- 1000+ = error

Using EP and BVA, I created 10 test cases:
- Below minimum (0): Remove
- At minimum (1): Add
- Middle values (50, 500): Add
- At maximum (999): Add
- Above maximum (1000): Error
- Invalid inputs (5.5, "abc", -5): Error

This covers all scenarios without redundancy."

---

## ✅ Your 5 Complete Deliverables

### ✅ Deliverable 1: Login Email Validation (EP + BVA)
- 11 test cases
- All email validation scenarios covered
- Ready for portfolio/interview

### ✅ Deliverable 2: Shopping Cart Quantity (EP + BVA)
- 10 test cases
- All quantity constraints covered
- Practical e-commerce example

### ✅ Deliverable 3: Bank Transfer Amount (EP + BVA)
- 11 test cases
- All transfer scenarios covered
- Realistic financial application

### ✅ Deliverable 4: Decision Table (Money Transfer Approval)
- 8 test cases
- All 8 condition combinations tested
- Complete decision table provided

### ✅ Deliverable 5: State Transitions (E-Commerce Checkout)
- 13 test cases
- All valid + invalid transitions tested
- Complete state machine provided

**TOTAL: 53 test cases** demonstrating mastery of all 4 techniques

---

## 📚 Where to Find Everything

**File Structure:**
```
day2/
├─ Day2_Test_Design_Techniques_Intro.md
│  └─ Overview of all 4 techniques
│  └─ Real Fincity examples
│  └─ Conceptual understanding
│
├─ Day2_Solved_Problems_EP_BVA.md
│  └─ Problem 1: Login Email (11 tests)
│  └─ Problem 2: Shopping Cart (10 tests)
│  └─ Problem 3: Bank Transfer (11 tests)
│  └─ Step-by-step solutions
│
├─ Day2_Decision_Tables_State_Transitions.md
│  └─ Decision Table (Money Transfer - 8 tests)
│  └─ State Transitions (E-Commerce - 13 tests)
│  └─ Complete analysis
│
└─ Day2_Quick_Reference.md (this file)
   └─ Quick lookup reference
   └─ Interview talking points
   └─ Problem-solving flowchart
```

---

## 🎯 Before Your Interview

**Practice explaining:**
- [ ] What is Equivalence Partitioning and why use it?
- [ ] What is Boundary Value Analysis and when to apply it?
- [ ] What is a Decision Table and how many tests for N conditions?
- [ ] What are State Transitions and when to use them?
- [ ] "Describe a specific test design example"
- [ ] "How many test cases would you create for [scenario]?"

**Have ready:**
- [ ] 3 EP + BVA examples (Login, Cart, Transfer)
- [ ] 1 Decision Table example (Loan Approval)
- [ ] 1 State Transition example (E-Commerce)
- [ ] Your explanations for each technique
- [ ] Real Fincity examples if asked

---

## ✨ Pro Tips

1. **Always mention systematic approach** - "I don't guess; I systematically partition inputs"
2. **Use numbers** - "32 test cases from EP+BVA" vs "I wrote some test cases"
3. **Explain the benefit** - "This reduces redundancy while ensuring 100% coverage"
4. **Show real examples** - Have specific examples ready
5. **Ask clarifying questions** - "What's the input range?" (shows thinking)
6. **Tie to business** - "These techniques catch bugs before production"

---

**You're ready for Day 2 interview questions!** 💪🎯
