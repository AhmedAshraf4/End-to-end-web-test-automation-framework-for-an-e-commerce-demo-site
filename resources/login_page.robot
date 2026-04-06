*** Settings ***
Library     SeleniumLibrary
Resource    common.robot

*** Keywords ***
Enter Username
    [Arguments]    ${username}
    Input Text Safely    id:user-name    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text Safely    id:password    ${password}

Click Login
    Click Button Safely    id:login-button

Login With Credentials
    [Arguments]    ${username}    ${password}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login

Verify Successful Login
    Wait Until Location Contains     inventory.html    10s
    Wait Until Element Is Visible    xpath://span[text()='Products']    10s

Verify Locked User Error
    Element Should Be Visible    xpath://h3[@data-test='error']
    Element Should Contain       xpath://h3[@data-test='error']    locked out

Verify Invalid Login Error
    Element Should Be Visible    xpath://h3[@data-test='error']
    Element Should Contain       xpath://h3[@data-test='error']    Username and password do not match

Verify Required Username Error
    Element Should Be Visible    xpath://h3[@data-test='error']
    Element Should Contain       xpath://h3[@data-test='error']    Username is required

Verify Required Password Error
    Element Should Be Visible    xpath://h3[@data-test='error']
    Element Should Contain       xpath://h3[@data-test='error']    Password is required