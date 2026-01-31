# Day 2 – Solved Examples: EP & BVA (3 Complete Problems)

## 📋 SOLVED PROBLEM 1: Login Email Validation (EP + BVA)

### Requirement Analysis
```
Email Validation Rules:
├─ Length: 5-50 characters
├─ Must contain "@" symbol
├─ Must have valid domain (. and extension)
├─ No leading/trailing spaces
└─ No consecutive dots
```

### STEP 1: Identify Equivalence Partitions (EP)

```
PARTITION 1 - Length:
├─ P1: Invalid < 5 chars     (e.g., "a@b")
├─ P2: Valid 5-50 chars      (e.g., "user@company.com")
└─ P3: Invalid > 50 chars    (e.g., "verylongemail...@company.com")

PARTITION 2 - @ Symbol:
├─ P4: Valid - contains @    (e.g., "user@company.com")
└─ P5: Invalid - no @        (e.g., "usercompany.com")

PARTITION 3 - Domain Format:
├─ P6: Valid domain          (e.g., "user@company.com")
└─ P7: Invalid domain        (e.g., "user@company" OR "user@.com")

PARTITION 4 - Special Cases:
├─ P8: Leading/trailing space (e.g., " user@company.com ")
└─ P9: Consecutive dots       (e.g., "user..name@company.com")
```

### STEP 2: Create EP Test Cases

| Test ID | Email | Partition | Expected Result | Reason |
|---------|-------|-----------|-----------------|--------|
| TC-EP-1 | "a@b" | P1 | ❌ REJECT | < 5 chars |
| TC-EP-2 | "user@company.com" | P2 | ✅ ACCEPT | Valid 5-50 chars |
| TC-EP-3 | "a" × 51 + "@company.com" | P3 | ❌ REJECT | > 50 chars |
| TC-EP-4 | "usercompany.com" | P5 | ❌ REJECT | Missing @ |
| TC-EP-5 | "user@company" | P7 | ❌ REJECT | No domain extension |
| TC-EP-6 | " user@company.com " | P8 | ❌ REJECT | Leading/trailing space |
| TC-EP-7 | "user..name@company.com" | P9 | ❌ REJECT | Consecutive dots |

**EP Analysis:** 7 tests from 7 different partitions covering all input scenarios

### STEP 3: Identify Boundary Values (BVA)

```
LENGTH BOUNDARY (5-50):
├─ Below lower (4): "a@b.c" 
├─ At lower (5): "ab@cd.e"
├─ At upper (50): "a" × 44 + "@company.co"
└─ Above upper (51): "a" × 45 + "@company.co"

DOMAIN STRUCTURE BOUNDARIES:
├─ Minimum domain: "a@b.c" (exactly @ and .)
├─ Valid domain: "user@example.co"
└─ Maximum domain: "useruser@company.company"
```

### STEP 4: Create BVA Test Cases

| Test ID | Email | Boundary | Expected Result |
|---------|-------|----------|-----------------|
| TC-BVA-1 | "a@b.c" | Length = 4 | ❌ REJECT |
| TC-BVA-2 | "ab@cd.e" | Length = 5 | ✅ ACCEPT |
| TC-BVA-3 | "a" × 44 + "@company.co" | Length = 50 | ✅ ACCEPT |
| TC-BVA-4 | "a" × 45 + "@company.co" | Length = 51 | ❌ REJECT |
| TC-BVA-5 | "user@example.co" | Valid domain | ✅ ACCEPT |
| TC-BVA-6 | "user@example" | Missing extension | ❌ REJECT |

### STEP 5: Final Test Suite (Login Email - 13 tests)

| Test ID | Email | Type | Expected |
|---------|-------|------|----------|
| TC-BVA-1 | "a@b.c" | BVA: Length 4 | ❌ REJECT |
| TC-BVA-2 | "ab@cd.e" | BVA: Length 5 | ✅ ACCEPT |
| TC-EP-2 | "user@company.com" | EP: Valid | ✅ ACCEPT |
| TC-BVA-3 | "a" × 44 + "@company.co" | BVA: Length 50 | ✅ ACCEPT |
| TC-BVA-4 | "a" × 45 + "@company.co" | BVA: Length 51 | ❌ REJECT |
| TC-EP-4 | "usercompany.com" | EP: No @ | ❌ REJECT |
| TC-EP-5 | "user@company" | EP: No extension | ❌ REJECT |
| TC-BVA-5 | "user@example.co" | BVA: Valid domain | ✅ ACCEPT |
| TC-BVA-6 | "user@example" | BVA: Invalid domain | ❌ REJECT |
| TC-EP-6 | " user@company.com " | EP: Spaces | ❌ REJECT |
| TC-EP-7 | "user..name@company.com" | EP: Consecutive dots | ❌ REJECT |

