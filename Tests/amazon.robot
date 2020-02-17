*** Settings ***
Documentation               Test to put an item to the cart, on Amazon.com
Library                     SeleniumLibrary
Test Setup                  Begin Web Test
Test Teardown               End Web Test

*** Keywords ***
Begin Web Test
    Open Browser                about:blank                         chrome
    Set Selenium Speed          0.5 seconds
    Maximize Browser Window

Go To Web Page
    Go To                       http://www.amazon.com
    Wait Until Page Contains    Your Amazon.com

Search For Item
    Input Text                  id:twotabsearchtextbox              cherry kc 6000 slim
    Click Button                xpath://*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains    results for "cherry kc 6000 slim"

Select Item
    Click Link                  xpath://*[@id="search"]/div[1]/div[2]/div/span[4]/div[1]/div[1]/div/span/div/div/div[2]/h2/a

Put Item In Cart
    Click Button                xpath://*[@id="add-to-cart-button"]

Go To Cart
    Click Link                  //*[@id="nav-cart"]

Item Is In Cart
    Element Should Contain      xpath://*[@class="a-size-medium sc-product-title"]    Cherry Kc 6000 Slim Keyboard - Black

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

User can put item to cart
    [Tags]                      Test 3
    Go To Web Page
    Search For Item
    Select Item
    Put Item In Cart

The Item Is In The Cart
    [Tags]                      Test 4
    Go To Web Page
    Search For Item
    Select Item
    Put Item In Cart
    Go To Cart
    Item Is In Cart