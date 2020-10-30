*** Settings ***
Library    AppiumLibrary    

*** Test Cases ***
InstallAppTest
    Open Application    remote_url=http://localhost:4723/wd/hub    
    ...    platformName=android    deviceName=emulator    
    ...    app=${EXECDIR}${/}app${/}Khan Academy_v6.2.1_apkpure.com.apk
    Set Appium Timeout    30s
    Wait Until Page Contains Element    //*[@text="Profile"]    
    Click Element    //*[@text="Profile"]
    Wait Until Element Is Visible    //*[@text="Sign in"]    
    Click Element    //*[@text="Sign in"]
    Input Text    //*[contains(@text,"username")]    vinu
    Input Text    //*[@text="Password"]    vinu
    
SignUpTest
    Open Application    remote_url=http://localhost:4723/wd/hub    
    ...    platformName=android    deviceName=emulator    
    ...    app=${EXECDIR}${/}app${/}Khan Academy_v6.2.1_apkpure.com.apk
    Set Appium Timeout    30s
    Wait Until Page Contains Element    //*[@text="Profile"]    
    Click Element    //*[@text="Profile"]
    Wait Until Element Is Visible    //*[@text="Sign in"]   
    Click Element    //*[@text="Sign up with email"]
    Wait Until Element Is Visible    //*[@text="Sign up"]
    Input Text    //*[@text="First name"]    abc
    Input Text    //*[@text="Last name"]    pqr
    Click Element    //*[@text="Birthday"]
    Wait Until Element Is Visible    //*[@text="OK"]  
    
    FOR    ${i}    IN RANGE    0    9999
        Click Element    //*[@resource-id="android:id/numberpicker_input"]  
        Clear Text    //*[@resource-id="android:id/numberpicker_input"]
        Input Text    //*[@resource-id="android:id/numberpicker_input"]    Apr    
        
        ${text}    Get Text    //*[@resource-id="android:id/numberpicker_input"]
        Exit For Loop If    '${text}'=='Apr'
    END
       
    FOR    ${i}    IN RANGE    0    9999
    Click Element    xpath=(//*[@resource-id="android:id/numberpicker_input"])[2]
    Clear Text    xpath=(//*[@resource-id="android:id/numberpicker_input"])[2]
    Input Text    xpath=(//*[@resource-id="android:id/numberpicker_input"])[2]    25    
    
    ${text1}    Get Text    xpath=(//*[@resource-id="android:id/numberpicker_input"])[2]
    Exit For Loop If    '${text1}'=='25'
    END    
     
    FOR    ${i}    IN RANGE    0    9999
    Click Element    xpath=(//*[@resource-id="android:id/numberpicker_input"])[3]
    Clear Text    xpath=(//*[@resource-id="android:id/numberpicker_input"])[3]
    Input Text    xpath=(//*[@resource-id="android:id/numberpicker_input"])[3]    1998    
    
    ${text2}    Get Text    xpath=(//*[@resource-id="android:id/numberpicker_input"])[3]
    Exit For Loop If    '${text2}'=='1998'
    END
      
    Click Element    //*[@text="OK"]
    Input Text    //*[@text="Email address"]    abc.pqr@ltts.com
    Input Text    //*[@text="Password"]    Abc@123#45
    Click Element    //*[@text="CREATE"]
    Close Application
    
SwipelTest
    Open Application    remote_url=http://localhost:4723/wd/hub    
    ...    platformName=android    deviceName=emulator    
    ...    app=${EXECDIR}${/}app${/}Khan Academy_v6.2.1_apkpure.com.apk
    Set Appium Timeout    30s
    Wait Until Page Contains Element    //*[@text="Sign in"]    
    Sleep    2s    
    FOR    ${i}    IN RANGE    0    9999
        ${ele}    Run Keyword And Ignore Error    Get Webelements    //*[contains(@text,'Art')]
        Exit For Loop If    '${ele}[0]'=='PASS'
        Swipe By Percent    50    75    50    25    1000    
    END
    Click Element    //*[contains(@text,'Art')]
    
OpenExistingApplicationTest
    Open Application    remote_url=http://localhost:4723/wd/hub    
    ...    platformName=android    deviceName=emulator 
    ...    appPackage=org.khanacademy.android    appActivity=org.khanacademy.android.ui.library.MainActivity
    ...    noReset=true
    Set Appium Timeout    30s

    
    
    
    