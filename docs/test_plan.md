# Test Plan

## 1. Document Control
- **Project:** End-to-end web test automation framework for an e-commerce demo site
- **Application under test:** SauceDemo UI and local Flask API
- **Automation stack:** Robot Framework, SeleniumLibrary, RequestsLibrary, Python, Flask, GitHub Actions
- **Test levels covered:** UI functional, negative validation, API, smoke, regression

## 2. Purpose
This test plan defines the scope, strategy, environment, data, and execution approach for the automation framework. The repository is organized around Robot Framework suites under `tests/`, reusable page resources under `resources/`, custom Python helpers under `libraries/`, CSV-based test data under `data/`, and a local Flask service in `app.py` for stable API testing.

## 3. Objectives
- Validate core login behavior on SauceDemo.
- Validate cart workflows such as add/remove item.
- Validate checkout happy path and required-field negative cases.
- Validate local API endpoints for health, list, get-by-id, and create operations.
- Support maintainable and reusable test design with separated locators, shared keywords, and environment-specific variable files.
- Support CI execution with smoke and regression tagging.

## 4. In Scope
### UI scope
- Valid login
- Invalid login credentials
- Locked user validation
- Missing username validation
- Missing password validation
- Add backpack item to cart
- Remove backpack item from cart
- Validate cart badge count
- Complete checkout flow
- Checkout validation when first name is missing
- Checkout validation when last name is missing
- Checkout validation when postal code is missing
- Verify overview page and total section

### API scope
- `GET /health`
- `GET /posts`
- `GET /posts/1`
- `POST /posts`

### Non-functional automation scope
- Headless execution in CI
- Screenshot capture on UI failure
- Tag-based execution (`smoke`, `regression`)
- Artifact upload from GitHub Actions

## 5. Out of Scope
- Cross-browser compatibility beyond Chrome
- Performance, load, and security testing
- Visual testing
- Database validation
- Mobile testing
- Real external API integration

## 6. Test Items
- SauceDemo web UI
- Local Flask API from `app.py`
- Robot Framework suites:
  - `tests/login.robot`
  - `tests/cart.robot`
  - `tests/checkout.robot`
  - `tests/api.robot`
- Supporting resources:
  - `resources/common.robot`
  - `resources/login_page.robot`
  - `resources/products_page.robot`
  - `resources/checkout_page.robot`
  - locator resource files
  - `libraries/helpers.py`
  - `data/login_data.csv`

## 7. Test Strategy
### 7.1 UI automation strategy
The framework uses page/resource-based keywords instead of placing Selenium steps directly inside test cases. Shared browser setup and safe interaction helpers are centralized in `resources/common.robot`. Page-specific actions and assertions are separated into dedicated resource files.

### 7.2 API automation strategy
The framework uses RequestsLibrary against a locally hosted Flask app so the API tests are deterministic and independent of third-party instability.

### 7.3 Data strategy
Login scenarios are driven from `data/login_data.csv` using helper functions in `libraries/helpers.py`.

### 7.4 Execution strategy
- **Smoke suite:** critical checks only
- **Regression suite:** broader end-to-end and API validation
- **Local execution:** `resources/dev.py` or `resources/qa.py`
- **CI execution:** `resources/ci.py` with headless mode enabled

## 8. Entry Criteria
- Python installed
- Project dependencies installed from `requirements.txt`
- Chrome available
- Local Flask API available for API execution
- AUT reachable at SauceDemo URL

## 9. Exit Criteria
- Smoke suite passes for CI gating
- Regression suite completes
- No blocker issue remains on covered critical paths
- Results and logs are generated in `results/`

## 10. Environment
### Local
- Python 3.x
- Chrome browser
- Robot Framework
- Virtual environment optional
- `resources/dev.py` or `resources/qa.py`

### CI
- Ubuntu runner
- Python 3.11
- Chrome installed in workflow
- `resources/ci.py` with headless execution

## 11. Test Data
### Credentials
- Valid user: `standard_user / secret_sauce`
- Locked user: `locked_out_user / secret_sauce`
- Invalid password: `standard_user / wrong_password`

### Checkout data
- First name: Ahmed
- Last name: Ashraf
- Postal code: 12345

### API seed data
Two posts are initialized in `app.py`, and create-post adds a third record during execution.

## 12. Risks and Assumptions
### Risks
- UI locators may break if SauceDemo changes.
- API tests depend on Flask app startup timing.
- Data-driven login behavior depends on CSV expected values matching Robot conditions.

### Assumptions
- SauceDemo remains publicly accessible.
- Chrome is available in both local and CI environments.
- Localhost port `5000` is free for the Flask app.

## 13. Deliverables
- Automated Robot Framework suites
- CI workflow
- Results folder and execution logs
- QA documentation:
  - test plan
  - test cases
  - bug reports
  - traceability matrix

## 14. Recommended Execution Commands
```bash
pip install -r requirements.txt
python app.py
robot --variablefile resources/dev.py -d results tests/
robot --variablefile resources/ci.py -i smoke -d results tests/
robot --variablefile resources/ci.py -i regression -d results tests/
```

