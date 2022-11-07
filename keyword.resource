*** Settings ***
Documentation     This is a resource file, that can contain variables and keywords.
...               Keywords defined here can be used where this Keywords.resource in loaded.
Library     SeleniumLibrary


*** Variables ***

${SEARCH_BAR}    id:twotabsearchtextbox
${SEARCH_BUTTON}        id:nav-search-submit-button
${TITLE_RESULTS}        xpath://span[text()='RESULTS']
${INDEX_RESULT}    xpath://div[@data-index='3']
${IMG_RESULT}    xpath://img[@data-image-index='3']
${DROPDOWN_QTY}        id:a-autoid-0-announce
${VALUE_QTY_10}        id:quantity_9
${ADD_TO_CART}    id:add-to-cart-button

${CART_SIDE_PAGE}        xpath://a[@href='/gp/cart/view.html?ref_=ewc_gtc']
${CART_SIDE_PAGE_ADS}        id:attach-sidesheet-view-cart-button

${DELETE_CART}    xpath://input[@value="Delete"]

${TITLE_CART_STATUS}        xpath://h1[@class="a-spacing-mini a-spacing-top-base"]

*** Keywords ***
Open Amazon webpage
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window

Input Text in search bar
    [Arguments]    ${args1}
    Wait Until Element Is Visible       ${SEARCH_BAR}     30
    Input Text    ${SEARCH_BAR}   ${args1}

Click button search
    Click Element    ${SEARCH_BUTTON} 
    Wait Until Element Is Visible        ${TITLE_RESULTS} 
Select item list search
    Scroll Element Into View    ${INDEX_RESULT}
    Click Image    ${IMG_RESULT}
Add to cart with value 10
    Wait Until Element Is Visible    ${DROPDOWN_QTY}
    Click Element    ${DROPDOWN_QTY}
    Click Element       ${VALUE_QTY_10}
    Click Element    ${ADD_TO_CART}
Click cart to move cart detail page
    Sleep    10
    ${test}=     Get Element Count  ${CART_SIDE_PAGE}   
    Log To Console     ${test}  
    IF    ${test} > 0
        Click Element    ${CART_SIDE_PAGE}       
    ELSE  
        Click Element     ${CART_SIDE_PAGE_ADS} 
    END  
Delete item in cart page 
    Wait Until Element Is Visible    ${DELETE_CART}
    Click Element    ${DELETE_CART}  
Validate item its deleted 
    [Arguments]    ${args1}
    Wait Until Element Is Visible    ${TITLE_CART_STATUS} 
    ${title}=    Get Text    ${TITLE_CART_STATUS} 
    Should Be Equal As Strings    ${title}      ${args1}