*** Settings ***
Resource   ../Resources/FullFormResources.robot

Test Teardown    Close Website

*** VARIABLES ***
${URL}                  https://www.globalsqa.com/samplepagetest/
${BROWSER}              chrome

*** Test Case ***


Test Case 01: Everything Right
    Given Client in page ${URL} with ${BROWSER}
    When Type Everything Correctly
    Then Redirected to Success page