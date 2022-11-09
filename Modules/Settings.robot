*** Setting ***

Library	SeleniumLibrary	run_on_failure=SeleniumLibrary.CapturePageScreenshot
Library	Collections
#Library	XML
Library	String
# Library	XvfbRobot
Library	OperatingSystem
Library	DateTime
Library	../Script/generator.py
# Library	../Script/browsersession.py

*** Variables ***

${DELAY}	0.05
${remote_url}	None
${alias}	None
${blank_page}	data
# ${blank_page}	about:blank

*** Keywords ***
Test Case Setup	[Arguments]	${platform}	 ${env}   ${url}
	Set Selenium Speed	${DELAY}
	Run Keyword If	'${platform}'=='windows'	Setup Windows	${url}
	Run Keyword If	'${platform}'=='linux'	Setup Linux	 ${url}
	Run Keyword If	'${platform}'=='mac'	Setup Mac	${url}
	Set Global Variable	${env}


Setup Windows
	[Arguments]  ${url}
	Run keyword If	'${remote_url}'=='None'	 Open Browser	${url}	${browser}   options=add_argument("--ignore-certificate-errors")
	# Run keyword If  '${remote_url}'=='None'      Launch Chrome Without Bar
	...  ELSE	Open Browser	${url}	${browser}	${alias}	${remote_url}
	Run keyword If  '${remote_url}'=='None'  Maximize Browser Window
	...  ELSE    Set Window Size    1400    900

Setup Linux
	[Arguments]  ${url}
	Start Virtual Display	1400	900
#	Run keyword If	'${remote_url}'=='None'	Open Browser	${blank_page}	${browser}
	Run keyword If  '${remote_url}'=='None'      Launch Chrome Without Bar
	...  ELSE	Open Browser	${blank_page}	${browser}	${alias}	${remote_url}
	Run keyword If  '${remote_url}'=='None'  Maximize Browser Window
	...  ELSE    Set Window Size    1400    900

Setup Mac
	[Arguments]  ${url}
	Run keyword If	'${remote_url}'=='None'	Open Browser	${blank_page}	${browser}
	...  ELSE	Open Browser	${blank_page}	${browser}	${alias}	${remote_url}
	Run keyword If  '${remote_url}'=='None'  Maximize Browser Window
	...  ELSE    Set Window Size    1400    900

# Removes the chrome bar at the top which says "Chrome browser controlled by automation software"
Launch Chrome Without Bar
	${options}=	Evaluate	sys.modules['selenium.webdriver'].ChromeOptions()   sys, selenium.webdriver
	${prefs}	Create Dictionary   credentials_enable_service=${false}
	Call Method	${options}	add_experimental_option	prefs	${prefs}
	Call Method	${options}	add_argument	disable-infobars   #not working anymore in chrome 76
	# Call Method	${options}	add_argument	no-proxy-server
	Create WebDriver	Chrome	chrome_options=${options}


# Removes the chrome bar at the top which says "Chrome browser controlled by automation software"
Launch Chrome Headless
	${options}=	Evaluate	sys.modules['selenium.webdriver'].ChromeOptions()   sys, selenium.webdriver
	${prefs}	Create Dictionary   credentials_enable_service=${false}
	Call Method	${options}	add_experimental_option	prefs	${prefs}
	Call Method	${options}	add_argument	disable-infobars
	Call Method    ${options}   add_argument    headless
	Create WebDriver	Chrome	chrome_options=${options}

Launch Chrome Without Bar1
	${options}=	Evaluate	sys.modules['selenium.webdriver'].ChromeOptions()   sys, selenium.webdriver
	${prefs}	Create Dictionary   credentials_enable_service=${false}	useAutomationExtension=${false}	credentials_enable_service=${false}	profile.password_manager_enabled=${false}
	Call Method	${options}	add_experimental_option	prefs	${prefs}
	Call Method	${options}	add_argument	disable-infobars   #not working anymore in chrome 76
	Call Method	${options}	add_argument	no-proxy-server
	# Call Method	${options}	add_excluded_argument 	enable-automation
	Create WebDriver	Chrome	chrome_options=${options}

