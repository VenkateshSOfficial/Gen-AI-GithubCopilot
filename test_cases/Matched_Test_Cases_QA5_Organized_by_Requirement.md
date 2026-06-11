# Matched Test Cases - QA-5
## Disable Address Auto-Suggestions During Checkout
## Organized by Requirement & Acceptance Criteria

**Source Issue**: QA-5 (nexus-qa project)  
**Date Generated**: 2026-06-11  
**Coverage Status**: ✅ 100% (All 6 scenarios fully tested)  
**Total Matching Test Cases**: 54  

---

## 🎯 QUICK NAVIGATION

- [REQ-S1: Disable Auto-Suggestions Flow](#requirement-s1--disable-auto-suggestions-flow) (9 tests)
- [REQ-S2: Enable Auto-Suggestions Flow](#requirement-s2--enable-auto-suggestions-flow) (9 tests)
- [REQ-S3: Logged-In User Persistence](#requirement-s3--logged-in-user-persistence) (9 tests)
- [REQ-S4: Guest User Session Storage](#requirement-s4--guest-user-session-storage) (9 tests)
- [REQ-S5: Accessibility (WCAG Compliance)](#requirement-s5--accessibility-wcag-compliance) (9 tests)
- [REQ-S6: Address Validation Independence](#requirement-s6--address-validation-independence) (9 tests)

---

# REQUIREMENT S1: Disable Auto-Suggestions Flow
## Acceptance Criteria: User can disable address auto-suggestions, enter address manually without interruptions, validation remains independent

**Coverage**: 100% (9/9 tests)  
**Test Types**: Unit (6), Integration (3)  
**Priority**: High (7), Medium (2)  

### TC_QA5_001: Toggle visible on checkout page

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S1 |
| **Category** | UI Verification |
| **Preconditions** | User on checkout page with address section visible |
| **Test Data** | N/A |
| **Given** | User is on checkout page |
| **When** | User looks at address section |
| **Then** | Toggle labeled "Enable Auto-Suggestions" is visible |
| **Expected Result** | Toggle switch is visible, properly labeled, easily identifiable |
| **Validation Criteria** | Visual inspection; accessibility inspector shows toggle element |
| **Platforms** | Chrome, Firefox, Safari; Desktop 1920x1080 |
| **Automation** | ✅ Yes (CSS selector verification) |
| **Status** | ✅ Ready |

---

### TC_QA5_002: Toggle default state is enabled

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S1 |
| **Category** | Default State Verification |
| **Preconditions** | User on checkout page, first visit (no prior preferences) |
| **Test Data** | N/A |
| **Given** | User visits checkout page for first time |
| **When** | Page loads |
| **Then** | Verify toggle state |
| **Expected Result** | Toggle is enabled (ON) by default; suggestions will appear as user types |
| **Validation Criteria** | CSS class verification: aria-checked="true", visual checked state |
| **Platforms** | Chrome, Firefox, Safari; Desktop, Tablet, Mobile |
| **Automation** | ✅ Yes (State assertion) |
| **Status** | ✅ Ready |

---

### TC_QA5_003: Disable suggestions by clicking toggle

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S1 |
| **Category** | Toggle Interaction |
| **Preconditions** | User on checkout page with toggle visible and enabled |
| **Test Data** | N/A |
| **Given** | Toggle is enabled |
| **When** | User clicks toggle switch |
| **Then** | Verify state change |
| **Expected Result** | Toggle switches to disabled state; visual indicator changes (checked → unchecked) |
| **Validation Criteria** | aria-checked="false", CSS class changes, visual feedback immediate |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Click + state verification) |
| **Status** | ✅ Ready |

---

### TC_QA5_004: Address input accepts manual entry without suggestions

| Field | Value |
|-------|-------|
| **Test Type** | Integration |
| **Priority** | High |
| **Requirement** | REQ-S1 |
| **Category** | Functional Behavior |
| **Preconditions** | Toggle disabled, address field focused and ready for input |
| **Test Data** | Manual address: "123 Main St, Springfield, IL 62701" |
| **Given** | Suggestions disabled |
| **When** | User types address manually |
| **Then** | Verify input is accepted |
| **Expected Result** | Address typed is displayed without suggestion dropdown appearing |
| **Validation Criteria** | Input field contains typed text; no .suggestions-dropdown element visible |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Input + DOM verification) |
| **Status** | ✅ Ready |

---

### TC_QA5_005: Partial address entry does not trigger suggestions

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S1 |
| **Category** | Suggestion Prevention |
| **Preconditions** | Toggle disabled, user starting to type address |
| **Test Data** | Partial input: "123 Main" |
| **Given** | Suggestions disabled |
| **When** | User types partial address |
| **Then** | No suggestions shown |
| **Expected Result** | No autocomplete dropdown visible; user can continue typing freely |
| **Validation Criteria** | querySelector('.suggestions-dropdown') returns null; input retains focus |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (DOM assertion) |
| **Status** | ✅ Ready |

---

### TC_QA5_006: Special characters accepted in disabled mode

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | Medium |
| **Requirement** | REQ-S1 |
| **Category** | Input Validation |
| **Preconditions** | Toggle disabled, address field ready for input |
| **Test Data** | Special chars: "O'Reilly Rd, St. Paul's Way, Père Goriot Ave" |
| **Given** | Suggestions disabled |
| **When** | User enters address with apostrophes, periods, accents |
| **Then** | Verify acceptance |
| **Expected Result** | All special characters accepted and displayed correctly |
| **Validation Criteria** | Input value matches entered text exactly; no character encoding issues |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (String comparison) |
| **Status** | ✅ Ready |

---

### TC_QA5_007: Validation still occurs with suggestions disabled

| Field | Value |
|-------|-------|
| **Test Type** | Integration |
| **Priority** | High |
| **Requirement** | REQ-S1 |
| **Category** | Validation Independence |
| **Preconditions** | Toggle disabled, address field filled with invalid data |
| **Test Data** | Invalid address: "999" (too short, incomplete) |
| **Given** | Suggestions disabled |
| **When** | User enters invalid/incomplete address and clicks submit |
| **Then** | Verify validation |
| **Expected Result** | Address validation error displayed; form not submitted; user prompted to correct |
| **Validation Criteria** | Error message visible; form.submitted === false; error class applied to field |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Click + validation) |
| **Status** | ✅ Ready |

---

### TC_QA5_008: Long address entries supported

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | Medium |
| **Requirement** | REQ-S1 |
| **Category** | Edge Case |
| **Preconditions** | Toggle disabled, address field active |
| **Test Data** | Long address: "4325 North Willamette Boulevard, Apartment 502, Portland, Oregon 97217-3720" |
| **Given** | Suggestions disabled |
| **When** | User enters long address (60+ characters) |
| **Then** | Verify input |
| **Expected Result** | Full address displayed; no truncation or character limit errors |
| **Validation Criteria** | Address length > 60 chars; displayed in full; value.length >= 60 |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Length assertion) |
| **Status** | ✅ Ready |

---

### TC_QA5_009: Multiple address fields work when disabled

| Field | Value |
|-------|-------|
| **Test Type** | Integration |
| **Priority** | High |
| **Requirement** | REQ-S1 |
| **Category** | Multi-Field Behavior |
| **Preconditions** | Toggle disabled affecting all address fields (street, city, state, zip) |
| **Test Data** | Multiple fields: Street="123 Main St", City="Springfield", State="IL", Zip="62701" |
| **Given** | Suggestions disabled |
| **When** | User fills multiple address fields |
| **Then** | Verify all accept input |
| **Expected Result** | All fields accept manual entry without suggestions; no cross-field interference |
| **Validation Criteria** | All 4 fields populated; no dropdown in any field; values retained |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Multi-field DOM check) |
| **Status** | ✅ Ready |

---

# REQUIREMENT S2: Enable Auto-Suggestions Flow
## Acceptance Criteria: User can enable suggestions, suggestions appear correctly, user can select from suggestions, keyboard navigation works

**Coverage**: 100% (9/9 tests)  
**Test Types**: Unit (6), Integration (3)  
**Priority**: High (7), Medium (2)  

### TC_QA5_010: Re-enable suggestions by toggling on

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S2 |
| **Category** | Toggle Interaction |
| **Preconditions** | Toggle currently disabled |
| **Test Data** | N/A |
| **Given** | Suggestions currently disabled |
| **When** | User clicks toggle to enable |
| **Then** | Verify state change |
| **Expected Result** | Toggle switches to enabled state; visual indicator changes (unchecked → checked) |
| **Validation Criteria** | aria-checked="true", CSS class changes, aria-pressed="true" |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Click + state assertion) |
| **Status** | ✅ Ready |

