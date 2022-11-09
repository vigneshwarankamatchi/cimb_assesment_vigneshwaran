*** Setting ***
Resource    ../../Modules/Resource.robot
Library   DebugLibrary
Library  SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

# robot -d reports -T -i smoke -V vars/preprod.yaml -v remote_url:None  TestCases/Smoke/demo_test_1_bdd.robot
# robot -d reports -T -i tc01 -V vars/preprod.yaml -v remote_url:None  TestCases/Smoke/demo_test_1_bdd.robot

*** Variables ***
# &{Authorization}       Authorization=Bearer f3b085e6fa8b41f202e9be0173367cc8f6cc1817
&{Authorization}       Authorization=Bearer d260e1d5165eb32ea4168a5dbd34bcab53e21587


# $ curl "https://api.todoist.com/rest/v2/projects" \
#     -X POST \
#     --data '{"name": "Shopping List"}' \
#     -H "Content-Type: application/json" \
#     -H "X-Request-Id: $(uuidgen)" \
#     -H "Authorization: Bearer 0123456789abcdef0123456789"

*** Test Cases ***
Do a GET Request and validate the response code and response body
    [tags]  smoke   tc01
    Create Session  mysession  https://api.todoist.com  verify=true
    ${response}=  GET On Session  mysession  /rest/v1/projects    headers=&{Authorization}
    Status Should Be  200  ${response}  #Check Status as 200

    #Check Title from Response Body
    ${title}=  Get Value From Json  ${response.json()}[0]  name
    ${titleFromList}=  Get From List   ${title}  0
    Should be equal  ${titleFromList}  Inbox

    #Check url is present in the repsonse body
    ${body}=  Convert To String  ${response.content}
    Should Contain  ${body}  url


Create a New Project and verify the project created successfully
    [tags]  smoke   tc02
    Create Session  mysession1  https://api.todoist.com  verify=true
    ${uuidgen}=    Evaluate    str(uuid.uuid4())    uuid
    log   ${uuidgen}
    ${proj_name} =  Generate Random String  12  [LOWER]
    &{body}=  Create Dictionary  name=${proj_name}
    &{header}=  Create Dictionary   Content-Type=application/json    X-Request-Id=${uuidgen}   &{Authorization}
    &{headers}=       Create Dictionary    &{Authorization}    Content-Type=application/json       X-Request-Id=${uuidgen}     Cache-Control=no-cache
    ${response}=  POST On Session  mysession1  /rest/v1/projects  json=${body}  headers=&{headers}


    Status Should Be   200  ${response}  #Check Status as 200

    #Check project name from Response Body
    ${id}=  Get Value From Json  ${response.json()}  name
    ${idFromList}=  Get From List   ${id}  0
    ${idFromListAsString}=  Convert To String  ${idFromList}
    Should be equal As Strings  ${idFromListAsString}  ${proj_name}




Create a New Task under the project and verify it's created successfully
    [tags]  smoke   tc03
    Create Session  mysession1  https://api.todoist.com  verify=true
    ${uuidgen}=    Evaluate    str(uuid.uuid4())    uuid
    log   ${uuidgen}
    ${contentname} =  Generate Random String  12  [LOWER]
    &{body}=  Create Dictionary  content=BuyMilkagaintestonet   due_string="tomorrow at 12:00"   due_lang=en   priority=4
    &{header}=  Create Dictionary   Content-Type=application/json    X-Request-Id=${uuidgen}   &{Authorization}
    &{headers}=       Create Dictionary    &{Authorization}    Content-Type=application/json       X-Request-Id=${uuidgen}
    ${response}=  POST On Session  mysession1  /rest/v1/tasks  json=${body}  headers=&{headers}


    Status Should Be   200  ${response}  #Check Status as 200

    #Check project name from Response Body
    ${id}=  Get Value From Json  ${response.json()}  content
    ${idFromList}=  Get From List   ${id}  0
    ${idFromListAsString}=  Convert To String  ${idFromList}
    Should be equal As Strings  ${idFromListAsString}  BuyMilkagaintestonet

    ${content_id}=  Get Value From Json  ${response.json()}  id
    ${content_id}=  Get From List   ${content_id}  0
    Set suite variable   ${content_id}

Update the task content and verify it’s updated successfully
    [tags]  smoke   tc04
    Create Session  mysession2  https://api.todoist.com  verify=true
    ${uuidgen}=    Evaluate    str(uuid.uuid4())    uuid
    log   ${uuidgen}
    ${contentname} =  Generate Random String  12  [LOWER]
    &{body}=  Create Dictionary  content=BuyMilkagaintestagaint
    &{header}=  Create Dictionary   Content-Type=application/json    X-Request-Id=${uuidgen}   &{Authorization}
    &{headers}=       Create Dictionary    &{Authorization}    Content-Type=application/json       X-Request-Id=${uuidgen}
    ${response}=  POST On Session  mysession2  /rest/v1/tasks/${content_id}  json=${body}  headers=&{headers}


    Status Should Be   204  ${response}  #Check Status as 200

    Create Session  mysession  https://api.todoist.com  verify=true
    ${response}=  GET On Session  mysession  /rest/v1/tasks/${content_id}    headers=&{Authorization}
    Status Should Be  200  ${response}  #Check Status as 200

    #Check project name from Response Body
    ${id}=  Get Value From Json  ${response.json()}  content
    ${idFromList}=  Get From List   ${id}  0
    ${idFromListAsString}=  Convert To String  ${idFromList}
    Should be equal As Strings  ${idFromListAsString}  BuyMilkagaintestagaint


*** Keywords ***
I'm on CIMB page
    cimb homepage loaded

