# Bug Reports

## BUG-001 — Data-driven login expected values do not match Robot conditions
**Severity:** Medium  
**Priority:** High  
**Area:** `tests/login.robot` + `data/login_data.csv`

### Summary
The data-driven login test expects semantic result labels such as `success`, `locked`, `invalid`, `username_required`, and `password_required`, but the CSV content appears to use generic `error` values for negative scenarios.

### Preconditions
- Test execution uses `Data Driven Login Scenarios`.
- `data/login_data.csv` is loaded by `Read Login Test Data`.

### Steps to Reproduce
1. Run the login suite.
2. Execute the data-driven login test.
3. Review the `expected` column values from CSV.
4. Compare them with the conditional branches in `tests/login.robot`.

### Actual Result
Negative rows may not match any explicit Robot branch, so the intended verification keyword is not selected.

### Expected Result
Each CSV row should map directly to an implemented condition in the Robot test.

### Suggested Fix
Update `data/login_data.csv` values to use:
- `success`
- `locked`
- `invalid`
- `username_required`
- `password_required`

Or update the Robot conditional logic to support the current CSV values.