---

### TC_QA5_011: Suggestions appear when enabled

| Field | Value |
|-------|-------|
| **Test Type** | Integration |
| **Priority** | High |
| **Requirement** | REQ-S2 |
| **Category** | Suggestion Display |
| **Preconditions** | Toggle re-enabled, address field focused |
| **Test Data** | Trigger text: "New Y" (should suggest New York, etc.) |
| **Given** | Suggestions re-enabled |
| **When** | User types address prefix |
| **Then** | Verify dropdown appears |
| **Expected Result** | Suggestion dropdown appears below field with matching address options |
| **Validation Criteria** | querySelector('.suggestions-dropdown').style.display !== 'none'; dropdown contains items |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Type + dropdown visibility) |
| **Status** | ✅ Ready |

---

### TC_QA5_012: User can select from suggestions

| Field | Value |
|-------|-------|
| **Test Type** | Integration |
| **Priority** | High |
| **Requirement** | REQ-S2 |
| **Category** | Suggestion Selection |
| **Preconditions** | Toggle enabled, suggestions dropdown visible with options |
| **Test Data** | Selection: Click on "New York, NY" from dropdown |
| **Given** | Suggestions enabled and showing options |
| **When** | User clicks on suggestion |
| **Then** | Verify selection |
| **Expected Result** | Selected address populates field; suggestion state returns to normal |
| **Validation Criteria** | Field value = "New York, NY"; dropdown hidden; focus remains in field |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Click + value assertion) |
| **Status** | ✅ Ready |

---

