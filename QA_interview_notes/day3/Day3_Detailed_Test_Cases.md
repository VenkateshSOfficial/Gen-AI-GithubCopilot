# Day 3 – Test Cases: Registration, Login & Password Reset

## 📋 DELIVERABLE 2: Detailed Test Cases

### Test Cases Mapped to Scenarios

---

## 🎯 TEST CASE SUITE 1: User Registration (10 Cases)

### TC-REG-001: Valid User Registration - Happy Path

```
Test Case ID:         TC-REG-001
Title:                Valid User Registration with Complete Data
Priority:             Critical
Requirement ID:       REQ-REG-001: System shall allow new users to register
Module:               Registration
Precondition:         User is on registration page at /register
                     Page has loaded successfully

Test Data:
  • Email: testuser001@example.com
  • Full Name: Test User One
  • Password: SecurePass123
  • Confirm Password: SecurePass123

Steps:
  1. User opens registration form
  2. User enters Full Name: "Test User One"
  3. User enters Email: "testuser001@example.com"
  4. User enters Password: "SecurePass123"
  5. User enters Confirm Password: "SecurePass123"
  6. User checks Terms & Conditions checkbox
  7. User clicks "Register" button
  8. System processes registration
  9. User redirected to verification email page
  10. User receives email at testuser001@example.com

Expected Result:
  • Success message: "Registration successful! Check your email to verify account."
  • User is redirected to /verify-email page
  • Verification email received within 2 minutes
  • Email contains verification link with unique token
  • User account created in database with status="email_pending"
  • Email NOT yet verified (status not "active")

Post-condition:
  • User account exists but not yet active
  • User has received verification email
  • User is on verification page
  • Email unread in inbox

Test Type:          Functional + Integration
Automated:          Yes
Executed By:        QA Tester / Automation Framework
Last Executed:      [Date]
Status:             ✅ PASS / ❌ FAIL
```

---

### TC-REG-002: Weak Password Rejection

```
Test Case ID:         TC-REG-002
Title:                System Rejects Password Without Required Criteria
Priority:             High
Requirement ID:       REQ-REG-003: Password must be minimum 8 chars, 1 uppercase, 1 number
Module:               Registration, Validation
Precondition:         User is on registration page
                     Form is ready for input

Test Data:
  • Email: testuser002@example.com
  • Full Name: Test User Two
  • Password: Pass123 (only 7 characters, fails minimum length)
  • Confirm Password: Pass123

Steps:
  1. User enters Full Name: "Test User Two"
  2. User enters Email: "testuser002@example.com"
  3. User enters Password: "Pass123"
  4. User enters Confirm Password: "Pass123"
  5. User checks Terms checkbox
  6. User clicks "Register" button
  7. System validates password

Expected Result:
  • Password field highlighted in RED
  • Error message appears below password field: 
    "Password must be at least 8 characters and contain one uppercase letter and one number"
  • NO account created in database
  • User remains on registration page
  • Form data retained for correction
  • Focus moves to password field

Post-condition:
  • User on same registration page
  • Form data still filled (except passwords if cleared)
  • Password field focused for correction
  • User can correct and retry

Test Type:          Functional
Automated:          Yes
Acceptance:         Error message exact and helpful
```

---

### TC-REG-003: Password Mismatch

```
Test Case ID:         TC-REG-003
Title:                System Rejects Mismatched Passwords
Priority:             High
Module:               Registration, Validation
Precondition:         User is on registration page
Test Data:
  • Password: SecurePass123
  • Confirm Password: SecurePass124 (typo)

Steps:
  1. User fills registration form
  2. User enters Password: "SecurePass123"
  3. User enters Confirm Password: "SecurePass124"
  4. User clicks Register

Expected Result:
  • Error message: "Passwords do not match"
  • Both password fields cleared
  • Email field retained
  • User cannot proceed
  • NO account created

Post-condition:
  • User can re-enter passwords and try again
```

---

### TC-REG-004: Duplicate Email Rejection

