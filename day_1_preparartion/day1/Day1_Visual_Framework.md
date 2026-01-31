# Day 1 Visual Framework – How It All Connects

## 🏗️ The Complete Testing Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                    SDLC (Overall Software Lifecycle)            │
│                                                                 │
│  Planning → Analysis → Design → Development → TESTING ← Deploy│
│                                              ↑                 │
│                                         (YOUR FOCUS)            │
└─────────────────────────────────────────────────────────────────┘
                              ↓ Expands Into
┌─────────────────────────────────────────────────────────────────┐
│              STLC (Software Testing Lifecycle)                   │
│                    What YOU Orchestrate                         │
│                                                                 │
│  Planning → Analysis → Design → Execution → Closure            │
│     ↓          ↓         ↓          ↓          ↓               │
│  Define    Map RTM   Write Test  Execute    Prepare            │
│  Strategy  Against   Cases with   Tests &    Summary &         │
│  & Scope  Require-   Test Data    Log        Metrics           │
│            ments                  Defects                       │
└─────────────────────────────────────────────────────────────────┘
         ↓ Organized Into TEST LEVELS ↓
┌──────────────────────────────────────────────────────────────────┐
│                      TEST PYRAMID                                │
│                                                                  │
│                           ▲                                      │
│                          /│\                                     │
│                        /  │  \                    UAT             │
│                      /    │    \              (Real Users)       │
│                    /      │      \            ~5%                │
│                  /────────┼────────\                             │
│                /          │          \                          │
│              /            │            \      System Testing     │
│            /              │              \    (E2E - YOUR ROLE) │
│          /────────────────┼────────────────\   ~15%             │
│        /                  │                  \                  │
│      /                    │                    \                │
│    /                      │                      \  Integration  │
│  /────────────────────────┼────────────────────────\ (YOUR ROLE) │
│/                          │                          \  ~30%     │
│────────────────────────────┼──────────────────────────────────   │
│                            │                                      │
│     Unit Testing (Devs) ~50%                                      │
│                                                                  │
│ Each Level = Different Test Types Applied                       │
└──────────────────────────────────────────────────────────────────┘
         ↓ Across Multiple TEST TYPES ↓
┌──────────────────────────────────────────────────────────────────┐
│                    TEST TYPES MATRIX                             │
│                                                                  │
│  ┌─────────────┐         ┌──────────────────────┐              │
│  │ FUNCTIONAL  │         │  NON-FUNCTIONAL      │              │
│  │             │         │                      │              │
│  │ Does it     │         │ • Performance        │              │
│  │ work as     │         │ • Security           │              │
│  │ specified?  │         │ • Compatibility      │              │
│  │             │         │ • Usability          │              │
│  │ Examples:   │         │ • Reliability        │              │
│  │ • Happy     │         │                      │              │
│  │   path      │         │ Examples:            │              │
│  │ • Negative  │         │ • Cert verification  │              │
│  │ • Edge      │         │   < 500ms            │              │
│  │   cases     │         │ • Secure channel OK  │              │
│  │             │         │ • Works on PCF, AWS  │              │
│  └─────────────┘         └──────────────────────┘              │
│         ↓                          ↓                            │
│  Applied across all test levels                                │
└──────────────────────────────────────────────────────────────────┘


YOUR FINCITY PROJECT MAPPED TO THIS ARCHITECTURE
══════════════════════════════════════════════════════════════════

SDLC PHASE: Testing
└─ STLC PLANNING: "Test Strategy for PKCS12 Migration"
   └─ Delivered: Test Plan, RTM, Risk Register
   
STLC ANALYSIS: "Map Requirements to Test Coverage"
└─ 4 Transaction Types (void, refund, auth, capture)
   × 2 Certificate States (JKS pre-migration, PKCS12 post)
   × 3 Test Levels (unit, integration, system)
   = 40+ Test Scenarios

STLC DESIGN: "Create 40+ Detailed Test Cases"
└─ Each with: PreConditions, Steps, Expected Results, Test Data
   
   Examples:
   • TC-001: Happy Path - Authorization with PKCS12 (Functional + System Level)
   • TC-015: Invalid Certificate - Refund Denied (Functional + Negative)
   • TC-028: Concurrent Transactions - No Race (Functional + Edge Case)
   • TC-035: Cert Verification Time - <500ms (Performance + Integration)
   • TC-041: Secure Channel - SSL/TLS OK (Security + System)