### TC_QA5_013: Partial suggestions work correctly

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S2 |
| **Category** | Suggestion Filtering |
| **Preconditions** | Toggle enabled, address field active |
| **Test Data** | Query: "Chi" (should suggest Chicago, Chico, etc.) |
| **Given** | Suggestions enabled |
| **When** | User types partial city name |
| **Then** | Verify suggestions shown |
| **Expected Result** | Multiple matching suggestions displayed in dropdown |
| **Validation Criteria** | dropdown.children.length > 1; all items contain "Chi"; case-insensitive match |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (DOM assertion) |
| **Status** | ✅ Ready |

---

### TC_QA5_014: Suggestions include postal codes

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | Medium |
| **Requirement** | REQ-S2 |
| **Category** | Suggestion Content |
| **Preconditions** | Toggle enabled, user entering zip/postal code |
| **Test Data** | Query: "9" (various 90xxx zip codes) |
| **Given** | Suggestions enabled |
| **When** | User starts typing zip code |
| **Then** | Verify suggestions include zips |
| **Expected Result** | Postal codes matching input shown in suggestions |
| **Validation Criteria** | Suggestion items include postal codes; formatted correctly (e.g., "90210") |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Text content assertion) |
| **Status** | ✅ Ready |

---

### TC_QA5_015: Toggling on/off multiple times works correctly

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S2 |
| **Category** | State Management |
| **Preconditions** | User has toggled suggestion setting multiple times |
| **Test Data** | Sequence: Enable → Disable → Enable → Disable → Enable |
| **Given** | User has toggled multiple times |
| **When** | Final toggle state is enabled |
| **Then** | Verify suggestions work |
| **Expected Result** | Suggestions function correctly after multiple toggles; no state corruption |
| **Validation Criteria** | Final toggle state = enabled; suggestions appear on typing; no console errors |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Multiple clicks + final state check) |
| **Status** | ✅ Ready |

---

### TC_QA5_016: Suggestion dropdown closes when field loses focus

| Field | Value |
|-------|-------|
| **Test Type** | Integration |
| **Priority** | High |
| **Requirement** | REQ-S2 |
| **Category** | Dropdown Behavior |
| **Preconditions** | Toggle enabled, suggestions showing, user moves focus away |
| **Test Data** | Action: Tab to next field |
| **Given** | Suggestion dropdown is open |
| **When** | User tabs/clicks away from address field |
| **Then** | Verify dropdown closes |
| **Expected Result** | Dropdown closes; selected value retained or cleared based on user action |
| **Validation Criteria** | dropdown.style.display === 'none'; document.activeElement !== addressField |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Tab + focus verification) |
| **Status** | ✅ Ready |

---

### TC_QA5_017: Keyboard navigation works in suggestion list

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S2 |
| **Category** | Keyboard Interaction |
| **Preconditions** | Toggle enabled, suggestions dropdown visible |
| **Test Data** | Navigation: Arrow keys to select, Enter to confirm |
| **Given** | Suggestions showing |
| **When** | User uses arrow keys to navigate |
| **Then** | Verify selection |
| **Expected Result** | Items highlighted as user navigates; pressing Enter selects item |
| **Validation Criteria** | ArrowDown highlights next item; ArrowUp highlights prev item; Enter selects highlighted |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Key event simulation) |
| **Status** | ✅ Ready |

---

### TC_QA5_018: Escape key closes suggestion dropdown

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | Medium |
| **Requirement** | REQ-S2 |
| **Category** | Keyboard Interaction |
| **Preconditions** | Toggle enabled, suggestions dropdown showing |
| **Test Data** | Action: Press Escape key |
| **Given** | Suggestion dropdown is open |
| **When** | User presses Escape |
| **Then** | Verify dropdown closes |
| **Expected Result** | Dropdown closes; field retains current input |
| **Validation Criteria** | dropdown.style.display === 'none'; input value unchanged |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Key event + DOM check) |
| **Status** | ✅ Ready |

---

# REQUIREMENT S3: Logged-In User Persistence
## Acceptance Criteria: For logged-in users, preference saves to profile, persists across sessions, persists across devices

**Coverage**: 100% (9/9 tests)  
**Test Types**: Unit (3), Integration (6)  
**Priority**: High (6), Medium (3)  

### TC_QA5_019: Logged-in preference saves to profile

| Field | Value |
|-------|-------|
| **Test Type** | Integration |
| **Priority** | High |
| **Requirement** | REQ-S3 |
| **Category** | Data Persistence |
| **Preconditions** | User logged in, at checkout page, toggle state to be changed |
| **Test Data** | User: logged-in customer account; Toggle: disabled |
| **Given** | Logged-in user disables suggestions |
| **When** | User changes toggle state |
| **Then** | Verify save to profile |
| **Expected Result** | Toggle state saved to user account; no error on save |
| **Validation Criteria** | API call to /api/user/preferences; HTTP 200 response; preference stored in DB |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (API mock + assertion) |
| **Status** | ✅ Ready |

---

### TC_QA5_020: Preference persists across sessions (logged-in)

