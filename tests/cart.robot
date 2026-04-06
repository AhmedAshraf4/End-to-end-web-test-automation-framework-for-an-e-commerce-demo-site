*** Settings ***
Resource    ../resources/common.robot
Resource    ../resources/variables.robot
Resource    ../resources/login_page.robot
Resource    ../resources/products_page.robot

Test Setup      Open Browser To Login Page
Test Teardown   Close Browser Session

*** Test Cases ***
Add Item To Cart
    [Tags]    smoke    regression    cart
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Successful Login
    Add Backpack To Cart
    Verify Cart Badge Count    1
    Open Cart
    Verify Cart Has Backpack

Remove Item From Cart
    [Tags]    regression    cart
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Successful Login
    Add Backpack To Cart
    Verify Cart Badge Count    1
    Remove Backpack From Cart
    Open Cart
    Verify Cart Is Empty