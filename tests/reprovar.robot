*** Settings ***
Documentation       Suíte de testes de Reprovação sem motivo

Resource            ../resources/base.resource

Test Setup          Start Browser
Test Teardown       Finish Browser

*** Test Cases ***
Reprovar sem motivo
  Escolher a primeira aprovação disponível.
  Validar se apareceu o modal “Visualização”.
  Apertar reprovar.
  Validar se apareceu o modal “Confirmação”.
  Apertar “sim”, sem digitar nenhum motivo.
  Validar se apareceu o snackbarcom o texto “O motivo não pode ser vazio”.