*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Add Backpack To Cart
    Wait Until Element Is Visible    id:add-to-cart-sauce-labs-backpack    10s
    Click Button    id:add-to-cart-sauce-labs-backpack

Remove Backpack From Cart
    Wait Until Element Is Visible    id:remove-sauce-labs-backpack    10s
    Click Button    id:remove-sauce-labs-backpack

Open Cart
    Wait Until Element Is Visible    class:shopping_cart_link    10s
    Click Element                    class:shopping_cart_link
    Wait Until Location Contains     cart.html    10s
    Wait Until Element Is Visible    id:checkout    10s

Verify Cart Has Backpack
    Wait Until Element Is Visible    xpath://div[text()='Sauce Labs Backpack']    10s

Verify Cart Is Empty
    Page Should Not Contain Element    xpath://div[text()='Sauce Labs Backpack']