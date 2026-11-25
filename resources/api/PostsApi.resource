*** Settings ***
Documentation     API object: the /posts and /albums endpoints of JSONPlaceholder.
Library           RequestsLibrary
Library           Collections

*** Variables ***
${API_URL}        https://jsonplaceholder.typicode.com
${SESSION}        jsonplaceholder

*** Keywords ***
Open API Session
    Create Session    ${SESSION}    ${API_URL}    verify=True

Get Post
    [Arguments]    ${post_id}    ${expected_status}=200
    ${response}=    GET On Session    ${SESSION}    /posts/${post_id}    expected_status=${expected_status}
    RETURN    ${response}

Get Album
    [Arguments]    ${album_id}    ${expected_status}=200
    ${response}=    GET On Session    ${SESSION}    /albums/${album_id}    expected_status=${expected_status}
    RETURN    ${response}

Create Post
    [Arguments]    ${title}    ${body}    ${user_id}=1
    ${data}=        Create Dictionary    title=${title}    body=${body}    userId=${user_id}
    ${response}=    POST On Session    ${SESSION}    /posts    json=${data}
    RETURN    ${response}