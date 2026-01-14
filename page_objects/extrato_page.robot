*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${XPATH_BUSCAR}    //input[@type='submit']
${ID_MES}    id=mes
${ID_ANO}    id=ano

*** Keywords ***
select_mes
    [Arguments]    ${mes}
    Select From List By Label    ${ID_MES}    ${mes}

select_ano
    [Arguments]    ${ano}
    Select From List By Label    ${ID_ANO}    ${ano}

click_btn_buscar
    Click Button    ${XPATH_BUSCAR}

click_btn_remover_conta
    [Arguments]    ${NOME}
    Click Link    //td[text()='${NOME}']/parent::tr/td/a