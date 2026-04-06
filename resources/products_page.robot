*** Settings ***
Library     SeleniumLibrary
Resource    common.robot

*** Keywords ***
Add Backpack To Cart
    Click Button Safely    id:add-to-cart-sauce-labs-backpack

Remove Backpack From Cart
    Click Button Safely    id:remove-sauce-labs-backpack

Open Cart
    Click Element Safely               class:shopping_cart_link
    Wait Until Location Contains       cart.html    10s
    Wait Until Element Is Visible      id:checkout    10s

Verify Cart Has Backpack
    Wait Until Element Is Visible    xpath://div[text()='Sauce Labs Backpack']    10s

Verify Cart Is Empty
    Page Should Not Contain Element    xpath://div[text()='Sauce Labs Backpack']