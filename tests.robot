*** Settings ***
Library    SeleniumLibrary
Library    browserstack_config.py
Library    String
Test Teardown    Run Keyword If Test Failed    Capture Page Screenshot

*** Variables ***
${PARABANK_URL}     https://parabank.parasoft.com/parabank/index.htm
${VALID_USERNAME}   akash7
${VALID_PASSWORD}   akash8
${BROWSER}          Chrome

*** Test Cases ***
Successful Account Login
    [Documentation]    Verify user can login
    Open Browser To ParaBank
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Accounts Overview Page Loaded

Balance Check
    [Documentation]    View account balance
    Open Browser To ParaBank
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    ${balance}=    Get Account Balance
    Log To Console    Account Balance: ${balance}
    Should Not Be Empty    ${balance}
    Logout From Application

*** Keywords ***
Open Browser To ParaBank
    ${remote_url}=    Get Browserstack Url
    ${options}=    Get Browser Options    ${BROWSER}
    Open Browser    ${PARABANK_URL}    browser=${BROWSER.lower()}
    ...    remote_url=${remote_url}
    ...    options=${options}
    Set Window Size    1280    1024
    Set Selenium Timeout    30 seconds

Login With Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    name=username    timeout=30
    Input Text    name=username    ${username}
    Input Password    name=password    ${password}
    Click Button    css=input[value='Log In']

Verify Accounts Overview Page Loaded
    Wait Until Page Contains    Accounts Overview    timeout=30
    Wait Until Element Is Visible    id=accountTable    timeout=30

Get Account Balance
    Wait Until Element Is Visible    css=#accountTable tr:first-child td:nth-child(2)    timeout=30
    ${balance_text}=    Get Text    css=#accountTable tr:first-child td:nth-child(2)
    ${clean_balance}=    Replace String    ${balance_text}    $    ${EMPTY}
    ${clean_balance}=    Replace String    ${clean_balance}    ,    ${EMPTY}
    RETURN    ${clean_balance}

Logout From Application
    Click Link    css=a[href*='logout.htm']
    Wait Until Element Is Visible    name=username    timeout=30
