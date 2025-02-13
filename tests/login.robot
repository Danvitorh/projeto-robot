*** Settings ***
Documentation        Cenários de testes do login SAC

Resource            ../resources/Base.resource

Test Setup        Start session
Test Teardown     Take Screenshot

*** Test Cases ***
Deve logar como gestor de Academia
    Go to login page
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com

Nao deve logar com senha incorreta
    [Tags]    inv_pass
    Go to login page
    Submit login form    sac@smartbit.com    abc123
    Toast should be      As credenciais de acesso fornecidas são inválidas. Tente novamente!    
    
#Keywords para salvar o html do código em caso de um toast que some rapido da tela
#    Sleep    3
#   ${temp}    Get Page Source
#   Log      ${temp}

Nao deve logar com email nao cadastrado
    [Tags]    email_404
    Go to login page
    Submit login form    404@smartbit.com    abc123
    Toast should be      As credenciais de acesso fornecidas são inválidas. Tente novamente!    
