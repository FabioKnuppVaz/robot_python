*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Resource   ../resources/variables.robot
Resource   ../resources/keywords.robot
Test Setup    Iniciar Chrome
Test Teardown    Close All Browsers

*** Test Cases ***
Validar remover movimentacao
    Fazer Login    ${EMAIL_VALIDO}    ${SENHA_VALIDA}
    ${conta}=    FakerLibrary.Company
    Adicionar Conta    ${conta}
    ${data_movimentacao}    data_atual
    ${data_pagamento}    data_atual
    ${descricao}     FakerLibrary.Sentence    nb_words=3
    ${interessado}    gerar_nome
    ${valor}    gerar_valor
    Criar movimentacao    Despesa   ${data_movimentacao}     ${data_pagamento}    ${descricao}    ${interessado}    ${valor}    ${conta}    pendente
    ${ano}    ano_atual
    ${mes}    mes_atual
    Remover Movimentacao    ${ano}    ${mes}    ${conta}
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_MOVIMENTACAO_REMOVIDA_COM_SUCESSO}