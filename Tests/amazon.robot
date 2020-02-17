*** Settings ***
Documentation               Test to put an item to the cart, on Amazon.com
Library                     SeleniumLibrary
Test Setup                  Begin Web Test
Test Teardown               End Web Test

*** Keywords ***
Begin Web Test
    Open Browser                about:blank                         chrome
    Maximize Browser Window
Go To Web Page
    Go To                       http://www.amazon.com
    Wait Until Page Contains    Your Amazon.com
Search For Item
    Input Text                  id:twotabsearchtextbox              cherry kc 6000 slim
    Click Button                xpath://*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains    results for "cherry kc 6000 slim"
Select Item
    Click On Link               xpath://*[@id="search"]/div[1]/div[2]/div/span[4]/div[1]/div[1]/div/span/div/div/span/a/div
Put Item In Cart
    Click Button                xpath://*[@id="add-to-cart-button"]
End Web Test
    Close Browser
*** Test Cases ***
User can access amazon.com
    [Tags]                      Test 1
    Go To Web Page
    Search For Item

User can select an item
    [Tags]                      Test 2
    Go To Web Page
    Search For Item
    Select Item
