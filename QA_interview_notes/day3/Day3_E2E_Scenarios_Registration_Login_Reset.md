# Day 3 – E2E Scenarios: User Registration, Login & Password Reset

## 🎬 DELIVERABLE 1: Complete E2E Scenarios

### Feature: User Registration, Login & Password Reset
**Context:** Medium-complexity authentication feature
**User Types:** New users, existing users, admin
**Modules Involved:** Registration, Email Verification, Login, Password Reset

---

## 📋 SCENARIO 1: New User Registration & First Login

### Scenario Overview
```
Scenario Name:        New User Registration & First Login
Feature:              User Authentication
Priority:             Critical
User Role:            New User (Guest)
Business Goal:        Register account and log in successfully
Module:               Registration, Email Verification, Login
```

### Main Flow (Happy Path)

```
STEP 1: User visits registration page
├─ User navigates to https://app.example.com/register
├─ System displays: Registration form with fields:
│  ├─ Full Name (required)
│  ├─ Email (required)
│  ├─ Password (required, min 8 chars, 1 uppercase, 1 number)
│  ├─ Confirm Password (required)
│  ├─ Terms & Conditions checkbox
│  └─ Register button
└─ User sees: Clean, accessible form

STEP 2: User fills in registration form
├─ User enters: Full Name = "John Smith"
├─ User enters: Email = "john.smith@example.com"
├─ User enters: Password = "SecurePass123"
├─ User enters: Confirm Password = "SecurePass123"
├─ User checks: Terms & Conditions checkbox
└─ User clicks: "Register" button

STEP 3: System validates data
├─ Email validation: john.smith@example.com ✓ (valid format)
├─ Email uniqueness: NOT in system ✓ (unique)
├─ Password validation: SecurePass123 ✓ (8 chars, 1 uppercase, 1 number)
├─ Passwords match: SecurePass123 = SecurePass123 ✓
├─ Terms accepted: Yes ✓
└─ System response: SUCCESS ✅

STEP 4: Account created and verification email sent
├─ System creates: User account in database (status: email_pending)
├─ System generates: Unique email verification token (24hr expiry)
├─ System sends: Email to john.smith@example.com with:
│  ├─ Subject: "Verify your email - App Name"
│  ├─ Body: Verification link with unique token
│  └─ Sender: noreply@app.example.com
├─ System redirects: User to "Check Your Email" page with message:
│  └─ "Verification email sent to john.smith@example.com. Click the link to verify."
└─ User sees: "Check Email" page with option to resend

STEP 5: User clicks email verification link
├─ User opens: Email inbox
├─ User finds: Email from noreply@app.example.com
├─ User clicks: "Verify Email" button/link in email
├─ Email link redirects: User to https://app.example.com/verify?token=abc123xyz
├─ System validates: Token is valid and not expired ✓
└─ User sees: "Email verified successfully" message

STEP 6: System updates account status
├─ System updates: User account status to "active"
├─ System displays: "Email verified! Redirecting to login..."
├─ System redirects: User to login page (3 second delay)
└─ Auto-redirect triggers: User automatically redirected to login

STEP 7: User logs in
├─ User on: Login page
├─ User enters: Email = "john.smith@example.com"
├─ User enters: Password = "SecurePass123"
├─ User clicks: "Login" button
├─ System validates: Credentials correct ✓
└─ System response: SUCCESS ✅

STEP 8: User authenticated and redirected
├─ System creates: Session/JWT token
├─ System stores: Session in database or cache
├─ System displays: "Login successful"
├─ System redirects: User to Dashboard/Home page
├─ User sees: Personalized dashboard with "Welcome, John Smith!"
└─ User account: Fully accessible

SUCCESS CRITERIA:
├─ User account created in database
├─ Email verified and status = "active"
├─ User logged in and authenticated
├─ Session token generated
├─ User redirected to dashboard
└─ User can access protected resources
```

---

## 📋 SCENARIO 2: Existing User Login

### Scenario Overview
```
Scenario Name:        Existing User Login
Feature:              User Authentication
Priority:             Critical
User Role:            Registered User
Business Goal:        Log in with existing credentials
Module:               Login, Session Management
Prerequisite:         User account exists and is active
```

