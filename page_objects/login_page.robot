*** Variables ***
${XPATH_RESET}    //a[text()='reset']
${XPATH_ENTRAR}    //button[text()='Entrar']
${ID_EMAIL}    id=email
${ID_SENHA}    id=senha

*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
set_input_email
    [Arguments]    ${email}
    Input Text    ${ID_EMAIL}    ${email}

set_input_senha
    [Arguments]    ${senha}
    Input text    ${ID_SENHA}    ${senha}

click_btn_entrar
    Click Element    ${XPATH_ENTRAR}

click_btn_reset
    Wait Until Element Is Visible    ${XPATH_RESET}    timeout=5s
    ${btn_reset}=    Get WebElement    ${XPATH_RESET}
    Click Element    ${btn_reset}