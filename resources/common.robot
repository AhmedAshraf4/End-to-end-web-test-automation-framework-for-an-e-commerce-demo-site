*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource   variables.robot

*** Keywords ***
Open Browser To Login Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
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