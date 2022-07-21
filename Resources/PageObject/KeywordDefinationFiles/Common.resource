*** Settings ***
Library   SeleniumLibrary
Library   ../../../Library/CustomLibrary.py
Library   Process
Variables   ../Locators/Locators.py
Variables   ../TestData/Testdata.py

*** Variables ***
${step_number}    0


*** Keywords ***
Wait Until Element Is Visible And Enabled
    [Arguments]   ${WEB_ELEMENT}    ${Time}
    ${VISIBLE}          Run Keyword And Return Status       Wait Until Element Is Visible       ${WEB_ELEMENT}
    IF      ${VISIBLE}
        ${ENABLED}           Run Keyword And Return Status       Wait Until Element Is Enabled       ${WEB_ELEMENT}
        IF      ${ENABLED}
            ${WebElement}   Get WebElement    ${WEB_ELEMENT}
            Highlight   ${WebElement}
        END
        IF      not ${ENABLED}
            Run Keyword And Continue On Failure   Fail     El Elemento ${ELEMENT} no se ha habilitado, verifique la ruta.
        END
    ELSE
        Run Keyword And Continue On Failure   Fail     El Elemento ${WEB_ELEMENT} no fue encontrado, verifique la ruta.
    END

Log Console and Log
    [Documentation]
    ...    Allow us to enter a message both in console and in the log
    [Arguments]    ${message}
    ${_timestamp} =    Get Time
    Log  ${message}
    Log To Console  ${_timestamp} -- ${message}

Step
    [Arguments]    ${message}
    ${step_number}=    Evaluate    ${step_number} + 1
    Log Console And Log    Step ${step_number}: ${message}
    Set Test Variable    ${step_number}

Log Out and Close Browser
    Wait Until Element Is Visible And Enabled    ${BurgerMenuLocator}    ${Timeout}
    Step    Hacer click en el Menu superior.
    Click Element    ${BurgerMenuLocator}
    Wait Until Element Is Visible And Enabled    ${LogOutButtonLocator}    ${Timeout}
    Step    Hacer click en el boton LogOut.
    Capture Page Screenshot    LogOut.png
    Click Element    ${LogOutButtonLocator}
    ${status}   Run Keyword And Return Status    Page Should Not Contain Element    ${LogOutButtonLocator}
    IF    '${status}'=='True'
          Wait Until Element Is Visible And Enabled    ${LoginUsernameInputBox}   ${Timeout}
          Capture Page Screenshot    LoginPage.png
          Log Console and Log    "Finaliza sesión y cierra el navegador"
          Close Browser
          ${result} =  Run Process    TASKKILL    /F    /IM    chromedriver.exe
    ELSE
          Fail    "No se finalizo sesión correctamente"
    END
