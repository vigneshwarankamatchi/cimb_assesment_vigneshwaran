*** Setting ***
Resource    ../../Modules/Resource.robot
Library   DebugLibrary
#Setup/Tear Down
#Test Setup	Test Case Setup 	${platform} 	${env}   ${url_sg}
Test Teardown	Close Browser


*** Variables ***

${homepage_footer_home_link}   //footer/footer/div[1]/div/div[1]/nav/ol/li[2]/a[@href="/en/personal/home.html"]
${homepage_flash_modal_x_button}   //*[@id]/div/*[local-name()='svg' and contains(@class, "btn-overlay")]
${homepage_footer_CIMB_deals_link}   //footer/footer/div[1]/div/div[2]/div[2]/div[1]/ul/li[1]/a[text()="CIMB Deals"]
${travel_lifestyle_viewall_link}   //home-page/div/main/div[4]/div/div[1]/div[2]/a[text()="View All"]
${travel_lifestyle_octotravel_link1}   //main/category-page/div/main/div[2]/div/div[2]/div/div[2]/div/deal-item-new[1]/div/img

${travel_lifestyle_TGV_link1}    //main/category-page/div/main/div[2]/div/div[2]/div/div[2]/div/deal-item-new[15]/div/img

${similar_deals_header}    //main/deal-detail-page/div/main/div[2]/div/p[text()="Similar Deals"]
${similar_deals_items}    //main/deal-detail-page/div/main/div[2]/div/div/div/div/deal-item
${acceptandclose_button}   //*[@id]/div/div/div[2]/div[text()="Accept and Close"]
${notification_close_button}   //*[@id]/div/div/div[2]/*[local-name()='svg' and contains(@class, "btn-close-notification")]
${dealspage_acceptandclose_button}   //app/div/app-cookie-notification/div/div[2]/button[text()="Accept & Close"]

${burger_menu}   //*[@id]/div[1]/div/div[1]/div[1]/*[local-name()='svg' and contains(@class, "stroke-current")]
${tools_link}   //*[@id]/div[2]/div[1]/div/nav[6]/a[text()="Tools"]
${loan_calculator_link}   //*[@id]/div/div/div/article[2]/a[contains(@href,"education-loan-calculator-standard-repayment.html")]
${loan_calc_header}   //div[4]/div/div[1]/div/div[3]/div/div/h1[text()="Education Loan Calculator (Standard Repayment)"]
${loan_amount_textbox}   //body/div[4]/div/div[2]/div/div[1]/section/div/div[1]/div/div/div/div[1]/div/div/div/div/h3/div/input
${loan_tenure_textbox}   //body/div[4]/div/div[2]/div/div[1]/section/div/div[1]/div/div/div/div[2]/div/div[1]/div/div/h3/div/input

${monthlyinstallment}   //body/div[4]/div/div[2]/div/div[1]/section/div/div[2]/div/div/div[1]/h3/span[2]
${interestrate}   //body/div[4]/div/div[2]/div/div[1]/section/div/div[2]/div/div/div[2]/h3/span[1]
${totalinterestcharged}   //body/div[4]/div/div[2]/div/div[1]/section/div/div[2]/div/div/div[3]/h3/span[2]
${totalpaymentamount}   //body/div[4]/div/div[2]/div/div[1]/section/div/div[2]/div/div/div[4]/h3/span[2]

${standard_repayment_table}    //*[@id]/div[1]/h2[text()="Standard Repayment"]
*** Test Cases ***
Scenario 1:
     [tags]    smoke     tc01
     Test Case Setup    ${platform}     ${env}   ${url_my}
     Given I'm on CIMB page
     When I select CIMB Deals
     And I click on View All for Travel & Lifestyle
     I would like to explore more On TGV Cinemas for movies ticket offer
     Then I will be able to see its details and other similar deals beneath it

