*** Settings ***
Library   SeleniumLibrary
Resource   Common.resource
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py


*** Keywords ***
Login Page is Open
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Step    Abrir navegador y nos dirigimos a la url: ${URL}
    Set Selenium Speed    0.2s
    Wait Until Element Is Visible And Enabled    ${LoginUsernameInputBox}   ${Timeout}

Input valid username and password
    Step    Ingresamos Usuario
    Input Text    ${LoginUsernameInputBox}    ${Username}
    Wait Until Element Is Visible And Enabled    ${LoginPasswordInputBox}   ${Timeout}
    Step    Ingresamos Contraseña
    Input Password    ${LoginPasswordInputBox}    ${password}
    Wait Until Element Is Visible And Enabled    ${LoginButton}   ${Timeout}
    Step    Hacer Click en el boton de Login.
    Click Element    ${LoginButton}


Input locked username and password
    Step    Ingresamos Usuario bloqueado
    Input Text    ${LoginUsernameInputBox}    ${LockedUsername}
    Wait Until Element Is Visible And Enabled    ${LoginPasswordInputBox}   ${Timeout}
    Step    Ingresamos Contraseña
    Input Password    ${LoginPasswordInputBox}    ${password}
    Wait Until Element Is Visible And Enabled    ${LoginButton}   ${Timeout}
    Step    Hacer Click en el boton de Login.
    Click Element    ${LoginButton}
    ${status}   Run Keyword And Return Status    Wait Until Element Is Visible And Enabled    ${LockedUsernameMessage}    ${Timeout}
    IF    '${status}'=='True'
        ${message}    Get Text    ${LockedUsernameMessage}
        Should Be Equal    ${message}    ${ErrorMessage}
        Log Console and Log    El mensaje mostrado es: ${message}
        Close Browser
    END
