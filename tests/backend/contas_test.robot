*** Settings ***
Resource   ../../resources/variables.robot
Resource   ../../resources/keywords_backend.robot

*** Test Cases ***
Validar adicionar conta
    ${body}=    Criar Sessao    ${EMAIL_VALIDO}    ${SENHA_VALIDA}    ${BASE_URL}
    ${resp}=    Fazer Login    ${body}
    ${token}=    Set Variable    ${resp.json()}[token]
    ${nome}=    FakerLibrary.Company
    ${resp}=    Adicionar Conta    ${nome}    ${token}
    Status Should Be    201    ${resp}