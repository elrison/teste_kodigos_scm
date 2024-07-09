*** Settings ***
Documentation       Aqui estão sendo chamadas os tests cases e o browser.

Library             Browser
Library             SeleniumLibrary
Library             DateTime

Resource            ../resources/adicionarsolicitacao.resource
Resource            ../resources/reprovar.resource

*** Variables ***
${BASE_URL}         https://app.kodigos.com.br:63995/scm/front/  
${BROWSER}          chromium
${IS_HEADLESS}      False




*** Keywords ***
Start Browser
    New Browser    browser=${BROWSER}    headless=${IS_HEADLESS}
    New Page       ${BASE_URL}
    [Setup]  Set Browser Timeout  30000

Finish Browser
    Take Screenshot    fullPage=true


