*** Settings ***
Library   SeleniumLibrary
Library   Screenshot
Resource  Common.resource
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py

*** Keywords ***
Input Personal Information and Continue
    ${status}   Run Keyword And Return Status    Page Should Contain Element    ${FirstNameLocator}
    IF    '${status}'=='True'
        Wait Until Element Is Visible And Enabled    ${FirstNameLocator}    ${Timeout}
        Step    Ingresar First Name : ${FirstName}
        Input Text    ${FirstNameLocator}    ${FirstName}
        Wait Until Element Is Visible And Enabled    ${LastNameLocator}    ${Timeout}
        Step    Ingresar Last Name : ${LastName}
        Input Text    ${LastNameLocator}    ${LastName}
        Wait Until Element Is Visible And Enabled    ${ZipCodeLocator}    ${Timeout}
        Step    Ingresar Zip Code : ${ZipCode}
        Input Text    ${ZipCodeLocator}    ${ZipCode}
        Capture Page Screenshot    Input Personal Information.png
        Wait Until Element Is Visible And Enabled    ${ContinueButtonLocator}    ${Timeout}
        Step    Hacer Click en el boton Continue
        Click Element    ${ContinueButtonLocator}
    ELSE
        Capture Page Screenshot    Fail.png
        Fail   "No se muestra la pagina de Checkout correctamente"
    END
