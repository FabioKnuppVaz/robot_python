*** Settings ***
Resource   ../../resources/variables.robot
Resource   ../../resources/keywords_frontend.robot
Test Setup    Iniciar Chrome
Test Teardown    Close All Browsers

*** Test Cases ***
Validar incluir movimentacao de receita paga
    Fazer Login    ${EMAIL_VALIDO}    ${SENHA_VALIDA}
    ${conta}=    FakerLibrary.Company
    Adicionar Conta    ${conta}
    ${data_movimentacao}    data_atual
    ${data_pagamento}    data_atual
    ${descricao}     FakerLibrary.Sentence    nb_words=3
    ${interessado}    gerar_nome
    ${valor}    gerar_valor
    Criar movimentacao    Despesa   ${data_movimentacao}     ${data_pagamento}    ${descricao}    ${interessado}    ${valor}    ${conta}    pendente
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_MOVIMENTACAO_ADICIONADA_COM_SUCESSO}

Validar incluir movimentacao de receita pendente
    Fazer Login    ${EMAIL_VALIDO}    ${SENHA_VALIDA}
    ${conta}=    FakerLibrary.Company
    Adicionar Conta    ${conta}
    ${data_movimentacao}    data_atual
    ${data_pagamento}    data_atual
    ${descricao}     FakerLibrary.Sentence    nb_words=3
    ${interessado}    gerar_nome
    ${valor}    gerar_valor
    Criar movimentacao    Despesa   ${data_movimentacao}     ${data_pagamento}    ${descricao}    ${interessado}    ${valor}    ${conta}    pendente
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_MOVIMENTACAO_ADICIONADA_COM_SUCESSO}

Validar incluir movimentacao de despesa paga
    Fazer Login    ${EMAIL_VALIDO}    ${SENHA_VALIDA}
    ${conta}=    FakerLibrary.Company
    Adicionar Conta    ${conta}
    ${data_movimentacao}    data_atual
    ${data_pagamento}    data_atual
    ${descricao}     FakerLibrary.Sentence    nb_words=3
    ${interessado}    gerar_nome
    ${valor}    gerar_valor
    Criar movimentacao    Despesa   ${data_movimentacao}     ${data_pagamento}    ${descricao}    ${interessado}    ${valor}    ${conta}    pendente
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_MOVIMENTACAO_ADICIONADA_COM_SUCESSO}

Validar incluir movimentacao de despesa pendente
    Fazer Login    ${EMAIL_VALIDO}    ${SENHA_VALIDA}
    ${conta}=    FakerLibrary.Company
    Adicionar Conta    ${conta}
    ${data_movimentacao}    data_atual
    ${data_pagamento}    data_atual
    ${descricao}     FakerLibrary.Sentence    nb_words=3
    ${interessado}    gerar_nome
    ${valor}    gerar_valor
    Criar movimentacao    Despesa   ${data_movimentacao}     ${data_pagamento}    ${descricao}    ${interessado}    ${valor}    ${conta}    pendente
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_MOVIMENTACAO_ADICIONADA_COM_SUCESSO}

Validar nao incluir movimentacao sem data de movimentacao
    Fazer Login    ${EMAIL_VALIDO}    ${SENHA_VALIDA}
    ${conta}=    FakerLibrary.Company
    Adicionar Conta    ${conta}
    ${data_pagamento}    data_atual
    ${descricao}     FakerLibrary.Sentence    nb_words=3
    ${interessado}    gerar_nome
    ${valor}    gerar_valor
    Criar movimentacao    Despesa   ${EMPTY}    ${data_pagamento}    ${descricao}    ${interessado}    ${valor}    ${conta}    pendente
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_DATA_MOVIMENTACAO_OBRIGATORIA}

Validar nao incluir movimentacao sem data do pagamento
    Fazer Login    ${EMAIL_VALIDO}    ${SENHA_VALIDA}
    ${conta}=    FakerLibrary.Company
    Adicionar Conta    ${conta}
    ${data_movimentacao}    data_atual
    ${descricao}     FakerLibrary.Sentence    nb_words=3
    ${interessado}    gerar_nome
    ${valor}    gerar_valor
    Criar movimentacao    Despesa   ${data_movimentacao}    ${EMPTY}    ${descricao}    ${interessado}    ${valor}    ${conta}    pendente
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_DATA_PAGAMENTO_OBRIGATORIA}

Validar nao incluir movimentacao sem descricao
    Fazer Login    ${EMAIL_VALIDO}    ${SENHA_VALIDA}
    ${conta}=    FakerLibrary.Company
    Adicionar Conta    ${conta}
    ${data_movimentacao}    data_atual
    ${data_pagamento}    data_atual
    ${interessado}    gerar_nome
    ${valor}    gerar_valor
    Criar movimentacao    Despesa   ${data_movimentacao}     ${data_pagamento}    ${EMPTY}    ${interessado}    ${valor}    ${conta}    pendente
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_DESCRICAO_OBRIGATORIA}

Validar nao incluir movimentacao sem interessado
    Fazer Login    ${EMAIL_VALIDO}    ${SENHA_VALIDA}
    ${conta}=    FakerLibrary.Company
    Adicionar Conta    ${conta}
    ${data_movimentacao}    data_atual
    ${data_pagamento}    data_atual
    ${descricao}     FakerLibrary.Sentence    nb_words=3
    ${valor}    gerar_valor
    Criar movimentacao    Despesa   ${data_movimentacao}     ${data_pagamento}    ${descricao}    ${EMPTY}    ${valor}    ${conta}    pendente
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_INTERESSADO_OBRIGATORIO}

Validar nao incluir movimentacao sem valor
    Fazer Login    ${EMAIL_VALIDO}    ${SENHA_VALIDA}
    ${conta}=    FakerLibrary.Company
    Adicionar Conta    ${conta}
    ${data_movimentacao}    data_atual
    ${data_pagamento}    data_atual
    ${descricao}     FakerLibrary.Sentence    nb_words=3
    ${interessado}    gerar_nome
    ${valor}    gerar_valor
    Criar movimentacao    Despesa   ${data_movimentacao}     ${data_pagamento}    ${descricao}    ${interessado}    ${EMPTY}    ${conta}    pendente
    ${alert}=    Capturar Alerts
    Should Contain    ${alert}[0]    ${ALERT_VALOR_OBRIGATORIO}
    Should Contain    ${alert}[0]    ${ALERT_VALOR_NUMERICO}