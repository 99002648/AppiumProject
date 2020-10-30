*** Settings ***
Library    AppiumLibrary    

*** Test Cases ***
FBInvalidCredentialTest
    Log To Console    chromedriverExecutable=${EXECDIR}${/}driver${/}chromedriver.exe    
    Open Application    remote_url=http://localhost:4723/wd/hub    
    ...    platformName=android    deviceName=emulator    browserName=chrome
    ...    chromedriverExecutable=${EXECDIR}${/}driver${/}chromedriver.exe
    Go To Url    https://m.facebook.com/
    Input Text    //*[@id="m_login_email"]    vinu11223344@gmail.com
    Input Text    //*[@id="m_login_password"]    vinu1122334455
    Sleep    2s    
    Click Element    //*[@value="Log In"]
    Element Should Contain Text    //*[contains(text(),"Invalid")]    Invalid username or password
    
MagentoValidCredentialTest
    Log To Console    chromedriverExecutable=${EXECDIR}${/}driver${/}chromedriver.exe    
    Open Application    remote_url=http://localhost:4723/wd/hub    
    ...    platformName=android    deviceName=emulator    browserName=chrome
    ...    chromedriverExecutable=${EXECDIR}${/}driver${/}chromedriver.exe
    Set Appium Timeout    30s
    Go To Url    https://magento.com/
    Click Element    //*[@class="nav-menu-button js-menu-button visible-xs visible-sm"]
    Wait Until Element Is Visible    //*[text()="My Account"]
    Click Element    //*[text()="My Account"] 
    Wait Until Element Is Visible    //*[text()="Sign in"]    
    Input Text    //*[@id="email"]    balaji0017@gmail.com     
    Input Password    //*[@id="pass"]    welcome@12345   
    Hide Keyboard      
    Click Element    //*[@id="send2"]
    Sleep    2s      
    Close Application
        
