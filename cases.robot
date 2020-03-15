*** Settings ***

Resource          resource.robot

*** Test Cases ***
Catch DailyDeal
    Open Browser To Login Page
    Input Username    ${VALID USER} 
    Input Password    ${VALID PASSWORD}
    Submit Credentials
    Catch First DailyDeal
    Open Basket
    Approve Basket
    Close Browser

    
Make A Search and Like A Comment
    Open Browser to Main Page
    Make A Search
    Select BrandJBL
    Select Price7501000
    Select ColorBlack
    Select Product
    Select ReviewTab
    Vote Yes
    Close Browser
