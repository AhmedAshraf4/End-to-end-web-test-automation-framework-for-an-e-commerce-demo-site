*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource   variables.robot

*** Keywords ***
Open Browser To Login Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    IF    ${HEADLESS}
        ${headless_arg}=    Set Variable    --headless=new
        ${no_sandbox_arg}=    Set Variable    --no-sandbox
        ${dev_shm_arg}=    Set Variable    --disable-dev-shm-usage
        ${window_size_arg}=    Set Variable    --window-size=1920,1080

        Call Method    ${chrome_options}    add_argument    ${headless_arg}
        Call Method    ${chrome_options}    add_argument    ${no_sandbox_arg}
        Call Method    ${chrome_options}    add_argument    ${dev_shm_arg}
        Call Method    ${chrome_options}    add_argument    ${window_size_arg}
    END

    ${disable_notifications_arg}=    Set Variable    --disable-notifications
    ${incognito_arg}=    Set Variable    --incognito

    Call Method    ${chrome_options}    add_argument    ${disable_notifications_arg}
    Call Method    ${chrome_options}    add_argument    ${incognito_arg}

    ${prefs}=    Create Dictionary    credentials_enable_service=${False}    profile.password_manager_enabled=${False}
    Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}

    Open Browser    ${URL}    chrome    options=${chrome_options}
    Set Window Size    1920    1080
    Set Selenium Timeout    10s
    Register Keyword To Run On Failure    Capture Page Screenshot

Close Browser Session
    Close Browser

Click Element Safely
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    10s
    Wait Until Element Is Enabled    ${locator}    10s
    Scroll Element Into View         ${locator}
    Click Element                    ${locator}

Click Button Safely
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    10s
    Wait Until Element Is Enabled    ${locator}    10s
    Scroll Element Into View         ${locator}
    Click Button                     ${locator}

Input Text Safely
    [Arguments]    ${locator}    ${text}
    Wait Until Element Is Visible    ${locator}    10s
    Clear Element Text               ${locator}
    Input Text                       ${locator}    ${text}