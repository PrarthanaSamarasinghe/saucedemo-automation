*** Settings ***
Documentation     Page Object: Cart and Checkout pages.
Library           SeleniumLibrary
Library           ../../libraries/DataHelper.py

*** Variables ***
${PAGE_TITLE}           css=.title
${CART_LIST}            css=.cart_list
${CHECKOUT_BUTTON}      id=checkout
${FIRST_NAME}           id=first-name
${LAST_NAME}            id=last-name
${POSTAL_CODE}          id=postal-code
${CONTINUE_BUTTON}      id=continue
${FINISH_BUTTON}        id=finish
${COMPLETE_HEADER}      css=[data-test="complete-header"]

*** Keywords ***
Cart Should Contain Product
    [Arguments]    ${product_name}
    Wait Until Element Is Visible    ${CART_LIST}
    Element Should Contain           ${CART_LIST}    ${product_name}

Start Checkout
    Click Button    ${CHECKOUT_BUTTON}

Fill Customer Information
    [Arguments]    ${first}    ${last}    ${zip}
    Wait Until Element Is Visible    ${FIRST_NAME}
    Input Text      ${FIRST_NAME}     ${first}
    Input Text      ${LAST_NAME}      ${last}
    Input Text      ${POSTAL_CODE}    ${zip}
    Click Button    ${CONTINUE_BUTTON}

Finish Order
    Wait Until Element Is Visible    ${FINISH_BUTTON}
    Click Button    ${FINISH_BUTTON}

Order Should Be Complete
    Wait Until Element Is Visible    ${COMPLETE_HEADER}
    Element Text Should Be           ${COMPLETE_HEADER}    Thank you for your order!

Fill Customer Information With Random Data
    ${first}=    Generate First Name
    ${last}=     Generate Last Name
    ${zip}=      Generate Zip Code
    Log To Console    Customer: ${first} ${last} ${zip}
    Fill Customer Information    ${first}    ${last}    ${zip}