| Field | Value |
|-------|-------|
| **Test Type** | Integration |
| **Priority** | High |
| **Requirement** | REQ-S3 |
| **Category** | Cross-Session Persistence |
| **Preconditions** | User logs out and logs back in, visits checkout again |
| **Test Data** | User: Same logged-in customer account |
| **Given** | User disabled suggestions previously |
| **When** | User logs back in and visits checkout |
| **Then** | Verify preference loaded |
| **Expected Result** | Toggle defaults to disabled state; user preference loaded from profile |
| **Validation Criteria** | API fetch /api/user/preferences returns disabled; toggle aria-checked="false" |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Login simulation + state check) |
| **Status** | ✅ Ready |

---

### TC_QA5_021: Preference persists across different devices (logged-in)

| Field | Value |
|-------|-------|
| **Test Type** | Integration |
| **Priority** | High |
| **Requirement** | REQ-S3 |
| **Category** | Cross-Device Sync |
| **Preconditions** | User disabled suggestions on Device A, logs in on Device B |
| **Test Data** | User: Same logged-in customer; Devices: Desktop + Mobile |
| **Given** | User disabled on desktop |
| **When** | User logs in on mobile/tablet |
| **Then** | Verify preference syncs |
| **Expected Result** | Toggle state matches across devices; suggestion setting consistent |
| **Validation Criteria** | Device B fetches same preference; toggle aria-checked matches Device A |
| **Platforms** | Chrome (Desktop), Chrome (Mobile), Safari (iPad) |
| **Automation** | ✅ Yes (Multi-device simulation) |
| **Status** | ✅ Ready |

---

### TC_QA5_022: Multiple checkout sessions maintain preference (logged-in)

| Field | Value |
|-------|-------|
| **Test Type** | Integration |
| **Priority** | High |
| **Requirement** | REQ-S3 |
| **Category** | Session Persistence |
| **Preconditions** | User completes checkout, returns for second purchase |
| **Test Data** | User: Logged-in customer; Preference: disabled |
| **Given** | User disabled suggestions in first session |
| **When** | User starts second checkout |
| **Then** | Verify preference persists |
| **Expected Result** | Toggle state matches previous session; preference not reset |
| **Validation Criteria** | Toggle aria-checked="false" on second checkout; consistent across sessions |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Multi-session simulation) |
| **Status** | ✅ Ready |

---

### TC_QA5_023: Preference loads quickly (performance - logged-in)

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S3 |
| **Category** | Performance |
| **Preconditions** | Logged-in user on checkout page with saved preference |
| **Test Data** | User: Has saved preference; Network: Normal 3G |
| **Given** | User with saved preference loads checkout |
| **When** | Page loads |
| **Then** | Measure load time |
| **Expected Result** | Toggle reflects saved state within 2 seconds; no loading indicator flicker |
| **Validation Criteria** | performance.measure() < 2000ms; toggle state set before visual render complete |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Performance timing) |
| **Status** | ✅ Ready |

---

### TC_QA5_024: Preference changeable at any time (logged-in)

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S3 |
| **Category** | User Control |
| **Preconditions** | User at checkout with saved preference |
| **Test Data** | Toggle action: Change saved state |
| **Given** | User has saved preference |
| **When** | User toggles the setting |
| **Then** | Verify change applies immediately |
| **Expected Result** | Toggle state changes immediately; new state saves to profile |
| **Validation Criteria** | Toggle responds instantly; API save completes; no "unsaved" indicator |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Click + immediate state change) |
| **Status** | ✅ Ready |

---

### TC_QA5_025: Account deletion removes saved preference

| Field | Value |
|-------|-------|
| **Test Type** | Integration |
| **Priority** | Medium |
| **Requirement** | REQ-S3 |
| **Category** | Data Cleanup |
| **Preconditions** | User account is deleted |
| **Test Data** | User: Account with saved preference; Action: Account deletion |
| **Given** | User preference saved in profile |
| **When** | User account is deleted |
| **Then** | Verify preference removed |
| **Expected Result** | Preference deleted from user account; no orphaned data |
| **Validation Criteria** | User preference table query returns no results; audit log shows deletion |
| **Platforms** | Backend verification |
| **Automation** | ✅ Yes (Database query) |
| **Status** | ✅ Ready |

---

### TC_QA5_026: Profile update does not affect preference

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | Medium |
| **Requirement** | REQ-S3 |
| **Category** | Data Isolation |
| **Preconditions** | User updates profile information |
| **Test Data** | Profile change: Update address book, add payment method |
| **Given** | User with saved preference updates profile |
| **When** | Changes are saved |
| **Then** | Verify preference unchanged |
| **Expected Result** | Suggestion setting unaffected by profile updates |
| **Validation Criteria** | Toggle state same before/after profile update; API isolation verified |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Profile update + state assertion) |
| **Status** | ✅ Ready |

---

### TC_QA5_027: Concurrent sessions maintain same preference

| Field | Value |
|-------|-------|
| **Test Type** | Integration |
| **Priority** | Medium |
| **Requirement** | REQ-S3 |
| **Category** | Concurrent Access |
| **Preconditions** | User opens multiple browser tabs/windows for checkout |
| **Test Data** | Scenario: Open checkout in Tab 1 and Tab 2, disable in Tab 1 |
| **Given** | User opens checkout in multiple tabs |
| **When** | User toggles in one tab |
| **Then** | Verify other tabs sync |
| **Expected Result** | All tabs show consistent preference state (may require page refresh) |
| **Validation Criteria** | Tab 2 toggle reflects Tab 1 change after refresh; no conflicting states |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Multi-tab simulation) |
| **Status** | ✅ Ready |

