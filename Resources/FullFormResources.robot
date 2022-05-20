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
    ${NAME}     FakerLibrary.Name
    ${EMAIL}    FakerLibrary.Email

    ${EXPERIENCE}    FakerLibrary.Random Int    min=1    max=6



    ${RANDOMNUMBER}    FakerLibrary.Random Int    min=1                  max=99
    ${COMMENT}         FakerLibrary.Words         nb=${RANDOMNUMBER} 

    ${TEMP}    FakerLibrary.Hostname

    Set Global Variable    ${WEBSITE}    https://${TEMP}






    Set Global Variable    ${NAME}
    Set Global Variable    ${EMAIL}
    Set Global Variable    ${EXPERIENCE} 
    Set Global Variable    ${EDUCATION}      aa

    Set Global Variable    ${COMMENT} 
    Set Global Variable    ${SUBMIT_LOCATION}    css=#contact-form-2599 > form > p.contact-submit > button

    Open Browser    ${URL}    ${BROWSER}    options=add_argument("--start-maximized")    





When Type Name Correctly
    Set Local Variable    ${NAME_LOCATION}    css=#g2599-name

    Scroll Element Into View         ${NAME_LOCATION} 
    Wait Until Element Is Visible    ${NAME_LOCATION} 
    Input Text                       ${NAME_LOCATION}     ${NAME}    

AND Type Email Correctly
    Set Local Variable    ${EMAIL_LOCATION}    css=#g2599-email

    Scroll Element Into View         ${EMAIL_LOCATION} 
    Wait Until Element Is Visible    ${EMAIL_LOCATION} 
    Input Text                       ${EMAIL_LOCATION}     ${EMAIL}    

AND Type Website Correctly
    Set Local Variable    ${WEBSITE_LOCATION}    css=#g2599-website

    Scroll Element Into View         ${WEBSITE_LOCATION} 
    Wait Until Element Is Visible    ${WEBSITE_LOCATION} 
    Input Text                       ${WEBSITE_LOCATION}     ${WEBSITE} 

AND Choose Experience
    Set Local Variable    ${EXPERIENCE_LOCATION}    css=#g2599-experienceinyears

    Scroll Element Into View         ${EXPERIENCE_LOCATION}
    Wait Until Element Is Visible    ${EXPERIENCE_LOCATION} 
    IF                               ${EXPERIENCE} == 1
    Select From List By Value        ${EXPERIENCE_LOCATION}     0-1
    List Selection Should Be         ${EXPERIENCE_LOCATION}     0-1
    Set Global Variable              ${EXPERIENCE}              0-1
    ELSE IF                          ${EXPERIENCE} == 2
    Select From List By Value        ${EXPERIENCE_LOCATION}     1-3
    List Selection Should Be         ${EXPERIENCE_LOCATION}     1-3
    Set Global Variable              ${EXPERIENCE}              1-3
    ELSE IF                          ${EXPERIENCE} == 3
    Select From List By Value        ${EXPERIENCE_LOCATION}     3-5
    List Selection Should Be         ${EXPERIENCE_LOCATION}     3-5
    Set Global Variable              ${EXPERIENCE}              3-5
    ELSE IF                          ${EXPERIENCE} == 4
    Select From List By Value        ${EXPERIENCE_LOCATION}     5-7
    List Selection Should Be         ${EXPERIENCE_LOCATION}     5-7
    Set Global Variable              ${EXPERIENCE}              5-7
    ELSE IF                          ${EXPERIENCE} == 5
    Select From List By Value        ${EXPERIENCE_LOCATION}     7-10
    List Selection Should Be         ${EXPERIENCE_LOCATION}     7-10
    Set Global Variable              ${EXPERIENCE}              7-10
    ELSE IF                          ${EXPERIENCE} == 6
    Select From List By Value        ${EXPERIENCE_LOCATION}     10+
    List Selection Should Be         ${EXPERIENCE_LOCATION}     10+
    Set Global Variable              ${EXPERIENCE}              10+
    END


