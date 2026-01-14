*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Resource   ../resources/variables.robot
Resource   ../resources/keywords.robot
Test Setup    Iniciar Chrome
Test Teardown    Close All Browsers 

*** Test Cases ***
Validar adicionar conta
    Fazer Login    ${EMAIL_VALIDO}    ${SENHA_VALIDA}
    ${nome}=    FakerLibrary.Company
    Adicionar Conta    ${nome}
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_ADICIONAR}

Validar adicionar conta sem nome
    Fazer Login    ${EMAIL_VALIDO}    ${SENHA_VALIDA}
    Adicionar Conta    ${EMPTY}
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_INFORME_NOME_CONTA}

Validar adicionar conta com mesmo nome
    Fazer Login    ${EMAIL_VALIDO}    ${SENHA_VALIDA}
    ${nome}=    FakerLibrary.Company
    Adicionar Conta    ${nome}
    Adicionar Conta    ${nome}
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_CONTA_EXISTENTE}
