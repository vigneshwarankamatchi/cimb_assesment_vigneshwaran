*** Setting ***
Resource    ../Modules/Resource.robot

*** Variables ***
${standard_repayment_table}    //*[@id]/div[1]/h2[text()="Standard Repayment"]
*** Keywords ***

Validate that each item for “data-vars-cgt”
    FOR    ${INDEX}    IN RANGE    1    ${AllLinksCount}
         Log    ${INDEX}
         Page should contain element   //*[@id="homepage"]/div[3]/amp-carousel/div/div[1]/a[@data-vars-cgt][${INDEX}]
    END
