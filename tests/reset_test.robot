*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/variables.robot
Resource   ../resources/keywords.robot
Test Setup    Iniciar Chrome
Test Teardown    Close All Browsers

*** Test Cases ***
Validar reset do sistema
    Fazer Login    ${EMAIL_VALIDO}    ${SENHA_VALIDA}
    Resetar Sistema
    ${alert}=    Capturar Alerts
    Should Be Equal    ${alert}[0]    ${ALERT_RESET}