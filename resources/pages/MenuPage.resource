*** Settings ***
Documentation     Page Object: the burger (side) menu.
Library           SeleniumLibrary

*** Variables ***
${MENU_BUTTON}      id=react-burger-menu-btn
${MENU_LOGOUT}      id=logout_sidebar_link
${MENU_RESET}       id=reset_sidebar_link

*** Keywords ***
Open Menu
    Click Button                     ${MENU_BUTTON}
    Wait Until Element Is Visible    ${MENU_LOGOUT}

Logout
    Open Menu
    Click Element    ${MENU_LOGOUT}

Reset App State
    Open Menu
    Click Element    ${MENU_RESET}