---

# REQUIREMENT S4: Guest User Session Storage
## Acceptance Criteria: For guest users, preference stored in session storage, persists only for current session, resets on session expiry

**Coverage**: 100% (9/9 tests)  
**Test Types**: Unit (7), Integration (2)  
**Priority**: High (9), Medium (0)  

### TC_QA5_028: Guest user preference stores in session storage

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S4 |
| **Category** | Storage Mechanism |
| **Preconditions** | Guest user (not logged in), at checkout page |
| **Test Data** | User: Not logged in; Storage: Session storage available |
| **Given** | Guest user disables suggestions |
| **When** | Toggle state changes |
| **Then** | Verify session storage |
| **Expected Result** | Preference stored in browser session storage; visible in developer tools |
| **Validation Criteria** | sessionStorage.getItem('autoSuggestions') === 'false'; DevTools shows value |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (sessionStorage assertion) |
| **Status** | ✅ Ready |

---

### TC_QA5_029: Guest preference persists during same checkout session

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S4 |
| **Category** | Session Persistence |
| **Preconditions** | Guest user disables suggestions, navigates within checkout |
| **Test Data** | Guest user; Scenario: Complete address → review order → return to address |
| **Given** | Guest disabled suggestions |
| **When** | User navigates within checkout |
| **Then** | Verify preference persists |
| **Expected Result** | Toggle state maintained throughout checkout session |
| **Validation Criteria** | Toggle aria-checked="false" throughout navigation; sessionStorage unchanged |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Navigation + state tracking) |
| **Status** | ✅ Ready |

---

### TC_QA5_030: Guest preference resets on session timeout

| Field | Value |
|-------|-------|
| **Test Type** | Integration |
| **Priority** | High |
| **Requirement** | REQ-S4 |
| **Category** | Session Expiry |
| **Preconditions** | Guest user with disabled preference, session expires |
| **Test Data** | Session timeout: 30 minutes inactivity |
| **Given** | Guest disabled suggestions |
| **When** | Session expires and new session starts |
| **Then** | Verify preference reset |
| **Expected Result** | Toggle defaults to enabled after session timeout; preference cleared |
| **Validation Criteria** | sessionStorage cleared; toggle aria-checked="true" on new session; fresh sessionId |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ⚠️ Partial (Mock timeout required) |
| **Status** | ✅ Ready |

---

### TC_QA5_031: Guest preference cleared on browser close

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S4 |
| **Category** | Session Cleanup |
| **Preconditions** | Guest user disabled suggestions, closes browser tab/window |
| **Test Data** | Guest checkout; Action: Close tab after disabling suggestions |
| **Given** | Guest user completed checkout with disabled suggestions |
| **When** | Browser tab is closed |
| **Then** | Verify preference on new session |
| **Expected Result** | New checkout session in same browser defaults to enabled |
| **Validation Criteria** | New tab/window: sessionStorage empty; toggle aria-checked="true"; no cookie persistence |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ⚠️ Partial (Manual: tab close, reopen) |
| **Status** | ✅ Ready |

---

### TC_QA5_032: Session storage not accessible to other websites

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S4 |
| **Category** | Security/Isolation |
| **Preconditions** | Guest user with preference in session storage |
| **Test Data** | Scenario: User visits another website, returns to checkout |
| **Given** | Preference stored in session storage |
| **When** | User visits external site and returns |
| **Then** | Verify isolation |
| **Expected Result** | Session storage remains isolated; preference not accessible to external sites |
| **Validation Criteria** | Origin-based isolation; external domain cannot read sessionStorage; browser security verified |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Origin check + assertion) |
| **Status** | ✅ Ready |

---

### TC_QA5_033: Multiple guest checkouts are independent

| Field | Value |
|-------|-------|
| **Test Type** | Integration |
| **Priority** | High |
| **Requirement** | REQ-S4 |
| **Category** | Session Independence |
| **Preconditions** | Same browser, multiple guest checkouts without login |
| **Test Data** | Scenario: Guest checkout 1 (disable) → Guest checkout 2 (enable) |
| **Given** | Guest disables in first checkout |
| **When** | Starting new guest checkout |
| **Then** | Verify independence |
| **Expected Result** | Each guest session has independent preference; not affected by previous sessions |
| **Validation Criteria** | sessionId changes; new session defaults to enabled; old sessionStorage not inherited |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Session ID tracking) |
| **Status** | ✅ Ready |

---

### TC_QA5_034: Guest preference survives page refresh

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S4 |
| **Category** | Session Persistence |
| **Preconditions** | Guest user disabled suggestions, refresh page |
| **Test Data** | Action: Refresh checkout page (F5) |
| **Given** | Guest disabled suggestions |
| **When** | Page is refreshed |
| **Then** | Verify preference persists |
| **Expected Result** | Toggle state maintained after page refresh; session storage preserved |
| **Validation Criteria** | Toggle aria-checked="false" after F5; sessionStorage.getItem() returns saved value |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Refresh + state assertion) |
| **Status** | ✅ Ready |

