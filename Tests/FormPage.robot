*** Settings ***
Resource   ../Resources/FullFormResources.robot

Test Teardown    Close Website

*** VARIABLES ***
${URL}                  https://www.globalsqa.com/samplepagetest/
${BROWSER}              chrome

*** Test Case ***


Test Case 01: Everything Right
    Given Client in page ${URL} with ${BROWSER}
    When Type Name Correctly
    AND Type Email Correctly
    AND Type Website Correctly
    AND Choose Experience
    AND Choose Expertise
    AND Choose Education
    AND Comment
    AND Submit
    Then Redirected to Success page