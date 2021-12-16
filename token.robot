*** Settings ***
Documentation   Suite description
Library   SeleniumLibrary


*** Keyword ***
Login
      [arguments]   ${email}    ${pw}   #to pass into apitest.robot
	  Open Browser    url=https://app.deriv.com   browser=chrome
	  set window size   2000   1150
      wait until page does not contain element  dt_core_header_acc-info-preloader       60
	  wait until page contains element  ${login_btn}    60
	  click element   ${login_btn}
	  wait until page contains element  ${email_field}     15
	  input text      ${email_field}    ${email}
	  input text      ${pword_field}      ${pw}
	  # to use this // above, type it in find section in inspect
	  click element      ${login_oauth_btn}

GettoAPITokenPage
      wait until page does not contain element      dt_core_header_acc-info-preloader       60
      sleep   5
      click element     //*[@id="dt_core_header_acc-info-container"]/div[2]/div/div/span/a
      wait until page contains element   //*[@id="dc_api-token_link"]

ScopeSelection
      click element     //*[@id="dc_api-token_link"]
#      wait until page contains      //*[@class="da-api-token__timeline"]
      sleep     3
      click element   ${check_box}
      click element   ${check_box}
      click element   ${check_box}
      click element   ${check_box}
      click element   ${check_box}

ScopeUnselection
      sleep     1
      click element   ${uncheck_box}
      click element   ${uncheck_box}
      click element   ${uncheck_box}
      click element   ${uncheck_box}

ClearInputField
    [arguments]     ${input_field}
    Wait Until Page Contains Element    ${input_field}    5
    ${current_value}=    Get Element Attribute    ${input_field}    value
    ${value_length}=    Get Length    ${current_value}
    # sometimes text cursor starts from the middle, so delete front and back characters
    Repeat Keyword    ${value_length}    Press Keys    ${input_field}   BACKSPACE
    Repeat Keyword    1   Press Keys    ${input_field}   DELETE

CreateTokenName
      click element     ${token_name}
      input text        ${token_name}       A
      sleep     1
      ClearInputField   ${token_name}
      sleep     2
      input text        ${token_name}       qazwsxedcrfvtgbyhnujmikolpqwertyu
      sleep     1
      ClearInputField   ${token_name}
      sleep     2
      input text        ${token_name}       API Token Automation
      click button      ${create_btn}

DeleteToken
      sleep         5
      click button      ${delete_btn}
      wait until page contains element      //*[@class="dc-btn__group"]     60
      click button      ${yes_btn}









