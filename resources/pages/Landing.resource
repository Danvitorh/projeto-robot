*** Settings ***
Documentation        Ações e Elementos da Landing Page

Library    Browser

*** Keywords ***
Submit signup form
    [Arguments]        ${account}
        
    Get Text
    ...    css=#signup h2        
    ...    equal        
    ...    Faça seu cadastro e venha para a Smartbit!
    # ato
    Fill Text    id=name        ${account}[name]
    Fill Text    id=email       ${account}[email]
    Fill Text    id=cpf         ${account}[cpf]
    Click        css=button >> text=Cadastrar