AND Choose Expertise
    Set Global Variable    ${EXPERTISE}    expertise

    Set Local Variable    ${FUNCTIONAL_TESTING_LOCATION}    css=#contact-form-2599 > form > div.grunion-field-wrap.grunion-field-checkbox-multiple-wrap > label:nth-child(2) > input
    Set Local Variable    ${AUTOMATION_TESTING_LOCATION}    css=#contact-form-2599 > form > div.grunion-field-wrap.grunion-field-checkbox-multiple-wrap > label:nth-child(4) > input
    Set Local Variable    ${MANUAL_TESTING_LOCATION}        css=#contact-form-2599 > form > div.grunion-field-wrap.grunion-field-checkbox-multiple-wrap > label:nth-child(6) > input


    ${RANDOMNUMBER}             FakerLibrary.Random Int           min=0    max=1
    Scroll Element Into View    ${FUNCTIONAL_TESTING_LOCATION}
    IF                          ${RANDOMNUMBER} == 1
    Select Checkbox             ${FUNCTIONAL_TESTING_LOCATION}

    ${EXPERTISE}    Set Variable    Functional Testing

    END

    ${RANDOMNUMBER}             FakerLibrary.Random Int           min=0                   max=1
    Scroll Element Into View    ${AUTOMATION_TESTING_LOCATION}
    IF                          ${RANDOMNUMBER} == 1
    Select Checkbox             ${AUTOMATION_TESTING_LOCATION}
    IF                          '${EXPERTISE}'!='${EMPTY}'
    ${EXPERTISE}                Set Variable                      Automation Testing
    ELSE
    Catenate                    ${EXPERTISE}                      , Automation Testing    
    END
    END

    ${RANDOMNUMBER}             FakerLibrary.Random Int       min=0               max=1
    Scroll Element Into View    ${MANUAL_TESTING_LOCATION}
    IF                          ${RANDOMNUMBER} == 1
    Select Checkbox             ${MANUAL_TESTING_LOCATION}
    IF                          '${EXPERTISE}'!='${EMPTY}'
    ${EXPERTISE}                Set Variable                  Manual Testing
    ELSE
    Catenate                    ${EXPERTISE}                  , Manual Testing    
    END

    END

    Set Global Variable    ${EXPERTISE}

AND Choose Education

    ${RANDOMNUMBER}    FakerLibrary.Random Int    min=1    max=3

    Set Local Variable    ${GRADUATE_LOCATION}         css=#contact-form-2599 > form > div.grunion-field-wrap.grunion-field-radio-wrap > label:nth-child(2) > input
    Set Local Variable    ${UNGRADUATE_LOCATION}       css=#contact-form-2599 > form > div.grunion-field-wrap.grunion-field-radio-wrap > label:nth-child(4) > input
    Set Local Variable    ${POST_GRADUATE_LOCATION}    css=#contact-form-2599 > form > div.grunion-field-wrap.grunion-field-radio-wrap > label:nth-child(6) > input




    IF                          ${RANDOMNUMBER} == 1
    Scroll Element Into View    ${GRADUATE_LOCATION}
    Click Element               ${GRADUATE_LOCATION}
    ${EDUCATION}=               Get Value               ${GRADUATE_LOCATION}

    ELSE IF                     ${RANDOMNUMBER} == 2
    Scroll Element Into View    ${UNGRADUATE_LOCATION}
    Click Element               ${UNGRADUATE_LOCATION}
    ${EDUCATION}=               Get Value                 ${UNGRADUATE_LOCATION}

    ELSE IF                     ${RANDOMNUMBER} == 3
    Scroll Element Into View    ${POST_GRADUATE_LOCATION}
    Click Element               ${POST_GRADUATE_LOCATION}
    ${EDUCATION}=               Get Value                    ${POST_GRADUATE_LOCATION}

    END


AND Comment
    Set Local Variable    ${COMMENT_LOCATION}    css=#contact-form-comment-g2599-comment

    Scroll Element Into View         ${COMMENT_LOCATION} 
    Wait Until Element Is Visible    ${COMMENT_LOCATION} 
    Input Text                       ${COMMENT_LOCATION}     ${COMMENT} 


AND Submit
    Scroll Element Into View         ${SUBMIT_LOCATION} 
    Wait Until Element Is Visible    ${SUBMIT_LOCATION} 
    Click Button                     ${SUBMIT_LOCATION}


Then Redirected to Success page
    Set Suite Variable    ${NAME_FINISH_LOCATION}       css=#contact-form-2599 > blockquote > p:nth-child(1)
    Set Suite Variable    ${EMAIL_FINISH_LOCATION}      css=#contact-form-2599 > blockquote > p:nth-child(2)
    Set Suite Variable    ${WEBSITE_FINISH_LOCATION}    css=#contact-form-2599 > blockquote > p:nth-child(3)

    Set Suite Variable    ${EXPERIENCE_FINISH_LOCATION}    css=#contact-form-2599 > blockquote > p:nth-child(4)
    Set Suite Variable    ${EXPERTISE_FINISH_LOCATION}     css=#contact-form-2599 > blockquote > p:nth-child(5)
    Set Suite Variable    ${EDUCATION_FINISH_LOCATION}     css=#contact-form-2599 > blockquote > p:nth-child(6)
    Set Suite Variable    ${COMMENT_FINISH_LOCATION}       css=#contact-form-2599 > blockquote > p:nth-child(7)



    # Wait Until Element is Visible
    Element Text Should Be    ${NAME_FINISH_LOCATION}          Name: ${NAME}
    Element Text Should Be    ${EMAIL_FINISH_LOCATION}         Email: ${EMAIL}
    Element Text Should Be    ${WEBSITE_FINISH_LOCATION}       Website: ${WEBSITE}
    Element Text Should Be    ${EXPERIENCE_FINISH_LOCATION}    Experience (In Years): ${EXPERIENCE}
    Element Text Should Be    ${EXPERTISE_FINISH_LOCATION}     Expertise :: ${EXPERTISE}


Then do not Redirect to Success page
    Location Should Be       https://www.globalsqa.com/