```
Test Case ID:         TC-REG-004
Title:                System Rejects Duplicate Email Address
Priority:             High
Requirement ID:       REQ-REG-002: Email must be unique
Module:               Registration, Database
Precondition:         User "existing@example.com" already registered and active
                     User on registration page

Test Data:
  • Email: existing@example.com (already in system)
  • Password: SecurePass123

Steps:
  1. User enters email: "existing@example.com"
  2. User enters valid password
  3. User clicks Register

Expected Result:
  • Error message: "This email is already registered"
  • Message includes helpful options:
    "Try logging in or use password reset if you forgot your password"
  • Links to login page and forgot password page
  • NO new account created
  • User remains on registration page

Post-condition:
  • User can click to login page or password reset
```

---

### TC-REG-005: Invalid Email Format

```
Test Case ID:         TC-REG-005
Title:                System Rejects Invalid Email Format
Priority:             High
Module:               Registration, Validation
Test Data:
  • Email: "invalidemail" (missing @domain)
  • Password: SecurePass123

Steps:
  1. User enters email: "invalidemail"
  2. User enters valid password
  3. User clicks Register

Expected Result:
  • Email field highlighted RED
  • Error message: "Please enter a valid email address"
  • NO account created
  • Form retained
  • Email field focused
```

---

### TC-REG-006: Email Verification Link Expires

```
Test Case ID:         TC-REG-006
Title:                Expired Verification Token Rejected
Priority:             High
Requirement ID:       REQ-REG-005: Tokens expire after 24 hours
Module:               Email Verification, Token Management
Precondition:         User registered 25 hours ago
                     Verification link is in email
                     Link has not been used

Test Data:
  • Email: testuser006@example.com
  • Token: Created 25 hours ago, should be expired

Steps:
  1. User opens email from 25 hours ago
  2. User clicks verification link
  3. Browser navigates to /verify?token=expiredtoken
  4. System checks token timestamp

Expected Result:
  • System displays: "Verification link has expired"
  • Link: "Resend verification email"
  • User NOT verified
  • Account still pending
  • User can request new link

Post-condition:
  • User can request new verification email
```

---

### TC-REG-007: Required Field Missing

```
Test Case ID:         TC-REG-007
Title:                System Rejects Registration Without Required Fields
Priority:             High
Module:               Registration, Validation
Precondition:         User on registration page

Steps:
  1. User leaves Full Name field empty
  2. User enters valid email
  3. User enters valid password
  4. User clicks Register

Expected Result:
  • Error message below Full Name field: "Full Name is required"
  • NO account created
  • Form retained for correction
```

---

### TC-REG-008: Terms & Conditions Not Accepted

```
Test Case ID:         TC-REG-008
Title:                System Rejects Registration Without T&C Acceptance
Priority:             High
Module:               Registration, Compliance
Precondition:         User on registration page with T&C checkbox unchecked

Steps:
  1. User fills all registration fields
  2. User does NOT check T&C checkbox
  3. User clicks Register

Expected Result:
  • Error message: "You must accept Terms & Conditions to register"
  • Checkbox highlighted
  • NO account created
  • Form retained
```

---

### TC-REG-009: SQL Injection Prevention

```
Test Case ID:         TC-REG-009
Title:                System Prevents SQL Injection in Email Field
Priority:             Critical
Module:               Registration, Security
Test Data:
  • Email: "test@example.com' OR '1'='1"
  • Password: SecurePass123

Steps:
  1. User enters SQL injection attempt in email field
  2. User enters valid password
  3. User clicks Register

Expected Result:
  • Email treated as literal text (not executed)
  • Email validation fails (invalid format)
  • Error message: "Please enter a valid email"
  • NO SQL executed
  • NO unauthorized data access
```

---

### TC-REG-010: Concurrent Registration Same Email

```
Test Case ID:         TC-REG-010
Title:                Two Users Cannot Register Same Email Simultaneously
Priority:             High
Requirement ID:       REQ-REG-002: Email must be unique
Module:               Registration, Concurrency
Precondition:         Two browsers/sessions ready
Test Data:
  • Email: concurrent@example.com (same in both sessions)

Steps:
  1. User A enters email: "concurrent@example.com"
  2. User B enters email: "concurrent@example.com" (same)
  3. User A clicks Register
  4. User B clicks Register (within 1 second)
  5. Both registrations attempt to complete

Expected Result:
  • User A: ✅ Registered successfully
  • User B: ❌ Error message: "This email is already registered"
  • Database: Only ONE account for concurrent@example.com
  • NO duplicate accounts created
```

