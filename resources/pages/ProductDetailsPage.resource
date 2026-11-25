*** Settings ***
Documentation     Page Object: the single product details page.
Library           SeleniumLibrary

*** Variables ***
${DETAILS_NAME}        css=[data-test="inventory-item-name"]
${DETAILS_PRICE}       css=[data-test="inventory-item-price"]
${DETAILS_BACK}        id=back-to-products
${DETAILS_ADD}         id=add-to-cart

*** Keywords ***
Open Product Details
    [Arguments]    ${product_name}
    Click Element    xpath=//div[@data-test="inventory-item-name" and text()="${product_name}"]
    Wait Until Element Is Visible    ${DETAILS_BACK}

Product Details Should Show
    [Arguments]    ${name}    ${price}
    Element Text Should Be    ${DETAILS_NAME}     ${name}
    Element Text Should Be    ${DETAILS_PRICE}    ${price}

Go Back To Products
    Click Button    ${DETAILS_BACK}

Add Product To Cart From Details
    Click Button    ${DETAILS_ADD}
