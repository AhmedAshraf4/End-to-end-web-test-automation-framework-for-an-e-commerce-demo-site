*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/variables.robot
Resource    ../resources/login_page.robot

Test Setup      Open Browser To Login Page
Test Teardown   Close Browser Session

*** Test Cases ***
Valid Login
    [Tags]    smoke    regression    login
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Successful Login

Invalid Login
    [Tags]    regression    login
    Login With Credentials    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Verify Login Error Message