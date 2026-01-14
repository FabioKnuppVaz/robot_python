*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${XPATH_CONTAS}    //a[contains(text(),'Contas')]
${XPATH_ADICIONAR}    //a[contains(text(),'Adicionar')]
${XPATH_LISTAR}    //a[contains(text(),'Listar')]
${XPATH_CRIAR_MOVIMENTACAO}    //a[contains(text(),'Criar Movimentação')]
${XPATH_RESUMO_MENSAL}    //a[contains(text(),'Resumo Mensal')]

*** Keywords ***
click_btn_contas
    Wait Until Element Is Visible    ${XPATH_CONTAS}    timeout=5s
    Click Element   ${XPATH_CONTAS}

click_btn_adicionar
    Wait Until Element Is Visible    ${XPATH_ADICIONAR}    timeout=5s
    Click Element    ${XPATH_ADICIONAR} 

click_btn_listar
    Wait Until Element Is Visible    ${XPATH_LISTAR}    timeout=5s
    Click Element    ${XPATH_LISTAR}

click_btn_criar_movimentacao
    Wait Until Element Is Visible    ${XPATH_CRIAR_MOVIMENTACAO}    timeout=5s
    Click Element    ${XPATH_CRIAR_MOVIMENTACAO}

click_btn_resumo_mensal
    Wait Until Element Is Visible    ${XPATH_RESUMO_MENSAL}    timeout=5s
    Click Element    ${XPATH_RESUMO_MENSAL}