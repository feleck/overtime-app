# Overtime App

## Key requirements: documentation of overtime

## Models
- [x] Post -> date:date rationale:text
- [x] User -> Devise
- [x] AdminUser -> STI
- [x] AuditLog

## Features
- Approval
- SMS Sending -> integrate with heoku scheduler
- [x] Admin dashboard
- [x] Block non admin and guest users
- [x] Email summary
- [x] Documented - logging

## UI
- [x] Bootstrap -> formatting
- [x] Icons for glyphiconsfrom
- [x] Update the styles for forms

## TODOS:
- [x] Refactor user association integration test in post_spec
- [x] Add full name method for users
- [x] Update admin dashboard post view to show search form
- [x] Refactor posts\_form for admin user with status
- [x] Refactor admin user check in nav
- [x] Integrate validation for phone attr in user
  [x]  No spaces or dashes
  [x] exactly 10 characters
  [x] all characters have to be a number

STOP USING Readme as ToDo list!
