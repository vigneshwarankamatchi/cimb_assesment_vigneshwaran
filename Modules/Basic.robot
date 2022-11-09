*** SETTINGS ***
Library    DateTime
# Library    FakerLibrary
Library    OperatingSystem
Library    String
Library    SeleniumLibrary    timeout=30    implicit_wait=5
# Library    ExtendedSeleniumLibrary    timeout=30    implicit_wait=5
Library    Collections
Library     SeleniumLibrary    run_on_failure=SeleniumLibrary.CapturePageScreenshot

*** Variables ***
# page titles for logged in and not logged in users
${iprice_homepage_title}    iprice

*** Keywords ***
# Removes the chrome bar at the top which says "Chrome browser controlled by automation software"
Launch Chrome Browser Without Bar
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()   sys, selenium.webdriver
    ${prefs}    Create Dictionary   credentials_enable_service=${false}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Call Method    ${options}    add_argument    disable-infobars
    Create WebDriver    Chrome    chrome_options=${options}
#    Open Browser    Chrome    chrome_options=${options}

# Closes browser and quits
Quit
    Close Browser

# Validates appearance and disappearance of Loading Box throughout
Handle Loading Box
    [Arguments]    ${limit}=none
    Sleep    0.5
    :For    ${index}    IN RANGE    ${limit}
    \    Run Keyword And Ignore Error    Wait Until Page Contains Element    ${ipriceos_Icon_ipriceLoading}    timeout=1
    \    ${match}=    Get Element Count    ${ipriceos_Icon_ipriceLoading}
    \    Run Keyword If    ${match}>0    Run Keyword And Ignore Error    Wait Until Page Does Not Contain Element    ${ipriceos_Icon_ipriceLoading}    timeout=20
    \    Run Keyword If    ${match}==0    Exit For Loop
    Run Keyword If    ${match}>0      Capture Page Screenshot
    Run Keyword If    ${match}>0      Fail    The Loading Box Still Displayed

Page Scroll Down To Bottom
    Execute JavaScript  [].forEach.call(window.document.querySelectorAll('.container-fluid'), function(site) { site.scrollTop = 99999 })
    Sleep   1

Switch Back To VLE Window
    Select window    title=iprice OS

Auto-Generate Current TimeStamp
    ${date_stamp}=    Get Current Date    time_zone=local    result_format=%Y%m%d%H%M%S
    # ${date_stamp}=    Get Current Date    time_zone=local    result_format=%Y-%m-%d-%H-%M-%S
    [Return]    ${date_stamp}

Write To File
    [Arguments]    ${file_name}    @{details}
    ${File_Path}    Join Path    ${EXECDIR}    Output    ${file_name}
    :For    ${item}    IN    @{details}
    \    Append To File    ${File_Path}    ${item}
    \    Append To File    ${File_Path}  ${SPACE}${SPACE}${SPACE}
    Append To File    ${File_Path}    ${\n}

Scroll To An Element In View
    [Arguments]    ${path}
    Execute Javascript    document.getElementByXpath("${path}").scrollIntoView(true);
    # Execute Javascript    window.scroll(0, document.querySelector("${path}").offsetTop - offset);