---

## 🎯 TEST CASE SUITE 2: User Login (8 Cases)

### TC-LOGIN-001: Valid Login - Happy Path

```
Test Case ID:         TC-LOGIN-001
Title:                Successful Login with Valid Credentials
Priority:             Critical
Requirement ID:       REQ-LOGIN-001: User can log in with email and password
Module:               Login, Authentication
Precondition:         User "john@example.com" registered and verified (active)
                     User on login page at /login

Test Data:
  • Email: john@example.com
  • Password: SecurePass123

Steps:
  1. User navigates to login page
  2. User enters Email: "john@example.com"
  3. User enters Password: "SecurePass123"
  4. User clicks "Login" button
  5. System validates credentials
  6. System checks account status

Expected Result:
  • Success message: "Login successful"
  • User redirected to Dashboard page
  • Session token created (visible in cookies/localStorage)
  • User header shows: "Welcome, John"
  • "Logout" button visible in navigation
  • User can access protected pages

Post-condition:
  • User authenticated and logged in
  • Session active for 24 hours
  • User can access all features
  • Login timestamp recorded in audit log
```

---

### TC-LOGIN-002: Invalid Password

```
Test Case ID:         TC-LOGIN-002
Title:                Login Rejected with Incorrect Password
Priority:             High
Module:               Login, Authentication
Precondition:         User account exists with correct email
Test Data:
  • Email: john@example.com (correct)
  • Password: WrongPassword123 (incorrect)

Steps:
  1. User enters email and incorrect password
  2. User clicks Login

Expected Result:
  • Error message: "Invalid credentials"
  • User NOT logged in
  • User remains on login page
  • No session created
  • NO redirect to dashboard
```

---

### TC-LOGIN-003: Brute Force Protection

```
Test Case ID:         TC-LOGIN-003
Title:                Account Locked After Multiple Failed Attempts
Priority:             Critical
Module:               Login, Security
Precondition:         User account exists

Steps:
  1. Attempt 1: Wrong password → Fails
  2. Attempt 2: Wrong password → Fails
  3. Attempt 3: Wrong password → Fails
  4. Attempt 4: Wrong password → Fails
  5. Attempt 5: Wrong password → Fails
  6. Attempt 6: Wrong password → Attempt made

Expected Result:
  • After 5th failed attempt: Account locked
  • Message: "Too many failed attempts. Account locked for 15 minutes"
  • Email sent: "Suspicious activity on your account"
  • User cannot log in for 15 minutes
  • After 15 minutes: Account unlocked

Post-condition:
  • User can reset password to regain access sooner
  • IP address logged for investigation
```

---

### TC-LOGIN-004: Inactive Account Blocked

```
Test Case ID:         TC-LOGIN-004
Title:                Login Rejected for Inactive Account
Priority:             High
Module:               Login, Account Management
Precondition:         User account status = "suspended"
Test Data:
  • Email: suspended@example.com
  • Password: SecurePass123 (correct)

Steps:
  1. User enters email and correct password
  2. User clicks Login

Expected Result:
  • Error message: "Your account has been suspended. Contact support."
  • User NOT logged in
  • User provided support contact information
```

---

### TC-LOGIN-005: Session Token Expiry

```
Test Case ID:         TC-LOGIN-005
Title:                User Logged Out After Session Expires
Priority:             High
Module:               Login, Session Management
Precondition:         User logged in
                     Session created 24 hours ago

Steps:
  1. User logged in yesterday
  2. Session token expires (24 hours later)
  3. User attempts to access protected page

Expected Result:
  • Session invalid
  • User automatically redirected to login page
  • Message: "Your session has expired. Please log in again."
  • Protected page NOT accessible
```

---

### TC-LOGIN-006: Case Sensitivity - Email Lowercase

