## Installation

### Overview
- 'Google Chrome Browser'
- 'Python 3.4'
- 'Robot Framework'
- 'ChromeDriver'


#### Python

Python 3.11.0 is the recommended version to be used with this Robot Automation framework.

Download: https://www.python.org/downloads/

#### Robot Framework

Once the Python has been installed you can then use 'PIP' to install the Robot Framework itself.

To use the PIP you will need to open CMD or Terminal and enter the following command:

```bash
$ pip install robotframework
```

#### SeleniumLibrary

You will now need to install the Selenium2 library to execute the tests themselves.

To use the PIP you will need to open CMD or Terminal and enter the following command:

```bash
$ pip install robotframework-SeleniumLibrary
```

#### ChromeDriver

The ChromeDriver will allow the tests to be executed in the Chrome Browser iteself.

Download: https://sites.google.com/a/chromium.org/chromedriver/downloads

Setup instructions can be found here: https://sites.google.com/a/chromium.org/chromedriver/getting-started

# NOTE 
In My machine i am using Chrome version 107.0.5304.88 (Official Build) (64-bit) and this chromedriver supports this version. If you are using different versions you need to download the respective chromedriver to run



# Run Command: -->
robot -d reports -T -i smoke -V vars/preprod.yaml -v remote_url:None  TestCases/Smoke/demo_test_1_bdd.robot 

Note: Navigate to the project Folder path in commamd promt and run using the above run command 

# Reports

Reports will be generated in the Report Folder 

Note: My last test results are in the folder (For your reference)

# one click install
Pip install -r requirements.txt




TESTS:

Web Automation

Environment: https://www.cimb.com.my/en/personal/home.html
Scenario 1: 
Given I’m on CIMB page
When I select CIMB Deals
And I click on View All for Travel & Lifestyle
And I explore more on TGV Cinemas for movies ticket offer
Then I will be able to see and verify its details and other similar deals beneath it

Environment: https://www.cimb.com.sg/en/personal/home.html 
Scenario 2:
Given I’m on CIMB page
And I navigate to Tools page from menu
When I access to Education Loan Calculator (Standard Repayment) 
And I have inputted all necessary values
Then I will be able to see the Monthly Installment, Interest Rate, Total Interest Charged and Total Payment Amount
And I will be able to see an example table of the standard repayment

Requirement:
	Test Report
	ReadMe – about your test and how to execute, etc
	Flexibility and Scalability for your test script
Bonus:
	Proper Structured Framework
	No restricted on framework or language, best if you could use BDD 



API Automation

Go through this https://developer.todoist.com/rest/v2#overview 
USERNAME: wong.afiq.1234@gmail.com
PASSWORD: Thi$1sTest

1.	Create a New Project and verify the project created successfully
2.	Create a New Task under the project and verify it’s created successfully
3.	Update the task content

Please make sure the test is flexible to re-run, and necessary tests for the endpoints

Requirement:
	Test Report
 
> curl -X GET https://api.todoist.com/rest/v1/projects -H "Authorization: Bearer f3b085e6fa8b41f202e9be0173367cc8f6cc1817"


# Run Command: -->
robot -d reports -T -i smoke -V vars/preprod.yaml -v remote_url:None  TestCases/Smoke/demo_test_API.robot 

Note: Navigate to the project Folder path in commamd promt and run using the above run command 


# Note

I have also created a collection in Postman for the API testing and you can access the collection using below link

https://red-moon-599797.postman.co/workspace/0ea77130-e9ca-4fbc-acfa-b17292ecb793/collection/7777911-ed636e8a-1e71-4791-8238-fbbe866849df?action=share&creator=7777911