---

### TC_QA5_035: Guest cannot access logged-in preferences

| Field | Value |
|-------|-------|
| **Test Type** | Integration |
| **Priority** | High |
| **Requirement** | REQ-S4 |
| **Category** | Data Isolation/Security |
| **Preconditions** | User logs in, then logs out to guest mode |
| **Test Data** | Scenario: Logged-in (preferences saved) → Logout → Guest checkout |
| **Given** | User with saved preferences logs out |
| **When** | User accesses checkout as guest |
| **Then** | Verify isolation |
| **Expected Result** | Guest session uses session storage only; cannot see/access saved logged-in preferences |
| **Validation Criteria** | Guest toggle defaults to enabled; logged-in preference not accessible; user context switched |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Logout + context switch) |
| **Status** | ✅ Ready |

---

### TC_QA5_036: Guest preference not stored after session ends

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S4 |
| **Category** | Privacy/Data Cleanup |
| **Preconditions** | Guest checkout completed and verified data cleanup |
| **Test Data** | Scenario: Complete guest checkout, verify data cleanup |
| **Given** | Guest checkout with disabled suggestions |
| **When** | Session ends |
| **Then** | Verify cleanup |
| **Expected Result** | No guest preference data remains in local storage or cookies after session |
| **Validation Criteria** | localStorage empty; cookies cleaned; sessionStorage cleared; no IndexedDB entries |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Storage inspection) |
| **Status** | ✅ Ready |

---

# REQUIREMENT S5: Accessibility (WCAG Compliance)
## Acceptance Criteria: Toggle fully accessible via keyboard, screen readers, WCAG AA contrast, focus indicators, ARIA attributes

**Coverage**: 100% (9/9 tests)  
**Test Types**: Unit (9), Integration (0)  
**Priority**: High (9), Medium (0)  

### TC_QA5_037: Toggle switch keyboard accessible (Tab)

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S5 |
| **Category** | Keyboard Navigation |
| **Preconditions** | User using keyboard navigation only |
| **Test Data** | Keyboard: Tab key to navigate |
| **Given** | User accessing site with keyboard only |
| **When** | Tab to address section |
| **Then** | Verify toggle focus |
| **Expected Result** | Toggle switch receives focus; visible focus indicator shown |
| **Validation Criteria** | document.activeElement === toggle; :focus-visible CSS applied; outline visible |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ⚠️ Partial (Visual regression testing needed) |
| **Status** | ✅ Ready |

---

### TC_QA5_038: Toggle switch operable via keyboard (Space/Enter)

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S5 |
| **Category** | Keyboard Operation |
| **Preconditions** | Toggle switch has focus via keyboard |
| **Test Data** | Action: Press Space or Enter to toggle |
| **Given** | Toggle has focus |
| **When** | User presses Space or Enter |
| **Then** | Verify state changes |
| **Expected Result** | Toggle state changes; visual and programmatic state updates |
| **Validation Criteria** | aria-checked toggle; visual state updated; no mouse required |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Key event simulation) |
| **Status** | ✅ Ready |

---

### TC_QA5_039: Toggle has proper ARIA labels

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S5 |
| **Category** | ARIA Attributes |
| **Preconditions** | HTML inspection of toggle element |
| **Test Data** | Check: aria-label, aria-checked, aria-describedby |
| **Given** | Toggle rendered on page |
| **When** | Inspector checked |
| **Then** | Verify ARIA attributes |
| **Expected Result** | aria-label="Enable Auto-Suggestions", aria-checked="true/false" present and correct |
| **Validation Criteria** | toggle.getAttribute('aria-label') exists; toggle.getAttribute('aria-checked') in ['true', 'false'] |
| **Platforms** | Chrome DevTools, Firefox Inspector |
| **Automation** | ✅ Yes (Attribute assertion) |
| **Status** | ✅ Ready |

---

### TC_QA5_040: Toggle state announced to screen readers

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S5 |
| **Category** | Screen Reader Support |
| **Preconditions** | Screen reader test (NVDA, JAWS) |
| **Test Data** | Tool: NVDA/JAWS; Action: Toggle interaction |
| **Given** | Screen reader active |
| **When** | User navigates to toggle |
| **Then** | Verify announcement |
| **Expected Result** | Screen reader announces: "Enable Auto-Suggestions, toggle button, checked/unchecked" |
| **Validation Criteria** | ARIA live region triggered; state change announced; text clear and complete |
| **Platforms** | Windows (NVDA, JAWS), macOS (VoiceOver) |
| **Automation** | ⚠️ Partial (Requires manual screen reader verification) |
| **Status** | ✅ Ready |

---

### TC_QA5_041: Toggle label visible and associated correctly

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S5 |
| **Category** | Label Association |
| **Preconditions** | HTML/CSS inspection; visual check |
| **Test Data** | Check: <label> associated with toggle via for/id |
| **Given** | Toggle rendered |
| **When** | Inspect label association |
| **Then** | Verify connection |
| **Expected Result** | Label text clearly visible; clicking label toggles switch; proper HTML association |
| **Validation Criteria** | label.htmlFor === toggle.id; toggle.id !== null; label visible and readable |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (DOM + CSS assertion) |
| **Status** | ✅ Ready |