STLC EXECUTION: "Run Tests Across Environments"
└─ Pre-Migration Environment: JKS certs
   ├─ TC-001 through TC-020 passed ✅
   ├─ Found: Race condition in TC-028 ❌ (CRITICAL)
   └─ Defect logged, dev fixes, re-test passed ✅
   
   Post-Migration Environment: PKCS12 certs
   ├─ TC-001 through TC-041 passed ✅
   ├─ All 4 regions validated ✅
   └─ Smoke suite (TC-001, TC-010, TC-020) ready for production ✅

STLC CLOSURE: "Validate Success & Hand Off"
└─ Test Summary Report:
   - Coverage: 100%
   - Pass Rate: 95/95 (after race condition fix)
   - Critical Defects: 0 ✅
   - Deployment Risk: LOW ✅
   - Production Ready: YES ✅


HOW THIS MAPS TO INTERVIEW STORYTELLING
════════════════════════════════════════════════════════════════════

Question: "Tell me about yourself"
Answer Framework:
├─ Opening: "6+ years orchestrating testing strategies..."
├─ Background: "Started in manual testing, evolved to senior QA..."
├─ Core Story: [STLC Journey]
│  ├─ Planning: "Defined strategy for 4 transaction types..."
│  ├─ Analysis: "Mapped coverage across levels and test types..."
│  ├─ Design: "Created 40+ detailed test cases..."
│  ├─ Execution: "Executed in pre/post migration environments..."
│  └─ Closure: "100% coverage, zero defects, deployed successfully..."
├─ Impact: "Proved quality is designed in, not added at the end"
└─ Forward: "Now building automation with Java & Rest Assured..."

Question: "What's your role end-to-end?"
Answer Framework: EXACT STLC walkthrough with Fincity examples


THE HIERARCHY OF YOUR TESTING RESPONSIBILITY
══════════════════════════════════════════════════════════════════

Level 1: STRATEGY (Senior QA ← You)
├─ Understand business requirements deeply
├─ Identify risks and testing priorities
├─ Design overall test strategy (test levels + types)
├─ Define success metrics (coverage %, defect density)
└─ Own quality sign-off

Level 2: PLANNING (Senior QA ← You)
├─ Create test plan and timelines
├─ Allocate resources and tools
├─ Define test environments
└─ Build requirements traceability matrix

Level 3: DESIGN (QA Analyst ← You/Team)
├─ Write detailed test cases
├─ Design test data
├─ Create test scenarios
└─ Document step-by-step procedures

Level 4: EXECUTION (QA Tester ← Team/Automation)
├─ Execute test cases
├─ Log defects with details
├─ Retest after fixes
└─ Track metrics

Level 5: CLOSURE (Senior QA ← You)
├─ Prepare final reports
├─ Calculate metrics
├─ Document lessons learned
└─ Hand off to support

👑 YOU OWN LEVELS 1, 2, AND 5 — You're the architect & owner
🤝 You collaborate on LEVELS 3 & 4 — You guide and verify


KEY TERMINOLOGY FOR INTERVIEWS
════════════════════════════════════════════════════════════════════

Term                     What It Means                Your Context

Test Plan               Document with strategy,      "I created a test plan covering
                        scope, resources, timeline   4 transaction types, pre/post
                                                    migration scenarios"

RTM                     Requirement ↔ Test Cases    "My RTM mapped all 4 transaction
(Traceability Matrix)   mapping; shows 100%         types to test cases; ensured
                        coverage                    100% coverage"

Test Scenario           Real-world use case         "Scenario: Customer authorizes
                        being tested                payment with PKCS12 cert"

Test Case               Step-by-step test of        "TC-001: Given valid cert,
                        one scenario                when transaction submitted,
                                                    then payment approved"

Test Data               Input values used in        "Test data: Valid cert, Invalid
                        test cases                  cert, Expired cert, Mismatched
                                                    credentials"

Defect/Bug              Something that doesn't      "Race condition: Concurrent
                        work as specified           transactions collided"

Severity                Impact if bug reaches       "Critical: Payment failures"
                        production                  "Major: Wrong transaction type"
                                                    "Minor: UI display issue"

Priority                Urgency of fixing bug       "High: Payment impact"
                                                    "Medium: Affects 1 transaction"
                                                    "Low: Rare edge case"

Coverage                % of requirements tested    "We achieved 100% coverage:
                                                    all transaction types, all regions"

