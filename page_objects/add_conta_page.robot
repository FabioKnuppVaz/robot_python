*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ID_NOME}    id=nome

*** Keywords ***
clear_input_conta
    Clear Element Text    ${ID_NOME}

set_input_conta
    [Arguments]    ${conta}
    Input text    ${ID_NOME}    ${conta}