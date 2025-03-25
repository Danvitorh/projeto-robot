*** Settings ***
Documentation        Suite de testes de adesões de planos

Resource            ../resources/Base.resource

Test Setup           Start session
Test Teardown        Take Screenshot

*** Test Cases ***
Deve poder realizar uma nova adesão
    Go to login page
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com
    Go to Enrolls
    Go to Enroll form
    Select account   Daniel Silva    549.263.700-26

*** Keywords ***
Go to Enrolls    #ir para pagina de matricula/pagamento
    Click    css=a[href='/memberships']
    Wait For Elements State    css=h1 >> text=Matrículas        visible        5

Go to Enroll form        #vai pro formulario de matricula (preencher dados cartao)
    Click    css=a[href='/memberships/new']
    Wait For Elements State    css=h1 >> text=Nova matrícula        visible        5

Select account    #selecionar conta para preencher dados de cartao
    [Arguments]    ${name}        ${cpf}
    Fill Text            css=input[aria-label='select_account']    ${name} 
    Click                css=[data-testid='${cpf}']

