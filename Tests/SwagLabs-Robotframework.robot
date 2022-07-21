*** Settings ***
Resource   ../Resources/PageObject/KeywordDefinationFiles/LoginPage.resource
Resource   ../Resources/PageObject/KeywordDefinationFiles/ProductsPage.resource
Resource   ../Resources/PageObject/KeywordDefinationFiles/ShoppingCartPage.resource
Resource   ../Resources/PageObject/KeywordDefinationFiles/ProductDetailPage.resource
Resource   ../Resources/PageObject/KeywordDefinationFiles/CheckoutInformationPage.resource
Resource   ../Resources/PageObject/KeywordDefinationFiles/CheckoutOverviewPage.resource

*** Test Cases ***
Verify Successful Login
    Given Login Page is Open
    When Input valid username and password
    Then Welcome Page should be Open
    And Log Out and Close Browser

Verify login with locked user
    Given Login Page is Open
    When Input locked username and password

Add and Remove products from the shopping cart
    Given Login Page is Open
    When Input valid username and password
    Then Welcome Page should be Open
    And Add Product to shopping cart    ${BackPackLocator}
    And Add Product to shopping cart    ${BikeLightLocator}
    Then Go to Shopping Cart
    And Remove product from shopping cart   ${RemoveBikeLightLocator}
    And Log Out and Close Browser

Verify product detail from the shopping cart
    Given Login Page is Open
    When Input valid username and password
    Then Welcome Page should be Open
    And Add Product to shopping cart    ${BackPackLocator}
    Then Go to Shopping Cart
    And Select product from shopping cart    ${BackPackTitleLocator}
    Then Verify Product Details
    And Log Out and Close Browser

Complete product purchase
    Given Login Page is Open
    When Input valid username and password
    Then Welcome Page should be Open
    And Add Product to shopping cart    ${BackPackLocator}
    Then Go to Shopping Cart
    And Select Checkout Button
    When Input Personal Information and Continue
    Then Checkout
    And Log Out and Close Browser