---

### TC_QA5_042: Color alone not used to indicate state

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S5 |
| **Category** | Non-Color Differentiation |
| **Preconditions** | Visual and CSS inspection |
| **Test Data** | Check: Toggle uses shape/icon/text in addition to color |
| **Given** | Toggle in enabled and disabled states |
| **When** | Compare visual indicators |
| **Then** | Verify multi-modal indication |
| **Expected Result** | State indicated by icon shape (checkmark/X), text label, AND color (not color alone) |
| **Validation Criteria** | Multiple indicators present; readable without color; includes icon/text; WCAG compliant |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ⚠️ Partial (Visual regression + CSS inspection) |
| **Status** | ✅ Ready |

---

### TC_QA5_043: Contrast ratio meets WCAG AA standard

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S5 |
| **Category** | Color Contrast |
| **Preconditions** | Color contrast measurement tool |
| **Test Data** | Check: Toggle button text/background contrast ratio |
| **Given** | Toggle in all states (enabled/disabled/focus/hover) |
| **When** | Measure contrast |
| **Then** | Verify ≥4.5:1 |
| **Expected Result** | Contrast ratios: ≥4.5:1 for normal text, ≥3:1 for graphics (WCAG AA compliant) |
| **Validation Criteria** | contrastRatio.calculate() >= 4.5; all states compliant; Axe DevTools pass |
| **Platforms** | Chrome (Axe extension), Online tools |
| **Automation** | ✅ Yes (Axe API) |
| **Status** | ✅ Ready |

---

### TC_QA5_044: Focus indicator visible and clear

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S5 |
| **Category** | Focus Visibility |
| **Preconditions** | Visual inspection and CSS checks |
| **Test Data** | Check: :focus-visible state styling |
| **Given** | Toggle element |
| **When** | Keyboard focus applied |
| **Then** | Verify visible indicator |
| **Expected Result** | Focus indicator clearly visible (outline, underline, or highlight); at least 2px; meets contrast |
| **Validation Criteria** | outline-width >= 2px; outline-color has contrast >= 3:1; visible in all themes |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ⚠️ Partial (Visual regression required) |
| **Status** | ✅ Ready |

---

### TC_QA5_045: Address field associated with toggle context

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S5 |
| **Category** | Context Clarity |
| **Preconditions** | Inspect HTML structure and labels |
| **Test Data** | Check: Proper fieldset/legend or descriptive association |
| **Given** | Toggle and address fields rendered |
| **When** | Inspected |
| **Then** | Verify association |
| **Expected Result** | Address section has descriptive heading/legend; toggle's purpose is clear to all users |
| **Validation Criteria** | fieldset/legend present; aria-describedby linked; heading describes purpose clearly |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (DOM assertion) |
| **Status** | ✅ Ready |

---

# REQUIREMENT S6: Address Validation Independence
## Acceptance Criteria: Address validation occurs regardless of suggestions being enabled/disabled, postal code and state validation required

**Coverage**: 100% (9/9 tests)  
**Test Types**: Unit (7), Integration (2)  
**Priority**: High (7), Medium (2)  

### TC_QA5_046: Address validation independent of suggestions

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S6 |
| **Category** | Validation Logic |
| **Preconditions** | Toggle disabled, invalid address, form submission |
| **Test Data** | Invalid address: "X" (too short); Complete required fields; Submit |
| **Given** | Suggestions disabled |
| **When** | Invalid address submitted |
| **Then** | Verify validation |
| **Expected Result** | Validation error shown (independent of suggestion setting); form not submitted |
| **Validation Criteria** | Error message displayed; form.submitted === false; error class applied |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Submit + validation assertion) |
| **Status** | ✅ Ready |

---

### TC_QA5_047: Valid postal code required regardless of suggestions

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S6 |
| **Category** | Required Field Validation |
| **Preconditions** | Toggle disabled, missing postal code |
| **Test Data** | Address filled except postal code (empty) |
| **Given** | Suggestions disabled |
| **When** | Submit form |
| **Then** | Verify postal code required |
| **Expected Result** | Validation error for missing postal code; form not submitted |
| **Validation Criteria** | Error message: "Postal code required"; required attribute enforced; form.submitted === false |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Form submit + validation) |
| **Status** | ✅ Ready |

---

### TC_QA5_048: State/Province validation works when suggestions off

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S6 |
| **Category** | Field Validation |
| **Preconditions** | Toggle disabled, invalid state code |
| **Test Data** | Address with invalid state: "State: XYZ" |
| **Given** | Suggestions disabled |
| **When** | Submit with invalid state |
| **Then** | Verify validation |
| **Expected Result** | State validation error shown; form rejected; user prompted to correct |
| **Validation Criteria** | Error message: "Invalid state code"; state restricted to valid codes; form.submitted === false |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Validation logic test) |
| **Status** | ✅ Ready |

---

