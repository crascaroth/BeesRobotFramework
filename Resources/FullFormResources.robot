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
    ${EXPERIENCE}       FakerLibrary.Random Int    min=1    max=6

    ${RANDOMNUMBER}      FakerLibrary.Random Int    min=1    max=99
    ${COMMENT}           FakerLibrary.Words     nb=${RANDOMNUMBER} 


    Set Suite Variable    ${NAME}
    Set Suite Variable    ${EMAIL}
    Set Suite Variable    ${EXPERIENCE} 
    Set Suite Variable    ${COMMENT} 

    Open Browser          ${URL}         ${BROWSER}    options=add_argument("--start-maximized")    


When Type Everything Correctly
    Set Local Variable  ${NAME_LOCATION}        css=#g2599-name
    Set Local Variable  ${EMAIL_LOCATION}       css=#g2599-email
    Set Local Variable  ${EXPERIENCE_LOCATION}  css=#g2599-experienceinyears
    Set Local Variable  ${COMMENT_LOCATION}     css=#contact-form-comment-g2599-comment
    
    Set Local Variable  ${FUNCTIONAL_TESTING_LOCATION}   css=#contact-form-2599 > form > div.grunion-field-wrap.grunion-field-checkbox-multiple-wrap > label:nth-child(2) > input
    Set Local Variable  ${AUTOMATION_TESTING_LOCATION}   css=#contact-form-2599 > form > div.grunion-field-wrap.grunion-field-checkbox-multiple-wrap > label:nth-child(4) > input
    Set Local Variable  ${MANUAL_TESTING_LOCATION}       css=#contact-form-2599 > form > div.grunion-field-wrap.grunion-field-checkbox-multiple-wrap > label:nth-child(6) > input

    Set Local Variable  ${GRADUATE_LOCATION}             css=#contact-form-2599 > form > div.grunion-field-wrap.grunion-field-radio-wrap > label:nth-child(2) > input
    Set Local Variable  ${UNGRADUATE_LOCATION}           css=#contact-form-2599 > form > div.grunion-field-wrap.grunion-field-radio-wrap > label:nth-child(4) > input
    Set Local Variable  ${POST_GRADUATE_LOCATION}        css=#contact-form-2599 > form > div.grunion-field-wrap.grunion-field-radio-wrap > label:nth-child(6) > input
    
    


    Scroll Element Into View       ${NAME_LOCATION} 
    Wait Until Element Is Visible  ${NAME_LOCATION} 
    Input Text                     ${NAME_LOCATION}            ${NAME}    
    

    Scroll Element Into View       ${EMAIL_LOCATION} 
    Wait Until Element Is Visible  ${EMAIL_LOCATION} 
    Input Text                     ${EMAIL_LOCATION}            ${EMAIL}    
    




    Scroll Element Into View       ${EXPERIENCE_LOCATION}
    Wait Until Element Is Visible  ${EXPERIENCE_LOCATION} 
    IF        ${EXPERIENCE} == 1
    Select From List By Value   ${EXPERIENCE_LOCATION}   0-1
    List Selection Should Be    ${EXPERIENCE_LOCATION}   0-1
    ELSE IF   ${EXPERIENCE} == 2
    Select From List By Value   ${EXPERIENCE_LOCATION}   1-3
    List Selection Should Be    ${EXPERIENCE_LOCATION}   1-3
    ELSE IF   ${EXPERIENCE} == 3
    Select From List By Value   ${EXPERIENCE_LOCATION}   3-5
    List Selection Should Be    ${EXPERIENCE_LOCATION}   3-5
    ELSE IF   ${EXPERIENCE} == 4
    Select From List By Value   ${EXPERIENCE_LOCATION}   5-7
    List Selection Should Be    ${EXPERIENCE_LOCATION}   5-7
    ELSE IF   ${EXPERIENCE} == 5
    Select From List By Value   ${EXPERIENCE_LOCATION}   7-10
    List Selection Should Be    ${EXPERIENCE_LOCATION}   7-10
    ELSE IF   ${EXPERIENCE} == 6
    Select From List By Value   ${EXPERIENCE_LOCATION}   10+
    List Selection Should Be    ${EXPERIENCE_LOCATION}   10+
    END
    
   
    
   
    ${RANDOMNUMBER}      FakerLibrary.Random Int    min=0    max=1
    Scroll Element Into View    ${FUNCTIONAL_TESTING_LOCATION}
    IF                          ${RANDOMNUMBER} == 1
        Select Checkbox         ${FUNCTIONAL_TESTING_LOCATION}
    END

    ${RANDOMNUMBER}      FakerLibrary.Random Int    min=0    max=1
    Scroll Element Into View    ${AUTOMATION_TESTING_LOCATION}
    IF                          ${RANDOMNUMBER} == 1
        Select Checkbox         ${AUTOMATION_TESTING_LOCATION}
    END

    ${RANDOMNUMBER}      FakerLibrary.Random Int    min=0    max=1
    Scroll Element Into View    ${MANUAL_TESTING_LOCATION}
    IF                          ${RANDOMNUMBER} == 1
        Select Checkbox         ${MANUAL_TESTING_LOCATION}
    END


    ${RANDOMNUMBER}      FakerLibrary.Random Int    min=1    max=3


    IF                          ${RANDOMNUMBER} == 1
        Scroll Element Into View  ${GRADUATE_LOCATION}
        Click Element         ${GRADUATE_LOCATION}
    ELSE IF                     ${RANDOMNUMBER} == 2
        Scroll Element Into View  ${UNGRADUATE_LOCATION}
        Click Element        ${UNGRADUATE_LOCATION}
    ELSE IF                     ${RANDOMNUMBER} == 3
        Scroll Element Into View  ${POST_GRADUATE_LOCATION}
        Click Element        ${POST_GRADUATE_LOCATION}
    END
    
    Scroll Element Into View       ${COMMENT_LOCATION} 
    Wait Until Element Is Visible  ${COMMENT_LOCATION} 
    Input Text                     ${COMMENT_LOCATION}            ${COMMENT} 

    
    
    