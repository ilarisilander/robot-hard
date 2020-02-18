*** Settings ***
Documentation                           Amazon.com User Experience Test
Library                                 SeleniumLibrary
Test Setup                              Begin Web Test
Test Teardown                           End Web Test

*** Keywords ***
Begin Web Test
    Open Browser                        about:blank                 chrome
    Maximize Browser Window
    Set Selenium Speed                  0.5 seconds

Go To Web Page
    Go To                               http://www.amazon.com
    Wait Until Page Contains            Your Amazon.com

Search For Item
    [Arguments]                         ${search_term}
    Input Text                          id:twotabsearchtextbox      ${search_term}
    Click Button                        xpath://*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains            results for "${search_term}"

Select Item
    [Arguments]                         ${item_link}
    Click Link                          ${item_link}

Put Item In Cart
    Click Button                        xpath://*[@id="add-to-cart-button"]

Go To Cart
    Click Link                          //*[@id="nav-cart"]

Item Is In Cart
    [Arguments]                         ${item_name}
    Element Should Contain              xpath://*[@class="a-size-medium sc-product-title"]    ${item_name}

Go To Category Section
    Click Element                       xpath://*[@id="gw-layout"]/div[1]/div[1]/div/div[2]/div[1]/div[1]/a

Works With Alexa Unchecked
    Wait Until Element Is Visible       xpath://*[@id="leftNav"]/ul[2]/div/li[2]/span/span/div/label/input
    Checkbox Should Not Be Selected     xpath://*[@id="leftNav"]/ul[2]/div/li[2]/span/span/div/label/input

Click On Checkbox
    Select Checkbox                     xpath://*[@id="leftNav"]/ul[2]/div/li[2]/span/span/div/label/input

Works With Alexa Checked
    Wait Until Element Is Visible       xpath://*[@id="p_n_amazon_certified/16741513011"]/span/a/div/label/input
    Checkbox Should Be Selected         xpath://*[@id="p_n_amazon_certified/16741513011"]/span/a/div/label/input

web page has loaded
    Go To Web Page

user has typed ferrari 458
    Input Text                          id:twotabsearchtextbox      ferrari 458

user has pressed the submit button
    Click Button                        xpath://*[@id="nav-search"]/form/div[2]/div/input

there should be a ferrari 458 displayed
    Wait Until Page Contains            results for "ferrari 458"

Click On Todays Deals
    Click Element                       xpath://*[@id="nav-xshop"]/a

Verify Title
    Element Should Contain              xpath://*[@id="fst-hybrid-dynamic-h1"]/div/h1/b     Deals and Promotions

Select Nine Items
    Select From List By Value           name:quantity   9

Contains Eight Items
    Element Should Contain              xpath://*[@name="quantity"]    8

End Web Test
    Close Browser

*** Test Cases ***
The Item Is In The Cart
    [Tags]                      Test 1
    Go To Web Page
    Search For Item                     cherry kc 6000 slim
    Select Item                         xpath://*[@id="search"]/div[1]/div[2]/div/span[4]/div[1]/div[1]/div/span/div/div/div[2]/h2/a
    Put Item In Cart
    Go To Cart
    Item Is In Cart                     Cherry Kc 6000 Slim Keyboard - Black

Works With Alexa Checked
    [Tags]                      Test 2
    Go To Web Page
    Go To Category Section
    Works With Alexa Unchecked
    Click On Checkbox
    Works WIth Alexa Checked

User Can Find Ferrari 458
    [Documentation]     Gherkins syntax
    [Tags]                      Test 3
    Given web page has loaded
    And user has typed ferrari 458
    When user has pressed the submit button
    Then there should be a ferrari 458 displayed

Verify Deals And Promotions Title
    [Tags]                      Test 4
    Go To Web Page
    Click On Todays Deals
    Verify Title

Order More Than Is In Stock
    [Tags]                      Test 5
    Go To Web Page
    Search For Item             Ferrari 458 Italia Red 1/24 by Bburago 26003
    Select Item                 xpath://*[@id="search"]/div[1]/div[2]/div/span[4]/div[1]/div[1]/div/span/div/div/div[2]/h2/a
    Put Item In Cart
    Go To Cart
    Item Is In Cart             Ferrari 458 Italia Red 1/24 by Bburago 26003
    Select Nine Items
    Contains Eight Items



