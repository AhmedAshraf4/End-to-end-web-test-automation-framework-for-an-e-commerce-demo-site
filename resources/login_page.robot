*** Settings ***
Library     SeleniumLibrary
Resource    common.robot
Resource    locators/login_locators.robot

*** Keywords ***
Enter Username
    [Arguments]    ${username}
    Input Text Safely    ${LOGIN_USERNAME_INPUT}    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text Safely    ${LOGIN_PASSWORD_INPUT}    ${password}

Click Login
    Click Button Safely    ${LOGIN_BUTTON}

Login With Credentials
    [Arguments]    ${username}    ${password}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login

Verify Successful Login
    Wait Until Location Contains     inventory.html    10s
    Wait Until Element Is Visible    ${PRODUCTS_TITLE}    10s

Verify Locked User Error
    Element Should Be Visible    ${LOGIN_ERROR_MESSAGE}
    Element Should Contain       ${LOGIN_ERROR_MESSAGE}    locked out

Verify Invalid Login Error
    Element Should Be Visible    ${LOGIN_ERROR_MESSAGE}
    Element Should Contain       ${LOGIN_ERROR_MESSAGE}    Username and password do not match

Verify Required Username Error
    Element Should Be Visible    ${LOGIN_ERROR_MESSAGE}
    Element Should Contain       ${LOGIN_ERROR_MESSAGE}    Username is required

Verify Required Password Error
    Element Should Be Visible    ${LOGIN_ERROR_MESSAGE}
    Element Should Contain       ${LOGIN_ERROR_MESSAGE}    Password is required