### Main Flow

```
STEP 1: User navigates to login page
├─ URL: https://app.example.com/login
├─ Page displays: Login form with:
│  ├─ Email field
│  ├─ Password field
│  ├─ "Remember me" checkbox
│  ├─ "Login" button
│  └─ "Forgot Password?" link
└─ User sees: Clean login page

STEP 2: User enters credentials
├─ User enters: Email = "john.smith@example.com"
├─ User enters: Password = "SecurePass123"
├─ User checks: "Remember me" checkbox (optional)
├─ User clicks: "Login" button
└─ System validates: Input is not empty ✓

STEP 3: System authenticates credentials
├─ System queries: Database for user with email
├─ System finds: User account with email "john.smith@example.com" ✓
├─ System checks: Account status = "active" ✓ (not blocked, not deleted)
├─ System compares: Password "SecurePass123" vs. stored hash ✓
├─ System validates: Credentials match ✓
└─ System response: AUTHENTICATION SUCCESSFUL ✅

STEP 4: Session created
├─ System generates: Session ID or JWT token
├─ System sets: Token expiry (e.g., 24 hours from now)
├─ System stores: Session in database/cache
├─ System sets: Session cookie or local storage token
├─ Token includes: User ID, email, role, created timestamp
└─ System logs: Login event (timestamp, IP, device)

STEP 5: User redirected to dashboard
├─ System displays: "Login successful" (optional notification)
├─ System redirects: User to Dashboard/Home page
├─ User sees: Dashboard page with personalized content
├─ User sees: "Welcome back, John Smith!"
├─ User can: Access all protected resources
└─ User can: See "Logout" button in navigation

SUCCESS CRITERIA:
├─ User authenticated successfully
├─ Session created and valid
├─ User redirected to dashboard
├─ User can access protected pages
└─ Logout button visible in UI
```

### Alternative Flow: "Remember Me" Functionality

```
VARIATION A: User with active "Remember Me" cookie
├─ User previously logged in with "Remember me" checked
├─ System stored: Remember-me token in persistent cookie
├─ User navigates: To app.example.com
├─ System checks: Remember-me cookie exists and is valid ✓
├─ System validates: Token is not expired ✓
├─ System auto-authenticates: User without login form
├─ User sees: Dashboard directly (no login needed)
└─ User experience: Seamless return

OUTCOME: User logged in automatically
```

---

## 📋 SCENARIO 3: Password Reset Flow

### Scenario Overview
```
Scenario Name:        User Forgot Password & Reset
Feature:              Password Management
Priority:             High
User Role:            Registered User (forgot password)
Business Goal:        Reset password securely
Module:               Login, Password Reset, Email Verification
Prerequisite:         User account exists
```

### Main Flow