**Summary: 11 test cases** providing 100% coverage

---

## 📋 SOLVED PROBLEM 2: Shopping Cart Quantity (EP + BVA)

### Requirement Analysis
```
Quantity Rules:
├─ Minimum: 1 item per product
├─ Maximum: 999 items per product
├─ 0 items: Remove from cart
├─ 1000+: Error message "Exceeds warehouse limit"
└─ Non-integer: Error message "Invalid quantity"
```

### STEP 1: Identify Equivalence Partitions

```
PARTITION 1 - Amount:
├─ P1: Invalid - Remove (0 items)
├─ P2: Valid - Add (1-999 items)
└─ P3: Invalid - Error (1000+ items)

PARTITION 2 - Input Type:
├─ P4: Valid integer
├─ P5: Invalid decimal (e.g., "5.5")
├─ P6: Invalid text (e.g., "abc")

PARTITION 3 - Negative:
├─ P7: Negative numbers (e.g., "-5")
```

### STEP 2: Create EP Test Cases

| Test ID | Quantity | Partition | Expected | Action |
|---------|----------|-----------|----------|--------|
| TC-EP-1 | 0 | P1 | ✅ Remove | Item removed from cart |
| TC-EP-2 | 5 | P2 | ✅ Add | Added to cart |
| TC-EP-3 | 1000 | P3 | ❌ Error | "Exceeds warehouse limit" |
| TC-EP-4 | 5.5 | P5 | ❌ Error | "Invalid quantity" |
| TC-EP-5 | "abc" | P6 | ❌ Error | "Invalid quantity" |
| TC-EP-6 | -5 | P7 | ❌ Error | "Invalid quantity" |

### STEP 3: Identify BVA Boundaries

```
AMOUNT BOUNDARY (1-999):
├─ Below lower (0): Remove item
├─ At lower (1): Add 1 item
├─ At upper (999): Add 999 items
├─ Above upper (1000): Error
```

### STEP 4: Create BVA Test Cases

| Test ID | Quantity | Boundary | Expected |
|---------|----------|----------|----------|
| TC-BVA-1 | 0 | Below 1 | ✅ Remove |
| TC-BVA-2 | 1 | At lower | ✅ Add |
| TC-BVA-3 | 999 | At upper | ✅ Add |
| TC-BVA-4 | 1000 | Above upper | ❌ Error |

### STEP 5: Final Test Suite (Shopping Cart - 10 tests)

| Test ID | Quantity | Type | Expected Result |
|---------|----------|------|-----------------|
| TC-BVA-1 | 0 | BVA: Below lower | ✅ Remove from cart |
| TC-BVA-2 | 1 | BVA: At lower | ✅ Add to cart |
| TC-EP-2 | 5 | EP: Middle value | ✅ Add to cart |
| TC-EP-2 | 500 | EP: Middle value | ✅ Add to cart |
| TC-BVA-3 | 999 | BVA: At upper | ✅ Add to cart |
| TC-BVA-4 | 1000 | BVA: Above upper | ❌ Error: Exceeds limit |
| TC-EP-3 | 1001 | EP: Well above limit | ❌ Error: Exceeds limit |
| TC-EP-4 | 5.5 | EP: Decimal | ❌ Error: Invalid quantity |
| TC-EP-5 | "abc" | EP: Text | ❌ Error: Invalid quantity |
| TC-EP-6 | -5 | EP: Negative | ❌ Error: Invalid quantity |

**Summary: 10 test cases** covering all quantity scenarios

---

## 📋 SOLVED PROBLEM 3: Bank Transfer Amount (EP + BVA)

### Requirement Analysis
```
Transfer Rules:
├─ Minimum amount: $1.00
├─ Maximum amount: $50,000.00
├─ Daily limit: $100,000.00 total
├─ Requires sufficient balance
├─ Amount must be multiple of $0.01
└─ Negative amounts: Not allowed
```

### STEP 1: Identify Equivalence Partitions

```
PARTITION 1 - Amount Range:
├─ P1: Invalid - Below min ($0.99)
├─ P2: Valid - In range ($1-$50,000)
└─ P3: Invalid - Above max ($50,000.01)

PARTITION 2 - Decimal:
├─ P4: Valid decimals ($1.00, $5.55)
├─ P5: Invalid decimals ($1.001, $5.555)

PARTITION 3 - Balance:
├─ P6: Sufficient balance
└─ P7: Insufficient balance

PARTITION 4 - Daily Limit:
├─ P8: Within daily limit ($50,000 transferred, $50,000 limit remaining)
└─ P9: Exceeds daily limit ($80,000 transferred, only $20,000 remaining)
```

