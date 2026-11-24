*** Settings ***
Documentation     Burger menu tests: logout and reset app state.
Resource          ../resources/pages/LoginPage.resource
Resource          ../resources/pages/InventoryPage.resource
Resource          ../resources/pages/MenuPage.resource
Test Setup        Open And Log In
Test Teardown     Close Browser
Test Tags         menu

*** Test Cases ***
User Can Log Out
    [Tags]    smoke
    Logout
    Login Page Should Be Open

Reset App State Clears The Cart
    Add Product To Cart       sauce-labs-backpack
    Cart Badge Should Show    1
    Reset App State
    Cart Badge Should Not Be Shown

*** Keywords ***
Open And Log In
    Open Sauce Demo
    Login As    ${VALID_USER}    ${VALID_PASSWORD}
    Inventory Page Should Be Open
