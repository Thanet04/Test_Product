*** Settings ***
Library    SeleniumLibrary
 
*** Variables ***
${URL}    https://automationexercise.com/
${browser}    Chrome
 
${products_link}    //a[@href="/products"]
${signup_login_link}    //a[@href="/login"]
${continue_shopping_afteraddingtocart}    //button[@class="btn btn-success close-modal btn-block"]
${cart_link}    //i[@class="fa fa-shopping-cart"]//parent::a[@href="/view_cart"]
${proceed_to_checkout}    //a[@class='btn btn-default check_out'][text()='Proceed To Checkout']
 
${Name}    //input[@data-qa="signup-name"]
${Email}    //input[@data-qa="signup-email"]
${SignUp}    //button[@data-qa="signup-button"]
${gender_groupname}    title
${name_register}    //input[@id="name"]
${password_register}    //input[@id="password"]
${day_ofbirth_list}    //select[@id="days"]
${month_ofbirth_list}    //select[@id="months"]
${year_ofbirth_list}    //select[@id="years"]
${newsletter_checkbox}    //input[@id="newsletter"]
${specialoffers_checkbox}    //input[@id="optin"]
${firstname_input}    //input[@id="first_name"]
${lastname_input}    //input[@id="last_name"]
${company_input}    //input[@id="company"]
${adr1_input}    //input[@id="address1"]
${adr2_input}    //input[@id="address2"]
${country_input}    //select[@id="country"]
${state_input}    //input[@id="state"]
${city_input}    //input[@id="city"]
${zipcode_input}    //input[@id="zipcode"]
${number_input}    //input[@id="mobile_number"]
${create_account_button}    //button[@type="submit"][@data-qa="create-account"]
${continue_button}    //a[@data-qa="continue-button"]
${delete_account_link}    //a[@href="/delete_account"]
${continue_after_deletion}    //a[@data-qa="continue-button"]
 
*** Test Cases ***
Test Case 1: Register User
    Open Browser    ${URL}    ${browser}
    Maximize Browser Window
    Click Element    ${signup_login_link}
 
    Input Text    ${Name}    bookdsaw
    Input Text    ${Email}    asdasd22a@gmail.com
    Click Element    ${SignUp}
 
   
    Input Text    ${name_register}    bookdsaw
    Input Password    ${password_register}    0000000000
    Select From List By Value    ${day_ofbirth_list}    3
    Select From List By Value    ${month_ofbirth_list}    May
    Select From List By Value    ${year_ofbirth_list}    1990
    Select Checkbox    ${newsletter_checkbox}
    Select Checkbox    ${specialoffers_checkbox}
    Input Text    ${firstname_input}    bookdsaw
    Input Text    ${lastname_input}   bookdsaw
    Input Text    ${company_input}    aaaa
    Input Text    ${adr1_input}    122aaa
    Input Text    ${adr2_input}    aaaa
    Select From List By Value    ${country_input}    aaa
    Input Text    ${state_input}    aaaa
    Input Text    ${city_input}    aaa
    Input Text    ${zipcode_input}    10001
    Input Text    ${number_input}    1234567890
 
    Click Button    ${create_account_button}
    Page Should Contain    Account Created!
    Click Element    ${continue_button}
 
    Reload Page
    Click Element    ${continue_button}
    Wait Until Page Contains Element    ${cart_link}
 
 
    Click Element    ${delete_account_link}
    Page Should Contain    Account Deleted!
    Click Element    ${continue_after_deletion}
 
*** Keywords ***