### STEP 2: Create EP Test Cases

| Test ID | Amount | Balance | Daily Used | Expected |
|---------|--------|---------|-----------|----------|
| TC-EP-1 | $0.99 | $1000 | $0 | ❌ Below minimum |
| TC-EP-2 | $100 | $1000 | $0 | ✅ Valid transfer |
| TC-EP-3 | $50,000.01 | $100,000 | $0 | ❌ Above maximum |
| TC-EP-4 | $100 | $50 | $0 | ❌ Insufficient balance |
| TC-EP-5 | $50,000 | $100,000 | $60,000 | ❌ Daily limit exceeded |
| TC-EP-6 | $1.999 | $1000 | $0 | ❌ Invalid decimal |

### STEP 3: Identify BVA Boundaries

```
AMOUNT BOUNDARY ($1-$50,000):
├─ Below lower ($0.99): Invalid
├─ At lower ($1.00): Valid
├─ At upper ($50,000.00): Valid
├─ Above upper ($50,000.01): Invalid

DAILY LIMIT BOUNDARY ($100,000):
├─ At limit: $100,000 used = $0 remaining
├─ Below limit: $50,000 used = $50,000 remaining
├─ Above limit: $100,001 used = Can't transfer more
```

### STEP 4: Create BVA Test Cases

| Test ID | Amount | Daily Used | Boundary | Expected |
|---------|--------|-----------|----------|----------|
| TC-BVA-1 | $0.99 | $0 | Below lower | ❌ Reject |
| TC-BVA-2 | $1.00 | $0 | At lower | ✅ Accept |
| TC-BVA-3 | $50,000.00 | $0 | At upper | ✅ Accept |
| TC-BVA-4 | $50,000.01 | $0 | Above upper | ❌ Reject |
| TC-BVA-5 | $25,000 | $75,000 | At daily limit | ✅ Accept (exactly at $100K) |
| TC-BVA-6 | $25,001 | $75,000 | Above daily limit | ❌ Exceed by $1 |

### STEP 5: Final Test Suite (Bank Transfer - 12 tests)

| Test ID | Amount | Balance | Daily Used | Type | Expected |
|---------|--------|---------|-----------|------|----------|
| TC-BVA-1 | $0.99 | $1000 | $0 | BVA: Below | ❌ Below min |
| TC-BVA-2 | $1.00 | $1000 | $0 | BVA: At lower | ✅ Valid |
| TC-EP-2 | $100 | $1000 | $0 | EP: Middle | ✅ Valid |
| TC-EP-2 | $5000 | $10,000 | $0 | EP: Middle | ✅ Valid |
| TC-BVA-3 | $50,000 | $100,000 | $0 | BVA: At upper | ✅ Valid |
| TC-BVA-4 | $50,000.01 | $100,000 | $0 | BVA: Above | ❌ Above max |
| TC-EP-4 | $100 | $50 | $0 | EP: Insufficient | ❌ Low balance |
| TC-BVA-5 | $25,000 | $100,000 | $75,000 | BVA: At limit | ✅ At daily limit |
| TC-BVA-6 | $25,001 | $100,000 | $75,000 | BVA: Exceeds | ❌ Daily exceeded |
| TC-EP-6 | $1.999 | $1000 | $0 | EP: Invalid decimal | ❌ Bad decimal |
| TC-EP-3 | -$100 | $1000 | $0 | EP: Negative | ❌ Negative amount |

**Summary: 11 test cases** covering all transfer constraints

---

## 🎯 Summary of All 3 Solved Problems

| Problem | Partitions | BVA Tests | Total Tests | Coverage |
|---------|-----------|-----------|------------|----------|
| **Login Email** | 9 | 6 | 11 | 100% |
| **Shopping Cart** | 7 | 4 | 10 | 100% |
| **Bank Transfer** | 9 | 6 | 11 | 100% |
| **TOTALS** | 25 | 16 | 32 | 100% |

**Key Insight:** Instead of creating 100+ redundant test cases, we systematically created 32 focused tests covering every partition and boundary.

---

## 📝 Template for Solving EP + BVA Problems

### For ANY input validation problem:

**STEP 1:** Identify all partitions
- Valid range
- Below valid range
- Above valid range
- Special cases (negative, text, decimals, etc.)

**STEP 2:** Create EP test cases
- One test case per partition
- Cover all distinct input types

**STEP 3:** Identify boundaries
- Below lower boundary
- At lower boundary
- At upper boundary
- Above upper boundary

**STEP 4:** Create BVA test cases
- Test each boundary value

**STEP 5:** Combine into final test suite
- Total = EP tests + BVA tests (with overlap removed)

---

**You now have 3 complete, solved problems ready to explain in interviews!** 🎯
