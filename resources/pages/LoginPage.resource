*** Settings ***
Documentation     Page Object: the Sauce Demo login page.
Library           SeleniumLibrary
Variables         ../../variables/config.py

*** Variables ***
${LOGIN_USERNAME}     id=user-name
${LOGIN_PASSWORD}     id=password
${LOGIN_BUTTON}       id=login-button
${LOGIN_ERROR}        css=[data-test="error"]
${CHROMEDRIVER}       ${EXECDIR}/drivers/chromedriver.exe

*** Keywords ***
Open Sauce Demo
    IF    $CHROMEDRIVER
        Open Browser    ${URL}    ${BROWSER}    options=add_argument("--guest")    service=executable_path=r'${CHROMEDRIVER}'
    ELSE
        Open Browser    ${URL}    ${BROWSER}    options=add_argument("--guest")
    END

Login As
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${LOGIN_USERNAME}
    Input Text        ${LOGIN_USERNAME}    ${username}
    Input Password    ${LOGIN_PASSWORD}    ${password}
    Click Button      ${LOGIN_BUTTON}

Login Error Should Be
    [Arguments]    ${expected_message}
    Wait Until Element Is Visible    ${LOGIN_ERROR}
    Element Text Should Be           ${LOGIN_ERROR}    ${expected_message}

Login Should Succeed
    Wait Until Element Is Visible    css=.title
    Element Text Should Be           css=.title    Products

Login Page Should Be Open
    Wait Until Element Is Visible    ${LOGIN_BUTTON}