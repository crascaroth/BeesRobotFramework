*** Settings ***
Resource   ../Resources/FullFormResources.robot

Test Teardown    Close Website

*** VARIABLES ***
${URL}                  https://www.globalsqa.com/samplepagetest/
${BROWSER}              chrome

*** Test Case ***


Test Case 01: Everything Right
    Given Client in page ${URL} with ${BROWSER}
<<<<<<< HEAD
    When Type Name Correctly
    AND Type Email Correctly
    AND Type Website Correctly
    AND Choose Experience
    AND Choose Expertise
    AND Choose Education
    AND Comment
    AND Submit
=======
    When Type Everything Correctly
>>>>>>> 5ccb0085fa188a9d431fb1271d93aa119c9c4d2f
    Then Redirected to Success page