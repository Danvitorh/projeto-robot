*** Settings ***
Documentation        Teste para verificar Slogan da Smartbit
Library            Browser

*** Test Cases ***
Validando Slogan
    New Browser     browser=chromium        headless=False
    New Page        http://localhost:3000
    Get Text        css=.headline h2        equal        Sua Jornada Fitness Começa aqui!
    Sleep    5            