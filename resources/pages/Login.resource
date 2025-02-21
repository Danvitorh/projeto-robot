*** Settings ***
Documentation        Ações e elementos da página de login

Library        Browser
Resource    components/BoxNotice.resource

*** Keywords ***
Go to login page
    Go To    http://localhost:3000/login

Submit login form
    [Arguments]        ${email}        ${password}

    Fill Text        css=input[name=email]        ${email}
    Fill Text        css=input[id=password]       ${password}
    Click            css=button >> text=Entrar