```
Test Case ID:         TC-LOGIN-006
Title:                Email Login is Case-Insensitive
Priority:             Medium
Module:               Login, Data Handling
Precondition:         User registered with email: "John@Example.com"

Test Data:
  • Registered Email: "John@Example.com"
  • Login Email: "john@example.com" (lowercase)
  • Password: SecurePass123

Steps:
  1. User enters email as lowercase: "john@example.com"
  2. User enters correct password
  3. User clicks Login

Expected Result:
  • Login successful ✅
  • System treats email as case-insensitive
  • User authenticated and redirected to dashboard
```

---

### TC-LOGIN-007: SQL Injection on Login

```
Test Case ID:         TC-LOGIN-007
Title:                Login Form Protected Against SQL Injection
Priority:             Critical
Module:               Login, Security
Test Data:
  • Email: " ' OR '1'='1"
  • Password: anything

Steps:
  1. User enters SQL injection in email field
  2. User clicks Login

Expected Result:
  • Input treated as literal text (not executed)
  • Either invalid format error or "Invalid credentials"
  • NO database breach
  • NO unauthorized access
  • NO SQL executed
```

---

### TC-LOGIN-008: Remember Me Functionality

```
Test Case ID:         TC-LOGIN-008
Title:                Remember Me Persists Login Across Sessions
Priority:             Medium
Module:               Login, Session Management, Persistence
Precondition:         User on login page

Steps:
  1. User enters email: john@example.com
  2. User enters password: SecurePass123
  3. User checks "Remember Me" checkbox
  4. User clicks Login
  5. User redirected to dashboard
  6. User closes browser/tab
  7. User opens new browser tab
  8. User navigates to https://app.example.com

Expected Result:
  • User automatically logged in (no login page shown)
  • Dashboard displayed immediately
  • "Remember Me" cookie valid for 30 days
  • User can logout to clear remember-me
  • If "Remember Me" not checked, browser close = logout
```

---

## 🎯 TEST CASE SUITE 3: Password Reset (9 Cases)

### TC-PASS-001: Valid Password Reset - Happy Path

```
Test Case ID:         TC-PASS-001
Title:                Successful Password Reset with Valid Email
Priority:             High
Requirement ID:       REQ-PASS-001: User can reset forgotten password
Module:               Password Reset, Email
Precondition:         User "john@example.com" exists and is active
                     User on login page

Test Data:
  • Email: john@example.com
  • New Password: NewSecure789
  • Confirm New Password: NewSecure789

Steps:
  1. User on login page
  2. User clicks "Forgot Password?" link
  3. User redirected to /forgot-password page
  4. User enters Email: "john@example.com"
  5. User clicks "Send Reset Link"
  6. System processes request
  7. User receives email
  8. User opens email and clicks reset link
  9. User redirected to /reset-password?token=abc123
  10. System validates token
  11. User enters new password: "NewSecure789"
  12. User enters confirm password: "NewSecure789"
  13. User clicks "Reset Password"
  14. System updates password
  15. User redirected to login page

Expected Result:
  • Reset link sent to email within 1 minute
  • Link valid for 1 hour
  • Link opens password reset form
  • Password updated successfully
  • Confirmation email sent: "Password changed successfully"
  • User can log in with new password
  • User cannot log in with old password
  • Old sessions invalidated (must re-login)

Post-condition:
  • Old password no longer works
  • User must log in again with new password
  • All previous sessions ended
```

---

### TC-PASS-002: Expired Reset Link

```
Test Case ID:         TC-PASS-002
Title:                Expired Password Reset Link Rejected
Priority:             High
Module:               Password Reset, Security
Precondition:         Reset email sent 65 minutes ago (expires in 60 min)

Steps:
  1. User opens email from 65 minutes ago
  2. User clicks password reset link
  3. System validates token age

Expected Result:
  • Error message: "Password reset link has expired"
  • Reset form NOT displayed
  • Option: "Request a new password reset link"
  • User must restart password reset process
```

---

### TC-PASS-003: Already Used Reset Link

```
Test Case ID:         TC-PASS-003
Title:                Reset Link Can Only Be Used Once
Priority:             High
Module:               Password Reset, Security
Precondition:         User reset password 5 minutes ago

Steps:
  1. User opens same reset email again
  2. User clicks reset link (already used once)
  3. System checks token usage

Expected Result:
  • Error message: "This password reset link has already been used"
  • Form NOT displayed
  • User must request new reset link
```

