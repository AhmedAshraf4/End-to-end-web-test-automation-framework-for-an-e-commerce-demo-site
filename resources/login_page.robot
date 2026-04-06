*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Input Username
    [Arguments]    ${username}
    Input Text    id:user-name    ${username}

Enter Password
    [Arguments]    ${password}
    Input Password    id:password    ${password}

Click Login
    Click Button    id:login-button

Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Enter Password    ${password}
    Click Login

Verify Successful Login
    Wait Until Element Is Visible    xpath://span[text()='Products']

Verify Login Error Message
    Element Should Be Visible    xpath://h3[@data-test='error']