*** Settings ***
Library   SeleniumLibrary
Resource    deactivate.robot

*** Variable ***
${login_btn}            dt_login_button
${email_field}          name=email
${pword_field}          //*[@type="password"]
${login_oauth_btn}      //*[text()="Log in"]
${check_box}            //*[@class="dc-checkbox__box"]
${uncheck_box}          //*[@class="dc-icon dc-icon--active"]
${continue_btn}         //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large"]
${goback_btn}           //*[@id="modal_root"]/div/div/div/div[2]/button[1]
${deactivate_btn}       //*[@id="modal_root"]/div/div/div/div[2]/button[2]



*** Test Cases ***
Open Deriv
    Login   ${deactivate_email}    ${deactivate_pw}  #to pass into secret.txt
    GetToDeactivatePage
    ChooseReason
    ChangeOfMind
    ProceedToDeactivation
