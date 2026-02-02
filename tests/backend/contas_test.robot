*** Settings ***
Resource   ../../resources/variables.robot
Resource   ../../resources/keywords_backend.robot
Test Setup    Limpar Variaveis Globais

*** Test Cases ***
Validar Adicionar Conta
    Fazer Login Valido
    Adicionar Conta
    Status Should Be    201    ${RESP}

Validar Alterar Conta
    Fazer Login Valido
    Adicionar Conta
    Alterar Conta
    Status Should Be    200    ${RESP}

Validar inserir conta com mesmo nome
    Fazer Login Valido
    Adicionar Conta    201
    Adicionar Conta    400    ${CONTA_NOME}
    Status Should Be    400    ${RESP}

Validar retornar contas
    Fazer Login Valido
    Retornar Contas
    Status Should Be    200    ${RESP}