

###How to run web test
    
    install python 
    
    pip install robotframework

    robot --version
       
    pip install --upgrade robotframework-seleniumlibrary
    

Setup Webdriver 
Windows CLI #

    Get familiar with Windows Environment Variables in Command Prompt
    
    Create directory C:\bin
    Download it for Windows and save to C:\bin
    
    Open Command Prompt and set the PATH for your account with

    setx PATH "C:\bin;%PATH%"

    Restart Command Prompt
    Verify setup with

    chromedriver.exe -v
    
Run
    
    robot delete-cart.robot 
or

    robot .
