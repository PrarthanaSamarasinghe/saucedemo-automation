*** Settings ***
Documentation    Page Object: the Products (inventory) page
Library    SeleniumLibrary

*** Variables ***
${INV_TITLE}          css=.title
${CART_BADGE}         css=.shopping_cart_badge
${CART_LINK}          css=.shopping_cart_link

*** Keywords ***
Inventory Page Should Be Open
    Wait Until Element Is Visible    ${INV_TITLE}
    Element Text Should Be           ${INV_TITLE}    Products

Add Product To Cart
    [Arguments]    ${product_id}
    Click Button    id=add-to-cart-${product_id}

Remove Product From Cart
    [Arguments]    ${product_id}
    Click Button    id=remove-${product_id}

Cart Badge Should Show
    [Arguments]    ${count}
    Wait Until Element Is Visible    ${CART_BADGE}
    Element Text Should Be           ${CART_BADGE}    ${count}

Cart Badge Should Not Be Shown
    Wait Until Element Is Not Visible    ${CART_BADGE}

Open Cart
    Click Element    ${CART_LINK}