*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Resource   ../resources/variables.robot
Resource   ../resources/keywords.robot
Test Setup    Iniciar Chrome
Test Teardown    Close All Browsers 

*** Test Cases ***
Validar conta cadastrada na lista
    Fazer Login    ${EMAIL_VALIDO}    ${SENHA_VALIDA}
    ${nome}=    FakerLibrary.Company
    Adicionar Conta    ${nome}
    ${status}=    Buscar Conta Por Nome    ${nome}
    Should Be True     ${status}

Validar deletar conta
    Fazer Login    ${EMAIL_VALIDO}    ${SENHA_VALIDA}
    ${nome}=    FakerLibrary.Company
    Adicionar Conta    ${nome}
    Deletar Conta Por Nome    ${nome}
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_CONTA_REMOVIDA}

Validar alterar nome da conta
    Fazer Login    ${EMAIL_VALIDO}    ${SENHA_VALIDA}
    ${nome}=    FakerLibrary.Company
    Adicionar Conta    ${nome}
    ${novo_nome}=    FakerLibrary.Company
    Alterar Conta Por Nome    ${nome}    ${novo_nome}
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_CONTA_ALTERADA}

Validar alterar nome da conta pelo mesmo nome
    Fazer Login    ${EMAIL_VALIDO}    ${SENHA_VALIDA}
    ${nome}=    FakerLibrary.Company
    Adicionar Conta    ${nome}
    Alterar Conta Por Nome    ${nome}    ${nome}
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_CONTA_ALTERADA}

Validar alterar nome da conta por nenhum
    Fazer Login    ${EMAIL_VALIDO}    ${SENHA_VALIDA}
    ${nome}=    FakerLibrary.Company
    Adicionar Conta    ${nome}
    Alterar Conta Por Nome    ${nome}    ${EMPTY}
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_INFORME_NOME_CONTA}