*** Settings ***
Documentation        Cenários de testes do login ${SPACE}

Resource            ../resources/Base.resource

Test Setup        Start session
Test Teardown     Take Screenshot


*** Test Cases ***
Deve logar como gestor de Academia
    Go to login page
    