---

### TC-PASS-004: New Password Same as Old

```
Test Case ID:         TC-PASS-004
Title:                System Rejects New Password Same as Previous
Priority:             Medium
Module:               Password Reset, Validation
Precondition:         User password is currently: "SecurePass123"

Test Data:
  • New Password: "SecurePass123" (same as current)

Steps:
  1. User resets password
  2. User enters new password: "SecurePass123"
  3. User clicks Reset

Expected Result:
  • Error message: "Your new password cannot be the same as your previous password"
  • Password NOT updated
  • User must enter different password
```

---

### TC-PASS-005: Password Reset Email Verification

```
Test Case ID:         TC-PASS-005
Title:                Password Reset Email Delivered with Correct Content
Priority:             Medium
Module:               Password Reset, Email
Precondition:         User submitted password reset request

Steps:
  1. User requests password reset
  2. Email delivered to user's email address
  3. User opens email
  4. User examines email content

Expected Result:
  Email contains:
  • Subject: "Reset Your Password - App Name"
  • From: noreply@app.example.com
  • Reset button/link with unique token
  • Note: "Link expires in 1 hour"
  • Support contact information
  • NO password in email (security)
  • Professional formatting
```

---

### TC-PASS-006: Reset Link with Invalid Token

```
Test Case ID:         TC-PASS-006
Title:                Invalid Token Rejected
Priority:             High
Module:               Password Reset, Security
Test Data:
  • URL: /reset-password?token=invalid123xyz

Steps:
  1. User manually enters invalid token in URL
  2. System validates token

Expected Result:
  • Error message: "Invalid password reset link"
  • Reset form NOT displayed
  • User redirected to password reset request page
```

---

### TC-PASS-007: Password History Check

```
Test Case ID:         TC-PASS-007
Title:                System Prevents Reuse of Recent Passwords
Priority:             Medium
Module:               Password Reset, Security Policy
Precondition:         User password history (last 3 passwords):
                     Current: Pass123, Previous: Pass456, Previous: Pass789

Test Data:
  • New Password: Pass456 (was used 2 password changes ago)

Steps:
  1. User resets password
  2. User enters: "Pass456"
  3. User clicks Reset

Expected Result:
  • Error message: "You cannot reuse a password from your last 3 changes"
  • Password NOT updated
  • User must enter new unique password
```

---

### TC-PASS-008: Security Notification on Password Change

```
Test Case ID:         TC-PASS-008
Title:                User Receives Email Notification of Password Change
Priority:             High
Module:               Password Reset, Security
Precondition:         User successfully changed password

Steps:
  1. User successfully resets password
  2. System sends notification email
  3. User checks email

Expected Result:
  • Email received: "Your password has been changed"
  • Subject: "Password Change Notification"
  • Content warns: "If you didn't make this change, contact support immediately"
  • Support link provided
  • Timestamp of change included
```

---

### TC-PASS-009: Concurrent Password Reset Attempts

```
Test Case ID:         TC-PASS-009
Title:                Only Most Recent Password Reset Link Works
Priority:             High
Module:               Password Reset, Concurrency
Precondition:         User requests password reset twice

Steps:
  1. User requests password reset at 10:00 AM
  2. User receives reset link (Link A)
  3. User requests password reset again at 10:01 AM
  4. User receives new reset link (Link B)
  5. User attempts to use Link A (old link)

Expected Result:
  • Link A now invalid
  • Only Link B (newest) is valid
  • Error on Link A: "This password reset link has expired"
  • User must use Link B
  • Security: Only latest reset is valid
```

---

## 📊 Summary of Test Cases

| Category | Count | Test Case IDs |
|----------|-------|---------------|
| **Registration** | 10 | TC-REG-001 to TC-REG-010 |
| **Login** | 8 | TC-LOGIN-001 to TC-LOGIN-008 |
| **Password Reset** | 9 | TC-PASS-001 to TC-PASS-009 |
| **TOTAL** | **27** | **All Scenarios Covered** |

**Coverage:** 100% of scenarios, edge cases, and security requirements
**Execution Time:** ~2-3 hours manual testing, ~30 minutes automated testing

All test cases are ready for execution! 🎯
