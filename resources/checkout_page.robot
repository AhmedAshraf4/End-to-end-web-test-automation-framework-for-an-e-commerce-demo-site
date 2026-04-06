*** Settings ***
Library    SeleniumLibrary
Library    ../libraries/helpers.py

*** Keywords ***
Click Checkout
    Wait Until Element Is Visible    id:checkout    10s
    Scroll Element Into View         id:checkout
    Click Button                     id:checkout
    Wait Until Location Contains     checkout-step-one.html    10s
    Wait Until Element Is Visible    id:first-name    10s

Enter Checkout Information
    [Arguments]    ${firstname}    ${lastname}    ${postalcode}
    ${is_valid}=    Is Valid Postal Code    ${postalcode}
    Should Be True    ${is_valid}
    Input Text    id:first-name    ${firstname}
    Input Text    id:last-name     ${lastname}
    Input Text    id:postal-code   ${postalcode}
    Click Button    id:continue

Verify Checkout Overview Page
    Wait Until Location Contains     checkout-step-two.html    10s
    Wait Until Element Is Visible    id:finish    10s

Finish Checkout
    Scroll Element Into View         id:finish
    Click Button                     id:finish

Verify Checkout Complete
    Wait Until Location Contains     checkout-complete.html    10s
    Wait Until Page Contains         Thank you for your order!    10s