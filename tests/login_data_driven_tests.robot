*** Settings ***
Documentation     Negative login tests, data-driven with a Test Template.
Resource          ../resources/pages/LoginPage.resource
Test Setup        Open Sauce Demo
Test Teardown     Close Browser
Test Template     Login Should Fail With Message
Test Tags         login    negative    data-driven

*** Test Cases ***              USERNAME           PASSWORD          EXPECTED MESSAGE
Locked Out User                 locked_out_user    secret_sauce      Epic sadface: Sorry, this user has been locked out.
Wrong Password                  standard_user      wrong_password    Epic sadface: Username and password do not match any user in this service
Unknown User                    unknown_user       secret_sauce      Epic sadface: Username and password do not match any user in this service
Empty Username                  ${EMPTY}           secret_sauce      Epic sadface: Username is required
Empty Password                  standard_user      ${EMPTY}          Epic sadface: Password is required
Empty Username And Password     ${EMPTY}           ${EMPTY}          Epic sadface: Username is required

*** Keywords ***
Login Should Fail With Message
    [Arguments]    ${username}    ${password}    ${expected_message}
    Login As    ${username}    ${password}
    Login Error Should Be    ${expected_message}