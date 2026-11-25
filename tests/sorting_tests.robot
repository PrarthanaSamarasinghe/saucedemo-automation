*** Settings ***
Documentation     Sorting tests on the Products page (data-driven).
Resource          ../resources/pages/LoginPage.resource
Resource          ../resources/pages/InventoryPage.resource
Test Setup        Open And Log In
Test Teardown     Close Browser
Test Template     Products Should Be Sorted After Choosing
Test Tags         sorting

*** Test Cases ***              OPTION    FIELD     ORDER
Sort By Name A To Z             az        names     asc
Sort By Name Z To A             za        names     desc
Sort By Price Low To High       lohi      prices    asc
Sort By Price High To Low       hilo      prices    desc

*** Keywords ***
Products Should Be Sorted After Choosing
    [Arguments]    ${option}    ${field}    ${order}
    Sort Products By    ${option}
    IF    '${field}' == 'names'
        ${values}=    Get Product Names
    ELSE
        ${values}=    Get Product Prices
    END
    Should Be Sorted    ${values}    ${order}

Open And Log In
    Open Sauce Demo
    Login As    ${VALID_USER}    ${VALID_PASSWORD}
    Inventory Page Should Be Open