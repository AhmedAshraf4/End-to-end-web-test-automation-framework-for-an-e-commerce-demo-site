*** Settings ***
Library     SeleniumLibrary
Resource    common.robot
Resource    locators/products_locators.robot

*** Keywords ***
Add Backpack To Cart
    Click Button Safely    ${ADD_BACKPACK_BUTTON}

Remove Backpack From Cart
    Click Button Safely    ${REMOVE_BACKPACK_BUTTON}

Open Cart
    Click Element Safely               ${CART_LINK}
    Wait Until Location Contains       cart.html    10s
    Wait Until Element Is Visible      ${CART_CHECKOUT_BUTTON}    10s

Verify Cart Has Backpack
    Wait Until Element Is Visible    ${BACKPACK_ITEM_NAME}    10s

Verify Cart Is Empty
    Page Should Not Contain Element    ${BACKPACK_ITEM_NAME}

Verify Cart Badge Count
    [Arguments]    ${expected_count}
    Element Text Should Be    ${CART_BADGE}    ${expected_count}