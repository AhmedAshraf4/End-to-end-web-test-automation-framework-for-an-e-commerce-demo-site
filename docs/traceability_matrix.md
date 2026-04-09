# Traceability Matrix

| Requirement ID | Requirement Description | Test Case ID(s) | Automated Suite / Keyword Coverage | Status |
|---|---|---|---|---|
| REQ-LOGIN-001 | User can log in with valid credentials | TC-LOGIN-001 | `tests/login.robot` → `Valid Login` | Covered |
| REQ-LOGIN-002 | Locked user cannot log in | TC-LOGIN-002 | `tests/login.robot` → data-driven negative path + `Verify Locked User Error` | Covered |
| REQ-LOGIN-003 | Invalid credentials show proper error | TC-LOGIN-003 | `tests/login.robot` → data-driven negative path + `Verify Invalid Login Error` | Covered |
| REQ-LOGIN-004 | Missing username is validated | TC-LOGIN-004 | `tests/login.robot` → data-driven path + `Verify Required Username Error` | Covered |
| REQ-LOGIN-005 | Missing password is validated | TC-LOGIN-005 | `tests/login.robot` → data-driven path + `Verify Required Password Error` | Covered |
| REQ-CART-001 | User can add backpack item to cart | TC-CART-001 | `tests/cart.robot` + `Add Backpack To Cart` | Covered |
| REQ-CART-002 | Cart badge reflects item count | TC-CART-001 | `Verify Cart Badge Count` | Covered |
| REQ-CART-003 | User can remove backpack from cart | TC-CART-002 | `tests/cart.robot` + `Remove Backpack From Cart` | Covered |
| REQ-CART-004 | Cart can be opened and validated | TC-CART-001, TC-CART-002 | `Open Cart`, `Verify Cart Has Backpack`, `Verify Cart Is Empty` | Covered |
| REQ-CHK-001 | User can start checkout from cart | TC-CHK-001 to TC-CHK-004 | `Click Checkout` | Covered |
| REQ-CHK-002 | Valid checkout information is accepted | TC-CHK-001 | `Enter Checkout Information` | Covered |
| REQ-CHK-003 | Missing first name is rejected | TC-CHK-002 | `Enter Checkout Information Without Validation` + `Verify Checkout Info Error` | Covered |
| REQ-CHK-004 | Missing last name is rejected | TC-CHK-003 | `Enter Checkout Information Without Validation` + `Verify Checkout Info Error` | Covered |
| REQ-CHK-005 | Missing postal code is rejected | TC-CHK-004 | `Enter Checkout Information Without Validation` + `Verify Checkout Info Error` | Covered |
| REQ-CHK-006 | Overview page is displayed before finish | TC-CHK-001 | `Verify Checkout Overview Page` | Covered |
| REQ-CHK-007 | Overview shows selected item | TC-CHK-001 | `Verify Checkout Overview Has Backpack` | Covered |
| REQ-CHK-008 | Item total is displayed | TC-CHK-001 | `Verify Item Total Is Displayed` | Covered |
| REQ-CHK-009 | Checkout can be completed | TC-CHK-001 | `Finish Checkout`, `Verify Checkout Complete` | Covered |
| REQ-API-001 | Health endpoint reports service status | TC-API-001 | `GET /health` | Covered |
| REQ-API-002 | Posts collection can be retrieved | TC-API-002 | `GET /posts` | Covered |
| REQ-API-003 | Single post can be retrieved by id | TC-API-003 | `GET /posts/1` | Covered |
| REQ-API-004 | New post can be created | TC-API-004 | `POST /posts` | Covered |
| REQ-FWK-001 | Browser setup supports CI headless mode | N/A | `resources/common.robot` + `resources/ci.py` | Covered |
| REQ-FWK-002 | Failures capture screenshots | N/A | `Register Keyword To Run On Failure  Capture Page Screenshot` | Covered |
| REQ-FWK-003 | Login data can be externalized | TC-LOGIN-001 to TC-LOGIN-005 | `libraries/helpers.py` + `data/login_data.csv` | Covered |
| REQ-FWK-004 | Smoke and regression tags can be run in CI | N/A | `.github/workflows/robot-tests.yml` | Covered |