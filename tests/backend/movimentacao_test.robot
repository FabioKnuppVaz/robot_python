*** Settings ***
Resource   ../../resources/variables.robot
Resource   ../../resources/keywords_backend.robot
Test Setup    Limpar Variaveis Globais

*** Test Cases ***
Validar Adicionar Movimentacao
    Fazer Login Valido
    Adicionar Conta
    Adicionar Movimentacao
    Status Should Be    201    ${RESP}
    Validar Campos da Movimentacao