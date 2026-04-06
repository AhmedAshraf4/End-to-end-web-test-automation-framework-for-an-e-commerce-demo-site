*** Settings ***
Library     SeleniumLibrary
Library     ../libraries/helpers.py
Resource    common.robot
Resource    locators/checkout_locators.robot
Resource    locators/products_locators.robot

*** Keywords ***
Click Checkout
    Click Button Safely               ${CART_CHECKOUT_BUTTON}
    Wait Until Location Contains      checkout-step-one.html    10s
    Wait Until Element Is Visible     ${CHECKOUT_FIRST_NAME}    10s

Enter Checkout Information
    [Arguments]    ${firstname}    ${lastname}    ${postalcode}
    ${is_valid}=    Is Valid Postal Code    ${postalcode}
    Should Be True    ${is_valid}
    Input Text Safely    ${CHECKOUT_FIRST_NAME}    ${firstname}
    Input Text Safely    ${CHECKOUT_LAST_NAME}     ${lastname}
    Input Text Safely    ${CHECKOUT_POSTAL_CODE}   ${postalcode}
    Click Button Safely    ${CHECKOUT_CONTINUE_BUTTON}

Enter Checkout Information Without Validation
    [Arguments]    ${firstname}    ${lastname}    ${postalcode}
    Input Text Safely    ${CHECKOUT_FIRST_NAME}    ${firstname}
    Input Text Safely    ${CHECKOUT_LAST_NAME}     ${lastname}
    Input Text Safely    ${CHECKOUT_POSTAL_CODE}   ${postalcode}
    Click Button Safely    ${CHECKOUT_CONTINUE_BUTTON}

Verify Checkout Info Error
    [Arguments]    ${expected_message}
    Element Should Be Visible    ${CHECKOUT_ERROR_MESSAGE}
    Element Should Contain       ${CHECKOUT_ERROR_MESSAGE}    ${expected_message}

Verify Checkout Overview Page
    Wait Until Location Contains     checkout-step-two.html    10s
    Wait Until Element Is Visible    ${CHECKOUT_OVERVIEW_TITLE}    10s
    Wait Until Element Is Visible    ${CHECKOUT_FINISH_BUTTON}    10s

Verify Checkout Overview Has Backpack
    Element Should Be Visible    ${BACKPACK_ITEM_NAME}

Verify Item Total Is Displayed
    Element Should Be Visible    ${CHECKOUT_ITEM_TOTAL}
    Element Should Contain       ${CHECKOUT_ITEM_TOTAL}    Item total

Finish Checkout
    Click Button Safely    ${CHECKOUT_FINISH_BUTTON}

Verify Checkout Complete
    Wait Until Location Contains    checkout-complete.html    10s
    Wait Until Page Contains        ${CHECKOUT_COMPLETE_TEXT}    10s