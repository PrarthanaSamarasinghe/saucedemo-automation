*** Settings ***
Documentation     Product details page tests.
Resource          ../resources/pages/LoginPage.resource
Resource          ../resources/pages/InventoryPage.resource
Resource          ../resources/pages/ProductDetailsPage.resource
Test Setup        Open And Log In
Test Teardown     Close Browser
Test Tags         details

*** Test Cases ***
Product Details Show Correct Name And Price
    [Tags]    smoke
    Open Product Details           Sauce Labs Backpack
    Product Details Should Show    Sauce Labs Backpack    $29.99

User Can Go Back To Products
    Open Product Details    Sauce Labs Bike Light
    Go Back To Products
    Inventory Page Should Be Open

User Can Add Product To Cart From Details
    Open Product Details                Sauce Labs Bolt T-Shirt
    Add Product To Cart From Details
    Cart Badge Should Show              1

*** Keywords ***
Open And Log In
    Open Sauce Demo
    Login As    ${VALID_USER}    ${VALID_PASSWORD}
    Inventory Page Should Be Open