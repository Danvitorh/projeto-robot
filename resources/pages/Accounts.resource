*** Settings ***
Documentation        Ações e elementos da página de clientes

Library        Browser

*** Keywords ***
User is logged in
    [Arguments]        ${email}

    ${element}    Set Variable        css=.logged-user     
    Wait For Elements State    ${element}     visible    10
    Get Text   ${element}    equal    ${email}