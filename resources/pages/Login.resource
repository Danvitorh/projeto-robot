*** Settings ***
Documentation        Ações e elementos da página de login

Library        Browser

*** Keywords ***
Go to login page
    Go To    http://localhost:3000/login

Submit login form
    [Arguments]        ${email}        ${password}

    Fill Text        css=input[name=email]        ${email}
    Fill Text        css=input[id=password]       ${password}
    Click            css=button >> text=Entrar

Toast should be
    [Arguments]      ${expected_text}

    Wait For Elements State    css=.Toastify__toast-body        visible        8
    Get Text    css=.Toastify__toast-body        equal          ${expected_text}
