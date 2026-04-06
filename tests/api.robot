*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${API_BASE_URL}    http://127.0.0.1:5000

*** Test Cases ***
API Health Check
    [Tags]    smoke    regression    api
    Create Session    local_api    ${API_BASE_URL}
    ${response}=    GET On Session    local_api    /health
    Status Should Be    200    ${response}
    ${data}=    Set Variable    ${response.json()}
    Dictionary Should Contain Item    ${data}    status    ok

Get Posts List
    [Tags]    regression    api
    Create Session    local_api    ${API_BASE_URL}
    ${response}=    GET On Session    local_api    /posts
    Status Should Be    200    ${response}
    ${data}=    Set Variable    ${response.json()}
    Length Should Be    ${data}    2

Get Single Post
    [Tags]    regression    api
    Create Session    local_api    ${API_BASE_URL}
    ${response}=    GET On Session    local_api    /posts/1
    Status Should Be    200    ${response}
    ${data}=    Set Variable    ${response.json()}
    Should Be Equal As Integers    ${data}[id]    1
    Dictionary Should Contain Key    ${data}    title

Create New Post
    [Tags]    regression    api
    Create Session    local_api    ${API_BASE_URL}
    &{payload}=    Create Dictionary    title=Robot Framework API Test    category=automation
    ${response}=    POST On Session    local_api    /posts    json=${payload}
    Status Should Be    201    ${response}
    ${data}=    Set Variable    ${response.json()}
    Dictionary Should Contain Item    ${data}    title    Robot Framework API Test
    Dictionary Should Contain Item    ${data}    category    automation
    Should Be Equal As Integers    ${data}[id]    3