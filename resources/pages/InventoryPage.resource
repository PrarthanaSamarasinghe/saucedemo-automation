*** Settings ***
Documentation    Page Object: the Products (inventory) page
Library    SeleniumLibrary
Library    Collections
Library    ../../libraries/SortHelper.py

*** Variables ***
${INV_TITLE}          css=.title
${CART_BADGE}         css=.shopping_cart_badge
${CART_LINK}          css=.shopping_cart_link
${SORT_DROPDOWN}      css=[data-test="product-sort-container"]
${PRODUCT_NAMES}      css=.inventory_item_name
${PRODUCT_PRICES}     css=.inventory_item_price


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

Sort Products By
    [Arguments]    ${option}
    Select From List By Value    ${SORT_DROPDOWN}    ${option}

Get Texts Of
    [Arguments]    ${locator}
    ${elements}=    Get WebElements    ${locator}
    ${texts}=       Create List
    FOR    ${element}    IN    @{elements}
        Append To List    ${texts}    ${element.text}
    END
    RETURN    ${texts}

Get Product Names
    ${names}=    Get Texts Of    ${PRODUCT_NAMES}
    RETURN    ${names}

 Get Product Prices
    ${prices}=     Get Texts Of         ${PRODUCT_PRICES}
    ${numbers}=    Prices To Numbers    ${prices}
    RETURN    ${numbers}