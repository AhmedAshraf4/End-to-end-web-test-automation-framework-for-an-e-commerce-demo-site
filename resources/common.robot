*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource   variables.robot

*** Keywords ***
Open Browser To Login Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    IF    ${HEADLESS}
        Call Method    ${chrome_options}    add_argument    --headless=new
        Call Method    ${chrome_options}    add_argument    --no-sandbox
        Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
        Call Method    ${chrome_options}    add_argument    --window-size=1920,1080
    END

    Call Method    ${chrome_options}    add_argument    --disable-notifications
    Call Method    ${chrome_options}    add_argument    --incognito

    ${prefs}=    Create Dictionary    credentials_enable_service=${False}    profile.password_manager_enabled=${False}
    Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}

    Open Browser    ${URL}    chrome    options=${chrome_options}
    Maximize Browser Window
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