*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${SERVER}         hepsiburada.com
${BROWSER}        Firefox
${DELAY}          0
${VALID USER}     <REGISTERED_EMAIL_ADDRESS>
${VALID PASSWORD}    <REGISTERED_PASSWORD>
${LOGIN URL}      https://${SERVER}/uyelik/giris
${HOME PAGE}      https://${SERVER}
${TERM}        bluetooth kulaklık


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    
Input Username
    [Arguments]    ${username}
    Input Text    email   ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    class:btn-login-submit
    
Open Basket
    Wait Until Element Is Not Visible   id:notification   30
    Click Element    id:shoppingCart
    
Catch First DailyDeal
    Wait Until Page Contains Element    css:#staticTopBanner > img    30
    Execute JavaScript    window.scrollTo(0, 1600)
    Wait Until Page Contains Element    xpath://div[@id='dealoftheday_5']/div/div/div[2]/div/div/div/div/div[3]/div/div/a/div/div[2]/div/picture/img    30
    Click Element   xpath://div[@id='dealoftheday_5']/div/div/div[2]/div/div/div/div/div[3]/div/div/a/div/div[2]/div/picture/img
    Wait Until Page Contains Element    id:addToCart    30
    Click Element   id:addToCart
    
Approve Basket
    Wait Until Element Is Visible   css:.btn > .text    30
    Click Element   css:.btn > .text
    Wait Until Element Is Visible   css=.text   30
    
Open Browser to Main Page
    Open Browser    ${HOME PAGE}
    Maximize Browser Window

Make A Search
    Input Text  productSearch   ${TERM}
    Click Button    buttonProductSearch

Select BrandJBL
    Click Element   css:.unselected:nth-child(8) > label:nth-child(3)
    
Select Price7501000
    Click Element   css:.fiyat .unselected:nth-child(4) > label
    
Select ColorBlack
    Click Element   css:.renktipi .unselected:nth-child(1) > label
    
Select Product
    Click Element   css:.search-item:nth-child(2) .price:nth-child(3)
    
Select ReviewTab
    Click Element   id:productReviewsTab

Vote Yes
    Click Element   css:.ReviewCard-14zxO:nth-child(1) .ReviewCard-2vDJX > strong
