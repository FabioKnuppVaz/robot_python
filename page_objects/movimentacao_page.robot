*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ID_TIPO}    id=tipo
${ID_TRANSACAO}    id=data_transacao
${ID_DATA_PAGAMENTO}    id=data_pagamento
${ID_DESCRICAO}    id=descricao
${ID_INTERESSADO}    id=interessado
${ID_VALOR}    id=valor
${ID_CONTA}    id=conta

*** Keywords ***
select_tipo_da_movimentacao
    [Arguments]    ${tipo}
    Select From List By Label    ${ID_TIPO}    ${tipo}

set_input_data_da_movimentacao
    [Arguments]    ${data_transacao}
    Input text    ${ID_TRANSACAO}    ${data_transacao}

set_input_data_do_pagamento
    [Arguments]    ${data_pagamento}
    Input text    ${ID_DATA_PAGAMENTO}    ${data_pagamento}

set_input_descricao
    [Arguments]    ${descricao}
    Input text    ${ID_DESCRICAO}    ${descricao}

set_input_interessado
    [Arguments]    ${interessado}
    Input text    ${ID_INTERESSADO}    ${interessado}

set_input_valor
    [Arguments]    ${valor}
    Input text    ${ID_VALOR}    ${valor}

select_conta
    [Arguments]    ${conta}
    Select From List By Label    ${ID_CONTA}    ${conta}

click_radial_situacao
    [Arguments]    ${situacao}
    Click Element    id=status_${situacao}