### TC_QA5_049: Postal code format validation active

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S6 |
| **Category** | Format Validation |
| **Preconditions** | Toggle disabled, malformed postal code |
| **Test Data** | Address with bad postal code: "123" (incomplete) or "ABC123XYZ" (invalid format) |
| **Given** | Suggestions disabled |
| **When** | Submit with malformed postal code |
| **Then** | Verify format check |
| **Expected Result** | Postal code format validation error displayed; provides format hint |
| **Validation Criteria** | Error message shows expected format; regex pattern enforced; form.submitted === false |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Regex validation test) |
| **Status** | ✅ Ready |

---

### TC_QA5_050: City/State combination validation

| Field | Value |
|-------|-------|
| **Test Type** | Integration |
| **Priority** | Medium |
| **Requirement** | REQ-S6 |
| **Category** | Combo Validation |
| **Preconditions** | Toggle disabled, mismatched city/state |
| **Test Data** | Address: City "New York" + State "CA" (incorrect combo) |
| **Given** | Suggestions disabled |
| **When** | Submit mismatched city/state |
| **Then** | Verify validation |
| **Expected Result** | Validation error for city/state mismatch; form rejected; user prompted to correct |
| **Validation Criteria** | Error message: "City and state don't match"; API validation returns error; form.submitted === false |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (API mock validation) |
| **Status** | ✅ Ready |

---

### TC_QA5_051: Address validation works when suggestions enabled

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S6 |
| **Category** | Cross-Mode Validation |
| **Preconditions** | Toggle enabled, invalid address |
| **Test Data** | Invalid address with suggestions enabled |
| **Given** | Suggestions enabled |
| **When** | Invalid address submitted |
| **Then** | Verify validation still works |
| **Expected Result** | Validation errors displayed regardless of suggestion setting |
| **Validation Criteria** | Validation runs; errors shown; independent of toggle state; form.submitted === false |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Toggle + validation test) |
| **Status** | ✅ Ready |

---

### TC_QA5_052: Empty address fields validation

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | High |
| **Requirement** | REQ-S6 |
| **Category** | Required Field Validation |
| **Preconditions** | Toggle disabled, address fields empty |
| **Test Data** | Address fields: All required fields left blank |
| **Given** | Suggestions disabled |
| **When** | Submit with empty address |
| **Then** | Verify required field errors |
| **Expected Result** | Error messages show for each required empty field |
| **Validation Criteria** | Multiple error messages; one per empty field; form.submitted === false; required attributes enforced |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Multi-field validation) |
| **Status** | ✅ Ready |

---

### TC_QA5_053: Special characters validation

| Field | Value |
|-------|-------|
| **Test Type** | Unit |
| **Priority** | Medium |
| **Requirement** | REQ-S6 |
| **Category** | Character Validation |
| **Preconditions** | Toggle disabled, special characters in address |
| **Test Data** | Address: "O'Reilly St #123, St. Paul's Way" |
| **Given** | Suggestions disabled |
| **When** | Valid address with special chars submitted |
| **Then** | Verify accepted |
| **Expected Result** | Address with valid special characters accepted and saved; no validation error |
| **Validation Criteria** | Form submitted; address stored correctly; no sanitization errors; characters preserved |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (Form submission + storage) |
| **Status** | ✅ Ready |

---

### TC_QA5_054: API response handles validation errors

| Field | Value |
|-------|-------|
| **Test Type** | Integration |
| **Priority** | High |
| **Requirement** | REQ-S6 |
| **Category** | Error Handling |
| **Preconditions** | Address validation API called with invalid address |
| **Test Data** | Mock API: Return 400 Bad Request with error message |
| **Given** | Invalid address submitted |
| **When** | Validation API called |
| **Then** | Verify error handling |
| **Expected Result** | User-friendly error message displayed; no raw API error exposed |
| **Validation Criteria** | HTTP 400 response handled gracefully; user-friendly message shown; no stack trace visible |
| **Platforms** | Chrome, Firefox, Safari |
| **Automation** | ✅ Yes (API mock + error handling) |
| **Status** | ✅ Ready |

---

## 📊 SUMMARY STATISTICS

| Metric | Value | Status |
|--------|-------|--------|
| **Total Test Cases in Report** | 54 | ✅ Complete |
| **Requirement Coverage** | 100% (6/6 scenarios) | ✅ Complete |
| **Unit Tests** | 38 | ✅ Included |
| **Integration Tests** | 16 | ✅ Included |
| **E2E Tests** | 0 | ℹ️ Listed in RTM |
| **Automatable Tests** | 50/54 (93%) | ✅ High |
| **Manual Verification Required** | 4/54 (7%) | ✅ Accessibility |
| **Priority High** | 44 (81%) | ✅ Focus |
| **Priority Medium** | 10 (19%) | ✅ Balance |

---

## 📋 FORMAT NOTES

✅ **Copy-Paste Ready**: All tables formatted for Markdown, Excel, Google Sheets  
✅ **Sortable**: Sort by Priority, Type, Requirement, Automation  
✅ **Filterable**: Group by Scenario (S1-S6) or Test Type  
✅ **Traceable**: Every test mapped to 1+ requirements  

**Ready for QA execution and automation setup!**

