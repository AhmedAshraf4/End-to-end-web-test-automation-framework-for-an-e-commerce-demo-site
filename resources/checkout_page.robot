*** Settings ***
Library     SeleniumLibrary
Library     ../libraries/helpers.py
Resource    common.robot

*** Keywords ***
Click Checkout
    Click Button Safely               id:checkout
    Wait Until Location Contains      checkout-step-one.html    10s
    Wait Until Element Is Visible     id:first-name    10s

Enter Checkout Information
    [Arguments]    ${firstname}    ${lastname}    ${postalcode}
    ${is_valid}=    Is Valid Postal Code    ${postalcode}
    Should Be True    ${is_valid}
    Input Text Safely    id:first-name     ${firstname}
    Input Text Safely    id:last-name      ${lastname}
    Input Text Safely    id:postal-code    ${postalcode}
    Click Button Safely    id:continue

Enter Checkout Information Without Validation
    [Arguments]    ${firstname}    ${lastname}    ${postalcode}
    Input Text Safely    id:first-name     ${firstname}
    Input Text Safely    id:last-name      ${lastname}
    Input Text Safely    id:postal-code    ${postalcode}
    Click Button Safely    id:continue

Verify Checkout Info Error
    [Arguments]    ${expected_message}
    Element Should Be Visible    xpath://h3[@data-test='error']
    Element Should Contain       xpath://h3[@data-test='error']    ${expected_message}

Verify Checkout Overview Page
    Wait Until Location Contains     checkout-step-two.html    10s
    Wait Until Element Is Visible    id:finish    10s

Finish Checkout
    Click Button Safely    id:finish

Verify Checkout Complete
    Wait Until Location Contains    checkout-complete.html    10s
    Wait Until Page Contains        Thank you for your order!    10s