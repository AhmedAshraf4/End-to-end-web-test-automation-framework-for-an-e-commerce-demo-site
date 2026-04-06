*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/variables.robot
Resource    ../resources/login_page.robot
Resource    ../resources/products_page.robot
Resource    ../resources/checkout_page.robot

Test Setup      Open Browser To Login Page
Test Teardown   Close Browser Session

*** Test Cases ***
Complete Checkout
    [Tags]    smoke    regression    checkout
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Successful Login
    Add Backpack To Cart
    Verify Cart Badge Count    1
    Open Cart
    Verify Cart Has Backpack
    Click Checkout
    Enter Checkout Information    ${FIRSTNAME}    ${LASTNAME}    ${POSTALCODE}
    Verify Checkout Overview Page
    Verify Checkout Overview Has Backpack
    Verify Item Total Is Displayed
    Finish Checkout
    Verify Checkout Complete

Checkout With Missing First Name
    [Tags]    regression    checkout    negative
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Successful Login
    Add Backpack To Cart
    Open Cart
    Click Checkout
    Enter Checkout Information Without Validation    ${EMPTY}    ${LASTNAME}    ${POSTALCODE}
    Verify Checkout Info Error    First Name is required

Checkout With Missing Last Name
    [Tags]    regression    checkout    negative
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Successful Login
    Add Backpack To Cart
    Open Cart
    Click Checkout
    Enter Checkout Information Without Validation    ${FIRSTNAME}    ${EMPTY}    ${POSTALCODE}
    Verify Checkout Info Error    Last Name is required

Checkout With Missing Postal Code
    [Tags]    regression    checkout    negative
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Successful Login
    Add Backpack To Cart
    Open Cart
    Click Checkout
    Enter Checkout Information Without Validation    ${FIRSTNAME}    ${LASTNAME}    ${EMPTY}
    Verify Checkout Info Error    Postal Code is required