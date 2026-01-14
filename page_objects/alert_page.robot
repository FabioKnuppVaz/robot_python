*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${XPATH_ALERT}    //div[contains(@class, 'alert')]

*** Keywords ***
wait_alerts
    Wait Until Element Is Visible    ${XPATH_ALERT}    timeout=5s

get_text_alerts
    @{lista_alerts}=    Create List

    wait_alerts
    ${elementos_alerta}=    Get WebElements    ${XPATH_ALERT}
    FOR    ${elemento}    IN    @{elementos_alerta}
        ${texto}=    Get Text    ${elemento}
        Append To List    ${lista_alerts}    ${texto}
    END

    RETURN    @{lista_alerts}