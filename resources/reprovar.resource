*** Settings ***
Documentation       Camada de ações da funcionalidade Solicitações

Library             Browser
Resource            ./base.resource

*** Variables ***
&{REPROVAR}
#Primeira aprovação
...  btn_reprovar=//a[contains(.,'assignment_turned_inAprovar Solicitações')]
...  ap_01=(//td[@class='q-td text-center'])[2]
#Modal Visualização
...  visibility=(//button[contains(.,'visibility')])[1]
...  modal_visibity=//h6[contains(.,'Visualização')]
#Reprovar
...  btn_reprovar2=//button[contains(.,'REPROVAR')]
#Modal Confirmação
...  modal_confirmacao=//div[@class='q-card__section q-card__section--vert'][contains(.,'Confirmação')]
#Digitar Sim
...  btn_sim=//button[contains(.,'Sim')]
#Validar Snackbar
...  alert=//div[@class='q-notification__message col'][contains(.,'O motivo não pode ser vazio')]

*** Keywords ***
 Escolher a primeira aprovação disponível.
    Click    ${REPROVAR.btn_reprovar}
    Wait For Elements State     ${REPROVAR.ap_01}    visible    timeout=2 s
Validar se apareceu o modal “Visualização”.
    Click    ${REPROVAR.visibility}
    Click    ${REPROVAR.modal_visibity}
    Browser.Get Text    //h6[contains(text(),'Visualização')]    ==    Visualização    
Apertar reprovar.
    Click    ${REPROVAR.btn_reprovar2}

Validar se apareceu o modal “Confirmação”.
    Click    ${REPROVAR.modal_confirmacao}
    Browser.Get Text    ${REPROVAR.modal_confirmacao}    ==    Confirmação
Apertar “sim”, sem digitar nenhum motivo.
    Click    ${REPROVAR.btn_sim}
Validar se apareceu o snackbarcom o texto “O motivo não pode ser vazio”.
    Click    ${REPROVAR.alert}
    Browser.Get Text    ${REPROVAR.alert}    ==  O motivo não pode ser vazio