*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    FakerLibrary
Library    ../libraries/date_time_lib.py
Library    ../libraries/random_values_lib.py
Resource   variables.robot

*** Keywords ***
Limpar Variaveis Globais
    Set Global Variable    ${TOKEN}       NONE
    Set Global Variable    ${BODY}    NONE
    Set Global Variable    ${RESP}    NONE
    Set Global Variable    ${CONTA_ID}    NONE
    Set Global Variable    ${CONTA_NOME}    NONE

Criar Sessao
    ${body}=    Create Dictionary
    ...    email=${EMAIL_VALIDO}
    ...    senha=${SENHA_VALIDA}

    Create Session    api    ${BASE_URL}
    Set Global Variable    ${BODY}    ${body}

Fazer Login
    ${resp}=    POST On Session
    ...    api
    ...    /signin
    ...    json=${BODY}

    Set Global Variable    ${TOKEN}    ${resp.json()}[token]
    Set Global Variable    ${RESP}    ${resp}

Fazer Login Valido
    Criar Sessao
    Fazer Login

Adicionar Conta
    [Arguments]    ${expected_status}=201    ${nome}=${None}

    IF    '${nome}' == '${None}'
        ${nome}=    FakerLibrary.Company
        Set Global Variable    ${CONTA_NOME}    ${nome}
    END

    ${body}=    Create Dictionary
    ...    nome=${nome}

    ${headers}=    Create Dictionary
    ...    Authorization=JWT ${TOKEN}

    ${resp}=    POST On Session
    ...    api
    ...    /contas
    ...    json=${body}
    ...    headers=${headers}
    ...    expected_status=${expected_status}

    IF    '${expected_status}' != '400'
        Set Global Variable    ${CONTA_ID}    ${resp.json()}[id]
    END

    Set Global Variable    ${RESP}    ${resp}

Alterar Conta
    ${nome}=    FakerLibrary.Company

    ${body}=    Create Dictionary
    ...    nome=${nome} Alterado

    ${headers}=    Create Dictionary
    ...    Authorization=JWT ${TOKEN}

    ${resp}=    PUT On Session
    ...    api
    ...    /contas/${CONTA_ID}
    ...    json=${body}
    ...    headers=${headers}

    Set Global Variable    ${RESP}    ${resp}

Retornar Contas
    [Arguments]    ${expected_status}=200

    ${headers}=    Create Dictionary
    ...    Authorization=JWT ${TOKEN}

    ${resp}=    Get On Session
    ...    api
    ...    /contas
    ...    headers=${headers}
    ...    expected_status=${expected_status}

    Set Global Variable    ${RESP}    ${resp}

Adicionar Movimentacao
    ${data_movimentacao}    data_atual
    ${data_pagamento}    data_atual
    ${descricao}     FakerLibrary.Sentence    nb_words=3
    ${interessado}    gerar_nome
    ${valor}    gerar_valor
    ${tipo}=    Set Variable    REC
    ${status}=    Set Variable    true

    ${body}=    Create Dictionary
    ...    conta_id=${CONTA_ID}
    ...    data_transacao=${data_movimentacao}
    ...    data_pagamento=${data_pagamento}
    ...    descricao=${descricao}
    ...    envolvido=${interessado}
    ...    valor=${valor}
    ...    status=${status}
    ...    tipo=${tipo}

    ${headers}=    Create Dictionary
    ...    Authorization=JWT ${TOKEN}

    ${resp}=    Post On Session
    ...    api
    ...    /transacoes
    ...    headers=${headers}
    ...    json=${body}

    Set Global Variable    ${RESP}    ${resp}

Validar Campos da Movimentacao
    ${json}=    Set Variable    ${RESP.json()}
    ${id_str}=    Evaluate    str(${json['id']})
    Should Match Regexp    ${id_str}    ^\\d+$
    Should Be True    ${json['status']}
    Should Be Equal    ${CONTA_ID}    ${json['conta_id']}
    Should Be Equal    REC    ${json['tipo']}