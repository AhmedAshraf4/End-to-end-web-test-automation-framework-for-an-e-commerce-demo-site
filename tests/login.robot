*** Settings ***
Library     ../libraries/helpers.py
Resource    ../resources/common.robot
Resource    ../resources/variables.robot
Resource    ../resources/login_page.robot

*** Test Cases ***
Valid Login
    [Tags]    smoke    regression    login
    Open Browser To Login Page
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Successful Login
    Close Browser Session

Data Driven Login Scenarios
    [Tags]    regression    login
    ${rows}=    Read Login Test Data    ${LOGIN_DATA_FILE}
    FOR    ${row}    IN    @{rows}
        Open Browser To Login Page
        ${username}=    Normalize Value    ${row}[username]
        ${password}=    Normalize Value    ${row}[password]
        ${expected}=    Set Variable       ${row}[expected]

        Login With Credentials    ${username}    ${password}

        IF    '${expected}' == 'success'
            Verify Successful Login
        ELSE IF    '${expected}' == 'locked'
            Verify Locked User Error
        ELSE IF    '${expected}' == 'invalid'
            Verify Invalid Login Error
        ELSE IF    '${expected}' == 'username_required'
            Verify Required Username Error
        ELSE IF    '${expected}' == 'password_required'
            Verify Required Password Error
        END
        Close Browser Session
    END