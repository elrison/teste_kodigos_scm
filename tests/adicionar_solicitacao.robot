*** Settings ***
Documentation       Suíte de testes de inserção de solicitação de compras

Resource            ../resources/base.resource

Test Setup          Start Browser
Test Teardown       Finish Browser

*** Test Cases ***
Adicionar uma nova solicitação de compras.
   Preencher a Filial-Kodigos.
   Preencher o centro de custo -Compras.
   Definir uma descrição.
   Adicionar um produto genérico.
   Salvar e validar se na listagem, o último item possui a data de hoje e a descrição definida.


   