```
STEP 1: User accesses password reset
├─ User on: Login page
├─ User clicks: "Forgot Password?" link
├─ System redirects: User to https://app.example.com/forgot-password
├─ System displays: "Forgot Password" page with:
│  ├─ Email input field
│  ├─ "Send Reset Link" button
│  └─ "Back to Login" link
└─ User sees: Password recovery form

STEP 2: User submits email
├─ User enters: Email = "john.smith@example.com"
├─ User clicks: "Send Reset Link" button
├─ System validates: Email field is not empty ✓
└─ System validates: Email format is valid ✓

STEP 3: System processes password reset request
├─ System queries: Database for user with email
├─ System finds: User account ✓ or NOT found ✓ (same message for security)
├─ System generates: Password reset token (unique, 1-hour expiry)
├─ System stores: Reset token with user ID and expiry timestamp
├─ System sends: Email to john.smith@example.com with:
│  ├─ Subject: "Reset Your Password - App Name"
│  ├─ Body: Reset link with unique token
│  ├─ Link: https://app.example.com/reset-password?token=xyz789abc
│  └─ Note: "This link expires in 1 hour"
└─ System logs: Password reset request

STEP 4: System displays confirmation message
├─ System displays: Success message on reset page:
│  └─ "Check your email for password reset instructions"
├─ Message notes: "Link expires in 1 hour"
└─ User sees: Reassurance email was sent

STEP 5: User clicks password reset link
├─ User opens: Email from noreply@app.example.com
├─ User clicks: "Reset Password" link in email
├─ Browser navigates: To https://app.example.com/reset-password?token=xyz789abc
├─ System validates: Token exists in database ✓
├─ System validates: Token is not expired ✓ (within 1 hour)
├─ System validates: Token not already used ✓
└─ System response: TOKEN VALID ✅

STEP 6: User enters new password
├─ System displays: "Create New Password" page with:
│  ├─ New Password field
│  ├─ Confirm Password field
│  ├─ Password strength indicator
│  └─ "Reset Password" button
├─ User enters: New Password = "NewSecure456"
├─ User enters: Confirm Password = "NewSecure456"
├─ User clicks: "Reset Password" button
└─ System validates: Passwords match ✓

STEP 7: System validates new password
├─ System checks: Minimum length (8 chars) ✓
├─ System checks: Contains uppercase ✓
├─ System checks: Contains number ✓
├─ System checks: Not same as old password ✓
├─ System checks: Not in password history (last 3 passwords) ✓
└─ System response: PASSWORD VALID ✅

STEP 8: Password updated
├─ System hashes: New password using bcrypt
├─ System updates: User's password field in database
├─ System marks: Reset token as "used"
├─ System invalidates: All existing sessions (force re-login)
├─ System sends: Confirmation email:
│  ├─ Subject: "Your password has been reset"
│  └─ Body: "If you didn't make this change, contact support"
├─ System displays: "Password reset successful!"
├─ System redirects: User to login page (3 second delay)
└─ User sees: Login page with message "Please log in with your new password"

STEP 9: User logs in with new password
├─ User navigates/auto-redirected: To login page
├─ User enters: Email = "john.smith@example.com"
├─ User enters: Password = "NewSecure456" (new password)
├─ User clicks: "Login" button
├─ System authenticates: Credentials correct ✓
└─ User logged in: Successfully with new password

SUCCESS CRITERIA:
├─ Password reset link sent to email
├─ Link valid for 1 hour
├─ User can create new password
├─ Password meets security requirements
├─ Old sessions invalidated
├─ User can log in with new password
└─ Old password no longer works
```

---

## 📋 SCENARIO 4: Error Handling - Invalid Input

### Scenario Overview
```
Scenario Name:        Registration with Invalid Input
Feature:              Form Validation & Error Handling
Priority:             High
User Role:            New User
Business Goal:        System rejects invalid input with clear error messages
Module:               Registration, Validation
```

### Error Flows

```
ERROR FLOW A: Invalid Email Format
├─ User enters: Email = "john.smith@invalid"
├─ User enters: Password = "SecurePass123"
├─ User clicks: "Register" button
├─ System validates: Email format
├─ System finds: INVALID - Missing domain extension
├─ System displays: Error message (red text below email field):
│  └─ "Please enter a valid email address (e.g., user@example.com)"
├─ User remains: On registration page
├─ Form data: Retained (other fields still filled)
└─ User can: Correct email and retry

ERROR FLOW B: Weak Password
├─ User enters: Email = "john.smith@example.com"
├─ User enters: Password = "Pass123" (only 7 chars, needs 8)
├─ User enters: Confirm Password = "Pass123"
├─ User clicks: "Register" button
├─ System validates: Password requirements
├─ System finds: INVALID - Only 7 characters (minimum 8)
├─ System displays: Error message with requirements:
│  └─ "Password must be at least 8 characters and contain uppercase and number"
├─ System highlights: Password field in red
├─ Password strength indicator: Shows RED/Weak
└─ User can: Enter stronger password

ERROR FLOW C: Passwords Don't Match
├─ User enters: Email = "john.smith@example.com"
├─ User enters: Password = "SecurePass123"
├─ User enters: Confirm Password = "SecurePass124" (typo)
├─ User clicks: "Register" button
├─ System validates: Passwords match
├─ System finds: MISMATCH
├─ System displays: Error message:
│  └─ "Passwords do not match. Please try again."
├─ System clears: Both password fields
├─ User can: Re-enter passwords

ERROR FLOW D: Duplicate Email
├─ User enters: Email = "existing@example.com" (already registered)
├─ User enters: Password = "SecurePass123"
├─ User clicks: "Register" button
├─ System checks: Email uniqueness in database
├─ System finds: Email already exists
├─ System displays: Error message:
│  └─ "This email is already registered. Try logging in or resetting your password."
├─ System provides: Links to:
│  ├─ Login page
│  └─ Password reset page
└─ User can: Log in or reset password

SUCCESS CRITERIA (Error Handling):
├─ Clear error messages displayed
├─ Error messages specific to issue
├─ Form data retained for correction
├─ User can retry after fixing error
└─ No data processed on validation failure
```

