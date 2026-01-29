*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    FakerLibrary
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
    RETURN    ${resp}

Adicionar Conta
    [Arguments]    ${nome}    ${token}
    ${body}=    Create Dictionary
    ...    nome=${nome}

    ${headers}=    Create Dictionary
    ...    Authorization=JWT ${token}

    ${resp}=    POST On Session
    ...    api
    ...    /contas
    ...    json=${body}
    ...    headers=${headers}
    RETURN    ${resp}