Regression Test         Re-running old tests        "After race condition fix,
                        after changes               I ran regression tests on all
                                                    transaction types"

Smoke Test              Quick sanity check          "Smoke suite: Authorization →
                        of critical paths           Capture flow works (5 tests)"

Defect Escape Rate      % of bugs found in          "We had 0 escapes—the race
                        production vs. pre-prod     condition was caught pre-prod"

Test Automation         Using scripts/tools to      "I'm building Rest Assured
                        run tests repeatedly        automation for API testing"


FINCITY PROJECT MAPPED TO TERMINOLOGY
════════════════════════════════════════════════════════════════════

Component                                    Your Artifact

Business Requirement: Migrate JKS→PKCS12     
  ↓
Test Plan (Strategy)                        "Comprehensive test strategy covering
                                            4 transaction types + pre/post states"

Requirement Traceability Matrix             40+ test cases
  ├─ Void Transaction                       TC-001 through TC-010
  ├─ Refund Transaction                     TC-011 through TC-020
  ├─ Authorization Transaction              TC-021 through TC-030
  └─ Capture Transaction                    TC-031 through TC-041

Test Scenarios (Real-World Uses)            "When customer authorizes payment
                                            with PKCS12 cert, system validates
                                            certificate chain and approves"

Test Cases (Step-by-Step)                   "TC-001: Happy Path - Authorization
                                            Step 1: Login with valid credentials
                                            Step 2: Submit authorization request
                                            Step 3: Verify certificate validation
                                            Step 4: Confirm payment approved"

Test Data                                   Valid cert, Expired cert, Invalid
                                            cert, Mismatched credentials

Defects Found                               Race condition in concurrent
                                            transactions (1 Critical)

Severity/Priority                           Critical/High (impacts all payments)

Regression Tests                            Re-run after race condition fix;
                                            all 95 test cases passed

Smoke Tests                                 3 critical-path tests for production
                                            monitoring

Coverage Achieved                           100% (all 4 transaction types tested)

Defect Escape Rate                          0 (zero defects in production)

Metrics                                     95 tests, 94 pre-fix, 95 post-fix
                                            0 critical defects, 100% coverage


YOUR ANSWER ROADMAP (How to Use This)
════════════════════════════════════════════════════════════════════

When interviewer asks "Tell me about yourself":
1. Open with your positioning (6+ years, fintech, orchestrating strategies)
2. Give background (manual → senior QA, automation exposure)
3. Launch your STLC journey through Fincity:
   - Planning: Test strategy for complex migration
   - Analysis: 40+ scenarios across 3 levels
   - Design: Detailed test cases with test data
   - Execution: Pre-migration, post-migration, all regions
   - Closure: 100% coverage, 0 critical defects
4. Impact: Quality designed in; production success
5. Forward: Building automation skills

When interviewer asks "What's your role end-to-end":
1. State context: QA lead for Fincity migration
2. Walk through STLC phases:
   Planning → Analysis → Design → Execution → Closure
3. For each phase: What you did, what you delivered
4. Closing: "I was quality guardian—architecting, executing, communicating"

When interviewer asks about test levels/types:
Use this diagram mentally:
- Test Pyramid: Unit (50) → Integration (30) → System (15) → UAT (5)
- Test Types: Functional (does it work?) + Non-Functional (perf/sec/compat)
- Your focus: System & Integration levels
- Why: Payment systems can't tolerate level failures

When asked about defect management:
Tell the race condition story:
- Situation: Concurrent transaction testing
- Task: Find why transactions occasionally fail
- Action: Designed edge case tests, reproduced race, documented
- Result: Dev fixed, regression verified, zero escapes


CONFIDENCE CHECK ✅
════════════════════════════════════════════════════════════════════

Can you explain:

□ SDLC 6 phases (Planning → Analysis → Design → Dev → Testing → Deploy)
□ STLC 5 phases (Planning → Analysis → Design → Execution → Closure)
□ Test Pyramid (Unit 50% → Integration 30% → System 15% → UAT 5%)
□ Functional vs Non-Functional testing
□ Your Fincity role end-to-end through STLC phases
□ Why you focused on integration & system testing (payment criticality)
□ The race condition defect & how you found it
□ 100% coverage & 0 critical defects result
□ Your evolution from manual to automation

If YES to all → Ready for interviews ✅
If NO to any → Reread this section + Day1_Foundations_Positioning.md

Next step: Practice your answers out loud!
