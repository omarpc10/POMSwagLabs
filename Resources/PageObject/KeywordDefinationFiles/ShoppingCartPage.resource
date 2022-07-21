*** Settings ***
Library   SeleniumLibrary
Resource  Common.resource
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py

*** Keywords ***
Remove product from shopping cart
    [Arguments]    ${l_remove}
    ${status}   Run Keyword And Return Status    Page Should Contain Element    ${l_remove}
    IF    '${status}'=='True'
        Wait Until Element Is Visible And Enabled    ${l_remove}    ${Timeout}
        Step    Eliminamos producto del carrito de compras.
        Click Element    ${l_remove}
    ELSE
        Log Console and Log   "No se encuentra el producto a eliminar"
    END
    ${status}   Run Keyword And Return Status    Page Should Not Contain Element    ${l_remove}
    IF    '${status}'=='True'
        Log Console and Log   "Producto Eliminado correctamente"
    ELSE
        Log Console and Log   "El producto no se elimino correctamente"
    END

Select product from shopping cart
    [Arguments]    ${l_description}
    ${status}   Run Keyword And Return Status    Page Should Contain Element    ${l_description}
    IF    '${status}'=='True'
        Wait Until Element Is Visible And Enabled    ${l_description}    ${Timeout}
        Step    Seleccionar producto desde el carrito de compras.
        Click Element    ${l_description}
    ELSE
        Log Console and Log   "No se encuentra el producto a eliminar"
    END

Select Checkout Button
    ${status}   Run Keyword And Return Status    Page Should Contain Element    ${CheckoutButtonLocator}
    IF    '${status}'=='True'
        Wait Until Element Is Visible And Enabled    ${CheckoutButtonLocator}    ${Timeout}
        Step    Hacer click al boton de Checkout        
        Click Element    ${CheckoutButtonLocator}
    ELSE
        Log Console and Log   "No se encuentra el boton Checkout"
    END
