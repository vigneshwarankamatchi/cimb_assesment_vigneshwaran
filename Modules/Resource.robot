*** Setting ***

Library	    SeleniumLibrary	run_on_failure=SeleniumLibrary.CapturePageScreenshot
Library	    Collections
#Library	XML
Library	    String
# Library	XvfbRobot
Library	    OperatingSystem
Library	    DateTime
Library    Collections
Library    RequestsLibrary
Library    SeleniumLibrary
Library    String
Library	../Script/generator.py

Resource    ../Modules/Basic.robot
Resource    ../Modules/Settings.robot
Resource    ../Modules/homepage.robot

# Library    ${CURDIR}/web-automation/Script/generator.py
Library    ${EXECDIR}/Script/generator.py
# Library    /Users/rameshjagannathan/Documents/web-automation/Script/generator.py
# Library     DebugLibrary
# Library     FakerLibrary
Library    Process
# Library    RedisLibrary
Library    OperatingSystem


