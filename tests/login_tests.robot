*** Settings ***
Documentation     Login tests using the Page Object pattern.
Resource          ../resources/pages/LoginPage.resource
Test Setup        Open Sauce Demo
Test Teardown     Close Browser
Test Tags    login

*** Test Cases ***
Valid User Can Log In
    [Tags]    smoke
    Login As    standard_user    secret_sauce
    Login Should Succeed

Locked Out User Sees An Error
    [Tags]    negative
    Login As    locked_out_user    secret_sauce
    Login Error Should Be    Epic sadface: Sorry, this user has been locked out.

Wrong Password Shows An Error
    [Tags]    negative
    Login As    standard_user    wrong_password
    Login Error Should Be    Epic sadface: Username and password do not match any user in this service

Empty Username Shows An Error
    [Tags]    negative
    Login As    ${EMPTY}    secret_sauce
    Login Error Should Be    Epic sadface: Username is required

Empty Password Shows An Error
    [Tags]    negative
    Login As    standard_user    ${EMPTY}
    Login Error Should Be    Epic sadface: Password is required

Empty Username And Password Shows An Error
    [Tags]    negative
    Login As    ${EMPTY}    ${EMPTY}
    Login Error Should Be    Epic sadface: Username is required

Unknown User Shows An Error
    [Tags]    negative
    Login As    unknown_user    secret_sauce
    Login Error Should Be    Epic sadface: Username and password do not match any user in this service