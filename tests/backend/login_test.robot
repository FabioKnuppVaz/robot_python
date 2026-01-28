*** Settings ***
Resource   ../../resources/variables.robot
Resource   ../../resources/keywords_backend.robot

*** Test Cases ***
Login Simples
    ${body}=    Criar Sessao    ${EMAIL_VALIDO}    ${SENHA_VALIDA}    ${BASE_URL}
    ${resp}=    Fazer Login    ${body}
    Status Should Be    200    ${resp}