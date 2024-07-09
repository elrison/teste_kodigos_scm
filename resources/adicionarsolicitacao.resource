*** Settings ***
Documentation       Camada de ações da funcionalidade Solicitações

Library             Browser
Resource            ./base.resource

*** Variables ***
&{SOLICITACAO}  
#Solicitações
...  btn_Solicitacoes=//a[contains(.,'descriptionSolicitação')]
...  btn_new_solicitacoes=//span[contains(.,'description')] 
...  seta=//div[@class='q-field__control-container col relative-position row no-wrap q-anchor--skip'][contains(.,'Filial')]
...  filial_kodigos=//span[contains(.,'01/01 - Instituto Kodigos')]
#Inserir Centro de Custo
...  centro_custo=//input[@aria-label='Centro de Custo']
...  compras_id=(//div[contains(@class,'section--main justify-center')])[9]
#Definir Descrição
...  set_descricao=(//div[@class='q-field__native row items-center'])[4]
...  descrica02=//div[@class='q-item__section column q-item__section--main justify-center'][contains(.,'SOLICITAÇÃO DE COMPRA - PEÇAS DE REPOSIÇÃO DE MÁQUINAS E EQUIPAMENTOS')]
#Inserir Justificatica
...  justificativa=//textarea[@aria-label='Justificativa/Projeto']
#Inserir Produto Generico
...  qtd=//input[@inputmode='decimal']
...  um=//input[@aria-label='UM']
...  polegadas=//div[@class='q-item__label'][contains(.,'PL - POLEGADAS')]
...  descricao_generico=//input[contains(@aria-label,'Descrição do produto genérico')]
...  btn_add=//button[contains(.,'Adicionar')]
...  btn_salvar=//button[contains(.,'SALVAR')]
#Validação de data e descrição
...  validar_descicao=//td[@class='text-center'][contains(.,'Produto Generico para inserção de dados.')]
*** Keywords ***
Preencher a Filial-Kodigos.   
    Click     ${SOLICITACAO.btn_Solicitacoes}
    Click     ${SOLICITACAO.btn_new_solicitacoes}
    Click     ${SOLICITACAO.seta}
    Click     ${SOLICITACAO.filial_kodigos}

Preencher o centro de custo -Compras.
    Click    ${SOLICITACAO.centro_custo}
    Click    ${SOLICITACAO.compras_id}

Definir uma descrição.
    Click  ${SOLICITACAO.set_descricao}
    Click  ${SOLICITACAO.descrica02}
#Adicionar Justificativa
    Click  ${SOLICITACAO.justificativa}
    Fill Text    ${SOLICITACAO.justificativa}    Produto a ser inserido para avaliação e produção!

Adicionar um produto genérico.
    Fill Text    ${SOLICITACAO.qtd}    5
    Click    ${SOLICITACAO.um}
    Click    ${SOLICITACAO.polegadas}
    Fill Text    ${SOLICITACAO.descricao_generico}    Produto Generico para inserção de dados.
    Click    ${SOLICITACAO.btn_add}
    
Salvar e validar se na listagem, o último item possui a data de hoje e a descrição definida.
    # Verificar a data atual e verifica se o elemento é a data atual do sistema.
    ${data_atual}    Get Current Date    result_format=%d/%m/%Y    # Captura a data atual no formato 'dd/mm/yyyy'
       
    #Aguarda que o elemento encontrado satisfaça a opção de estado.   
    Wait For Elements State     xpath=//td[contains(@class, 'q-td') and contains(@class, 'text-center') and text()='${data_atual}']

    ${texto_do_elemento}    Get Element    xpath=//td[contains(@class, 'q-td') and contains(@class, 'text-center') and text()='${data_atual}']
   
    Browser.Get Text  ${SOLICITACAO.validar_descicao}   ==  Produto Generico para inserção de dados.


    Click    ${SOLICITACAO.btn_salvar}
    Take Screenshot

    


