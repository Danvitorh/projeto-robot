*** Settings ***
Documentation        Cenarios de testes de pré-cadastro de clientes


Resource        ../resources/Base.resource

Test Setup      Start session
Test Teardown   Take Screenshot

*** Test Cases ***
Deve iniciar o cadastro do cliente
    # preparação
    ${account}    Get Fake Account
    #ação
    Submit signup form    ${account}
    #verificação
    Verify welcome message

# Campo nome deve ser obrigatorio
#     [Tags]        required

#     ${account}        Create Dictionary
#     ...    name=${EMPTY}
#     ...    email=teste@gmail.com
#     ...    cpf=65338995034

#     Submit signup form    ${account}
#     Notice should be        Por favor informe o seu nome completo   

# Campo email deve ser obrigatorio
#     [Tags]        required
    
#     ${account}        Create Dictionary
#     ...    name=joaozinho teste
#     ...    email=${EMPTY}
#     ...    cpf=65338995034

#     Submit signup form    ${account}
#     Notice should be        Por favor, informe o seu melhor e-mail 
    
# Campo cpf deve ser obrigatorio
#     [Tags]        required

#     ${account}        Create Dictionary
#     ...    name=joao teste123
#     ...    email=teste@gmail.com
#     ...    cpf=${EMPTY}

#     Submit signup form    ${account}
#     Notice should be        Por favor, informe o seu CPF
    
# Email no formato invalido
#     [Tags]        ctinv

#     ${account}        Create Dictionary
#     ...    name=joao teste123
#     ...    email=teste!gmail.com
#     ...    cpf=975.392.980-30

#     Submit signup form    ${account}
#     Notice should be        Oops! O email informado é inválido
    
# Email no formato invalido estrutura faltando .com
#     [Tags]        ctinv

#     ${account}        Create Dictionary
#     ...    name=joao teste123
#     ...    email=teste@gmail
#     ...    cpf=667.345.130-09

#     Submit signup form    ${account}
#     Notice should be        Oops! O email informado é inválido
    
# CPF no formato invalido
#     [Tags]        ctinv

#     ${account}        Create Dictionary
#     ...    name=joao teste123
#     ...    email=teste@gmail.com
#     ...    cpf=214.521.490-9a

#     Submit signup form    ${account}
#     Notice should be        Oops! O CPF informado é inválido
    
# CPF no formato invalido faltando digito
#     [Tags]        ctinv

#     ${account}        Create Dictionary
#     ...    name=joao teste123
#     ...    email=teste@gmail.com
#     ...    cpf=214.521.490

#     Submit signup form    ${account}
#     Notice should be        Oops! O CPF informado é inválido               

Tentativa de pré cadastro

    [Template]        Attempt signup
    ${EMPTY}         teste@gmail.com    65338995034       Por favor informe o seu nome completo 
    joaozinho teste    ${EMPTY}         65338995034       Por favor, informe o seu melhor e-mail
    anac teste123    teste@gmail.com     ${EMPTY}         Oops! O CPF informado é inválido
    joao teste123    teste!gmail.com    975.392.980-30    Oops! O email informado é inválido
    joao teste123    teste@gmail        667.345.130-09    Oops! O email informado é inválido
    joao teste123    teste@gmail.com    214.521.490-9a    Oops! O CPF informado é inválido
    joao teste123    teste@gmail.com    214.521.490       Oops! O CPF informado é inválido

*** Keywords ***

Attempt signup
    [Arguments]        ${name}    ${email}   ${cpf}    ${output_message}

    ${account}        Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    cpf= ${cpf}

    Submit signup form    ${account}
    Notice should be        ${output_message} 