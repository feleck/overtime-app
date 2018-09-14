# Overtime App

## Key requirements: documentation of overtime

## Models
- [x] Post -> date:date rationale:text
- [x] User -> Devise
- [x] AdminUser -> STI
- AuditLog

## Features
- Approval
- SMS
- [x] Admin dashboard
- [x] Block non admin and guest users
- Email summary
- Documented - logging

## UI
- [x] Bootstrap -> formatting
- [x] Icons for glyphiconsfrom
-  Font Awesome?
- [x] Update the styles for forms

## TODOS:
- [x] Refactor user association integration test in post_spec
- [x] Add full name method for users
- [x] Update admin dashboard post view to show search form
- Refactor posts\_form for admin user with status
- [x] Refactor admin user check in nav
- Fix post_spec.rb:28 to not manipulate database
- Fix post_spec.rb:39 to not manipulate database
- Integrate validation for phone attr in user
  # No spaces or dashes
  # exactly 10 characters
  # all characters have to be a number
