*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource   variables.robot

*** Keywords ***
Criar Sessao
    [Arguments]    ${email}    ${password}    ${url}
    ${body}=    Create Dictionary
    ...    email=${email}
    ...    senha=${password}

    Create Session    api    ${url}
    RETURN    ${body}

Fazer Login
    [Arguments]    ${body}
    ${resp}=    POST On Session
    ...    api
    ...    /signin
    ...    json=${body}

    ${token}=    Set Variable    ${resp.json()}[token]
    Set Test Variable    ${TOKEN}    ${token}