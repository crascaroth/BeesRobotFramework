*** Settings ***
Library    Collections
Library    SeleniumLibrary
Library    FakerLibrary       locale=pt_BR
Library    String
Library    BuiltIn 

*** Variables ***


*** Keywords ***

Close Website
    Close All Browsers

Given Client in page ${URL} with ${BROWSER}
    ${NAME}             FakerLibrary.Name
    ${EMAIL}            FakerLibrary.Email

    ${RANDOMNUMBER}           FakerLibrary.Random Int    min=1    max=99
    # Set Local Variable  ${RANDOMNUMBER}
    ${COMMENT}           FakerLibrary.Words     nb=${RANDOMNUMBER} 


    Set Suite Variable    ${NAME}
    Set Suite Variable    ${EMAIL} 
    Set Suite Variable    ${COMMENT} 

    Open Browser          ${URL}         ${BROWSER}    options=add_argument("--start-maximized")    
