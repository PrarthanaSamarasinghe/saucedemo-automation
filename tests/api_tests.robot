*** Settings ***
Documentation     API tests on JSONPlaceholder (a free practice API).
Resource          ../resources/api/PostsApi.resource
Suite Setup       Open API Session
Suite Teardown    Delete All Sessions
Test Tags         api

*** Test Cases ***
Get One Post Returns 200
    [Tags]    smoke
    ${response}=    Get Post    1
    Status Should Be    200    ${response}
    Should Be Equal As Integers    ${response.json()}[id]    1

Get Missing Post Returns 404
    ${response}=    Get Post    99999    expected_status=404
    Status Should Be    404    ${response}

Get One Album Returns 200
    ${response}=    Get Album    1
    Status Should Be    200    ${response}
    Should Be Equal As Integers    ${response.json()}[id]    1

Create A New Post Returns 201
    ${response}=    Create Post    My test post    Hello API
    Status Should Be    201    ${response}
    Should Be Equal    ${response.json()}[title]    My test post