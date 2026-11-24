*** Settings ***
Documentation    Shopping cart tests on the Products page
Resource    ../resources/pages/LoginPage.resource
Resource    ../resources/pages/InventoryPage.resource
Resource    ../resources/pages/CheckoutPage.resource
Test Setup        Open And Log In
Test Teardown     Close Browser
Test Tags         shopping

*** Test Cases ***
Adding One Product Shows Badge 1
    [Tags]    smoke
    Add Product To Cart    sauce-labs-backpack
    Cart Badge Should Show    1

Adding Two Products Shows Badge 2
    Add Product To Cart    sauce-labs-backpack
    Add Product To Cart   sauce-labs-bike-light
    Cart Badge Should Show    2

Removing The Only Product Hides The Badge
    Add Product To Cart    sauce-labs-backpack
    Cart Badge Should Show    1
    Remove Product From Cart    sauce-labs-backpack
    Cart Badge Should Not Be Shown

Customer Can Buy A Backpack End To End
    [Tags]    smoke    e2e
    Add Product To Cart            sauce-labs-backpack
    Open Cart
    Cart Should Contain Product    Sauce Labs Backpack
    Start Checkout
    Fill Customer Information    fname    lName    23562
    Finish Order
    Order Should Be Complete


Customer Can Buy A Backpack End To End with Python Helper
    [Tags]    smoke    e2e
    Add Product To Cart            sauce-labs-backpack
    Open Cart
    Cart Should Contain Product    Sauce Labs Backpack
    Start Checkout
    Fill Customer Information With Random Data
    Finish Order
    Order Should Be Complete

*** Keywords ***
Open And Log In
    Open Sauce Demo
    Login As    ${VALID_USER}    ${VALID_PASSWORD}
    Inventory Page Should Be Open