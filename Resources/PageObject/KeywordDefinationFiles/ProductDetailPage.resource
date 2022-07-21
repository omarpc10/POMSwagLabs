*** Settings ***
Library   SeleniumLibrary
Resource  Common.resource
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py


*** Keywords ***
Verify Product Details
    ${status}   Run Keyword And Return Status    Page Should Contain Element    ${ProductTitleLocator}
    IF    '${status}'=='True'
        Wait Until Element Is Visible And Enabled    ${ProductTitleLocator}    ${Timeout}
        ${description}    Get Text    ${ProductDescriptionLocator}
        Log Console and Log    Se muestra la siguiente descripción del producto = "${description}"
    ELSE
        Fail   No se encontro la descripción del producto.    
    END
