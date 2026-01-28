*** Settings ***
Resource   ../../resources/variables.robot
Resource   ../../resources/keywords_frontend.robot
Test Setup    Iniciar Chrome
Test Teardown    Close All Browsers

*** Test Cases ***
Validar login valido
    Fazer Login    ${EMAIL_VALIDO}    ${SENHA_VALIDA}
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_BEM_VINDO}

Validar login invalido
    Fazer Login    ${EMAIL_INVALIDO}    ${SENHA_INVALIDA}
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_PROBLEMA_LOGIN}

Validar tentativa de login sem e-mail
    Fazer Login    ${EMPTY}    ${SENHA_VALIDA}
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_EMAIL_OBRIGATORIO}

Validar tentativa de login sem senha
    Fazer Login    ${EMAIL_VALIDO}    ${EMPTY}
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_SENHA_OBRIGATORIA}

Validar tentativa de login sem e-mail e sem senha
    Fazer Login    ${EMPTY}    ${EMPTY}
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_EMAIL_OBRIGATORIO}
    Should Be Equal    ${alert}[1]    ${ALERT_SENHA_OBRIGATORIA}