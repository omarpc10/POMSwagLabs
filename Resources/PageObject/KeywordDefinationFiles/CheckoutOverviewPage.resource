Library   SeleniumLibrary
Resource  Common.resource
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py

*** Keywords ***
Checkout
    ${status}   Run Keyword And Return Status    Page Should Contain Element    ${FinishButtonLocator}
    IF    '${status}'=='True'
        Wait Until Element Is Visible And Enabled    ${FinishButtonLocator}    ${Timeout}
        Step    Hacer Click en el boton Finish.
        Capture Page Screenshot    Checkout.png
        Click Element    ${FinishButtonLocator}
        Wait Until Element Is Visible And Enabled    ${MessageOrderLocator}    ${Timeout}
        Capture Page Screenshot    MessageOrder.png        
        ${checkout}   Get Text    ${MessageOrderLocator}
        Log Console and Log    La compra se completo con Exito y nos muestra el siguiente mensaje: ${checkout}
    ELSE
        Log Console and Log   "No se encuentra el producto a eliminar"
    END
