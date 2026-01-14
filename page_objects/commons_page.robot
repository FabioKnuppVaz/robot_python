*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${XPATH_SALVAR}    //button[text()='Salvar']

*** Keywords ***
click_btn_salvar
    Click Element    ${XPATH_SALVAR}