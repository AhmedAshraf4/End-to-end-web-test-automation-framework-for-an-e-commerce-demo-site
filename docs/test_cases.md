# Test Cases

## TC-LOGIN-001 — Valid login
**Priority:** High  
**Type:** Smoke, Regression, UI  
**Preconditions:** SauceDemo is reachable.

**Steps**
1. Open login page.
2. Enter valid username.
3. Enter valid password.
4. Click Login.

**Expected Result**
- User is redirected to `inventory.html`.
- Products title is visible.

---

## TC-LOGIN-002 — Locked user login
**Priority:** High  
**Type:** Regression, UI, Negative

**Steps**
1. Open login page.
2. Enter `locked_out_user`.
3. Enter `secret_sauce`.
4. Click Login.

**Expected Result**
- Login error message is shown.
- Error contains locked-out indication.

---

## TC-LOGIN-003 — Invalid password
**Priority:** High  
**Type:** Regression, UI, Negative

**Steps**
1. Open login page.
2. Enter `standard_user`.
3. Enter `wrong_password`.
4. Click Login.

**Expected Result**
- Login error message is shown.
- Error contains invalid credentials message.

---

## TC-LOGIN-004 — Missing username
**Priority:** High  
**Type:** Regression, UI, Negative

**Steps**
1. Open login page.
2. Leave username empty.
3. Enter valid password.
4. Click Login.

**Expected Result**
- Login error message is shown.
- Error contains `Username is required`.

---

## TC-LOGIN-005 — Missing password
**Priority:** High  
**Type:** Regression, UI, Negative

**Steps**
1. Open login page.
2. Enter valid username.
3. Leave password empty.
4. Click Login.

**Expected Result**
- Login error message is shown.
- Error contains `Password is required`.

---

## TC-CART-001 — Add item to cart
**Priority:** High  
**Type:** Smoke, Regression, UI

**Preconditions**
- User logs in successfully.

**Steps**
1. Add backpack item to cart.
2. Verify cart badge count.
3. Open cart.

**Expected Result**
- Cart badge shows `1`.
- Backpack item appears in cart.

---

## TC-CART-002 — Remove item from cart
**Priority:** Medium  
**Type:** Regression, UI

**Preconditions**
- User logs in successfully.
- Backpack item is added first.

**Steps**
1. Remove backpack from cart.
2. Open cart.

**Expected Result**
- Backpack item is no longer present in cart.

---

## TC-CHK-001 — Complete checkout
**Priority:** High  
**Type:** Smoke, Regression, UI

**Preconditions**
- User logs in.
- Backpack item is in cart.

**Steps**
1. Open cart.
2. Click checkout.
3. Enter valid first name, last name, and postal code.
4. Continue.
5. Verify overview page.
6. Finish checkout.

**Expected Result**
- Overview page is displayed.
- Backpack item is visible in overview.
- Item total is displayed.
- Completion page is displayed.

---

## TC-CHK-002 — Checkout missing first name
**Priority:** High  
**Type:** Regression, UI, Negative

**Preconditions**
- User logs in.
- Backpack item is in cart.

**Steps**
1. Open cart.
2. Click checkout.
3. Leave first name empty.
4. Enter valid last name and postal code.
5. Continue.

**Expected Result**
- Error message is shown for missing first name.

---

## TC-CHK-003 — Checkout missing last name
**Priority:** High  
**Type:** Regression, UI, Negative

**Preconditions**
- User logs in.
- Backpack item is in cart.

**Steps**
1. Open cart.
2. Click checkout.
3. Enter valid first name.
4. Leave last name empty.
5. Enter postal code.
6. Continue.

**Expected Result**
- Error message is shown for missing last name.

---

## TC-CHK-004 — Checkout missing postal code
**Priority:** High  
**Type:** Regression, UI, Negative

**Preconditions**
- User logs in.
- Backpack item is in cart.

**Steps**
1. Open cart.
2. Click checkout.
3. Enter valid first name.
4. Enter valid last name.
5. Leave postal code empty.
6. Continue.

**Expected Result**
- Error message is shown for missing postal code.

---

## TC-API-001 — Health endpoint returns OK
**Priority:** High  
**Type:** Smoke, Regression, API

**Steps**
1. Create API session.
2. Send `GET /health`.

**Expected Result**
- Status code is `200`.
- Response contains `status=ok`.

---

## TC-API-002 — Retrieve posts list
**Priority:** Medium  
**Type:** Regression, API

**Steps**
1. Create API session.
2. Send `GET /posts`.

**Expected Result**
- Status code is `200`.
- Response contains 2 seeded posts before create-post test runs.

---

## TC-API-003 — Retrieve single post
**Priority:** Medium  
**Type:** Regression, API

**Steps**
1. Create API session.
2. Send `GET /posts/1`.

**Expected Result**
- Status code is `200`.
- Response contains `id=1`.
- Response contains `title` key.

---

## TC-API-004 — Create new post
**Priority:** Medium  
**Type:** Regression, API

**Steps**
1. Create API session.
2. Send `POST /posts` with title and category.

**Expected Result**
- Status code is `201`.
- Response contains submitted title and category.
- New item id is `3`.
