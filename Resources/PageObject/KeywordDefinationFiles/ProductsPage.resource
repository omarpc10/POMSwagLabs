*** Settings ***
Library   SeleniumLibrary
Resource  Common.resource
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py


*** Keywords ***
Welcome Page should be Open
    ${status}   Run Keyword And Return Status    Page Should Contain Element    ${ProductPageHeader}
    IF    '${status}'=='True'
        Wait Until Element Is Visible And Enabled    ${ProductPageHeader}     ${Timeout}
        Log Console and Log   "Se muestra pantalla de inicio"
    ELSE
        Log Console and Log   "No se muestra pantalla de inicio"
    END


Add Product to shopping cart
    [Arguments]    ${l_product}
    Wait Until Element Is Visible And Enabled    ${l_product}    ${Timeout}
    Step    Seleccionamos el producto
    Click Element    ${l_product}

Go to Shopping Cart
    Wait Until Element Is Visible And Enabled    ${ShoppingCartLocator}    ${Timeout}
    Step    Hacer click en el boton del carrito de compras.
    Click Element    ${ShoppingCartLocator}
