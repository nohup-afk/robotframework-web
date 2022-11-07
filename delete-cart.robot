*** Settings ***
Documentation     A test suite for delete cart
...
...               Keywords are imported from the resource file
Library     SeleniumLibrary
Resource          keyword.resource


*** Variables ***
${LOGIN URL}    https://www.amazon.com/
${BROWSER}      Chrome
${item_search}    Computer
${value_text}    Your Amazon Cart is empty. 

*** Test Cases ***
Delete item in Cart
    Open Amazon webpage
    Input Text in search bar    ${item_search}
    Click button search
    Select item list search
    Add to cart with value 10
    Click cart to move cart detail page
    Delete item in cart page
    Validate item its deleted     ${value_text}
    [Teardown]    Close Browser



    
    
    