Scenario 2:
     [tags]    smoke     tc02
    Test Case Setup     ${platform}     ${env}   ${url_sg}
    Given I'm on CIMB page
    And I navigate to Tools page from menu
    When I access to Education Loan Calculator(Standard Repayment)
    And I have inputted all necessary values
    Then I will be able to see the Monthly Installment, Interest Rate, Total Interest Charged and Total Payment Amount
    And I will be able to see an example table of the standard repayment
    And different interest rates for different year based on my input

*** Keywords ***
I'm on CIMB page
    cimb homepage loaded

cimb homepage loaded
    Wait Until Element is Visible     ${homepage_flash_modal_x_button}
    Click Element    ${homepage_flash_modal_x_button}
    Wait Until Element is Visible    ${homepage_footer_home_link}  10s
    Click Element    ${notification_close_button}

I select CIMB Deals
    Run keyword and ignore error   Click Element    ${acceptandclose_button}
    Wait Until Element is Visible   ${homepage_footer_CIMB_deals_link}
    Run Keyword And Ignore Error    Scroll Element Into View     ${homepage_footer_CIMB_deals_link}
    Mouse over    ${homepage_footer_CIMB_deals_link}
    Click Element    ${homepage_footer_CIMB_deals_link}
    ${handles}=    Get Window Handles
    Switch Window    ${handles}[1]

I click on View All for Travel & Lifestyle
    Wait Until Element is Visible   ${dealspage_acceptandclose_button}
    Click Element   ${dealspage_acceptandclose_button}
    Wait Until Element is Visible   ${travel_lifestyle_viewall_link}
    Run Keyword And Ignore Error    Scroll Element Into View     ${travel_lifestyle_viewall_link}
    Mouse over    ${travel_lifestyle_viewall_link}
    Click Element    ${travel_lifestyle_viewall_link}


I would like to explore more On TGV Cinemas for movies ticket offer
    Wait Until Element is Visible   ${travel_lifestyle_TGV_link1}
    Click Element   ${travel_lifestyle_TGV_link1}

I will be able to see its details and other similar deals beneath it
    Wait Until Element is Visible   ${similar_deals_header}
    ${x}   get element count   ${similar_deals_items}

I navigate to Tools page from menu
    Wait Until Element is Visible   ${burger_menu}
    Click Element   ${burger_menu}
    Wait Until Element is Visible   ${tools_link}
    Click Element   ${tools_link}
    Wait Until Element is Visible   ${loan_calculator_link}

When I access to Education Loan Calculator(Standard Repayment)
    Wait Until Element is Visible   ${loan_calculator_link}
    Click Element   ${loan_calculator_link}
    ${handles}=    Get Window Handles
    Switch Window    ${handles}[1]
    Wait Until Element is Visible   ${loan_calc_header}

I have inputted all necessary values
    Wait Until Element is Visible   ${loan_amount_textbox}
    input text    ${loan_amount_textbox}   20000
    Wait Until Element is Visible   ${loan_tenure_textbox}
    input text    ${loan_tenure_textbox}   5


Then I will be able to see the Monthly Installment, Interest Rate, Total Interest Charged and Total Payment Amount
    wait Until Element is Visible    ${interestrate}
    ${moninst}=    Get Text    ${monthlyinstallment}
    ${effint}=    Get Text    ${interestrate}
    ${totalint}=    Get Text    ${totalinterestcharged}
    ${amtpayable}=    Get Text    ${totalpaymentamount}
    log    Monthly Instalment ${moninst}
    log    Interest Rate ${effint}
    log    Total Interest Payable and ${totalint}
    log    Total Amount Payable${amtpayable}


And I will be able to see an example table of the standard repayment
    Wait Until Element is Visible     ${standard_repayment_table}

And different interest rates for different year based on my input
    ${oneyear}=    Get Text   //*[@id]/div[1]/table/tbody/tr[2]/td[4]
    log   one year interestrate ${oneyear}
    FOR    ${INDEX}    IN RANGE    2    10
         Log    ${INDEX}
         ${lintext}=    Get Text    //*[@id]/div[1]/table/tbody/tr[${INDEX}]/td[2]
         Log    ${INDEX} year interestrate ${lintext}
    END





