*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    Collections
Library    ../libraries/date_time_lib.py
Library    ../libraries/random_values_lib.py
Resource   variables.robot
Resource   ../page_objects/login_page.robot
Resource   ../page_objects/alert_page.robot
Resource   ../page_objects/nav_bar_page.robot
Resource   ../page_objects/add_conta_page.robot
Resource   ../page_objects/contas_page.robot
Resource   ../page_objects/extrato_page.robot
Resource   ../page_objects/movimentacao_page.robot
Resource   ../page_objects/commons_page.robot

*** Keywords ***
Iniciar Chrome
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fazer Login
    [Arguments]    ${email}    ${password}
    set_input_email    ${email}
    set_input_senha    ${password}
    click_btn_entrar

Capturar Alerts
    @{lista_alerts}=    get_text_alerts
    RETURN    @{lista_alerts}

Resetar Sistema
    wait_alerts
    click_btn_reset

Adicionar Conta
    [Arguments]    ${conta}
    wait_alerts
    click_btn_contas
    click_btn_adicionar
    set_input_conta    ${conta}
    click_btn_salvar

Buscar Conta Por Nome
    [Arguments]    ${conta}
    click_btn_contas
    click_btn_listar
    ${status}    verificar_conta_existente    ${conta}
    RETURN    ${status}

Deletar Conta Por Nome
    [Arguments]    ${conta}
    click_btn_contas
    click_btn_listar
    click_btn_deletar_conta    ${conta}

Alterar Conta Por Nome
    [Arguments]    ${nome}    ${novo_nome}
    click_btn_contas
    click_btn_listar
    click_btn_alterar_conta    ${nome}
    clear_input_conta
    set_input_conta    ${novo_nome}
    click_btn_salvar

Criar movimentacao
    [Arguments]    ${tipo}    ${data_movimentacao}    ${data_pagamento}    ${descricao}    ${interessado}    ${valor}    ${conta}    ${situacao}
    click_btn_criar_movimentacao
    select_tipo_da_movimentacao    ${tipo}
    set_input_data_da_movimentacao    ${data_movimentacao}
    set_input_data_do_pagamento    ${data_pagamento}
    set_input_descricao    ${descricao}
    set_input_interessado    ${interessado}
    set_input_valor    ${valor}
    select_conta    ${conta}
    click_radial_situacao    ${situacao}
    click_btn_salvar

Remover Movimentacao
    [Arguments]    ${ano}    ${mes}    ${conta}
    click_btn_resumo_mensal
    select_ano    ${ano}
    select_mes    ${mes}
    click_btn_buscar
    click_btn_remover_conta    ${conta}