---

## 📋 SCENARIO 5: Security & Edge Cases

### Scenario Overview
```
Scenario Name:        Security & Edge Case Testing
Feature:              Security, Rate Limiting, Account Protection
Priority:             Critical
User Role:            Attacker/Tester
Business Goal:        Verify security protections work
Module:               Login, Password Reset, Session Management
```

### Security Test Flows

```
SECURITY FLOW A: Failed Login Attempt Limiting
├─ Attempt 1: Wrong password → ❌ Login failed, message: "Invalid credentials"
├─ Attempt 2: Wrong password → ❌ Login failed (same message)
├─ Attempt 3: Wrong password → ❌ Login failed (same message)
├─ Attempt 4: Wrong password → ❌ Login failed (same message)
├─ Attempt 5: Wrong password → ❌ Login failed (same message)
├─ Attempt 6: Wrong password → ❌ Account temporarily locked
├─ System displays: "Too many failed attempts. Account locked for 15 minutes"
├─ System logs: All failed attempts with IP address
├─ User can: Wait 15 minutes or reset password
└─ System notifies: User via email: "Multiple failed login attempts on your account"

SECURITY FLOW B: Password Reset Token Misuse
├─ Attacker obtains: Password reset token (somehow)
├─ Attacker uses: Token for password reset
├─ Attacker changes: Password for legitimate user
├─ System behavior: Token is single-use, expires after 1 use
├─ Token prevents: Re-use of same token
├─ System logs: All password reset attempts
├─ User receives: Email notification: "Password changed successfully"
├─ User can: Contact support if unauthorized

SECURITY FLOW C: Session Hijacking Prevention
├─ User logged in: Session token in cookie/storage
├─ Attacker tries: Using same session token from different IP
├─ System detects: IP mismatch
├─ System validates: Session token is still valid
├─ System may: Re-authenticate or require additional verification
├─ Option 1: Re-authentication: System asks for password
├─ Option 2: Additional factor: System sends verification code to email
└─ System logs: Suspicious activity

SUCCESS CRITERIA (Security):
├─ Rate limiting prevents brute force attacks
├─ Tokens are single-use and time-limited
├─ Sessions are invalidated on password change
├─ All attempts logged for audit
└─ User notifications sent for security events
```

---

## 📊 Summary of All Scenarios

| Scenario | Priority | Main Flow Steps | Alternative Flows | Error Flows |
|----------|----------|-----------------|-------------------|------------|
| **Registration & First Login** | Critical | 8 | 0 | 4 |
| **Existing User Login** | Critical | 5 | 1 (Remember Me) | 2 |
| **Password Reset** | High | 9 | 0 | 3 |
| **Invalid Input** | High | - | - | 4 |
| **Security & Edge Cases** | Critical | - | - | 3 |

**Total Flows:** 35+ different test paths

---

## ✅ What These Scenarios Cover

✅ **Happy Path:** Valid user registration and login
✅ **Alternative Flows:** Remember me, auto-login
✅ **Error Scenarios:** Invalid input, duplicate email, weak password
✅ **Security Flows:** Rate limiting, token expiry, session management
✅ **End-to-End:** Registration → Email verification → Login → Dashboard
✅ **Integration:** Multiple modules working together
✅ **User Perspective:** Real-world user journeys
✅ **Business Logic:** Account lifecycle, security policies

---

These 5 scenarios provide a complete picture of the authentication feature!
