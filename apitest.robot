*** Settings ***
Library   SeleniumLibrary
Resource    token.robot

*** Variable ***
${login_btn}            dt_login_button
${email_field}          name=email
${pword_field}          //*[@type="password"]
${login_oauth_btn}      //*[text()="Log in"]
${check_box}            //*[@class="dc-checkbox__box"]
${uncheck_box}          //*[@class="dc-icon dc-icon--active"]
${token_name}           //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/div/input
${create_btn}           //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/button
${delete_btn}           //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr/td[5]/button
${yes_btn}              //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr[1]/td[5]/div/button[2]


*** Test Cases ***
Open Deriv
    Login   ${my_email}    ${my_pw}  #to pass into secret.txt
    GettoAPITokenPage
    ScopeSelection
    ScopeUnselection
    CreateTokenName
    DeleteToken
