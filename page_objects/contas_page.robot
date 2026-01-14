*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
click_btn_conta
    [Arguments]    ${NOME}
    Click Element    //td[text()='${NOME}']

click_btn_deletar_conta
    [Arguments]    ${NOME}
    Click Element    //td[text()='${NOME}']/following-sibling::td/a[contains(@href, 'remover')]

click_btn_alterar_conta
    [Arguments]    ${NOME}
    Click Element    //td[text()='${NOME}']/following-sibling::td/a[contains(@href, 'editar')]

verificar_conta_existente
    [Arguments]    ${NOME}
    ${existe}=    Run Keyword And Return Status    Page Should Contain Element    //td[text()='${NOME}']
    RETURN    ${existe}
