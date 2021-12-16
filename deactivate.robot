*** Settings ***
Documentation   Suite description
Library   SeleniumLibrary


*** Keyword ***
Login
      [arguments]   ${email}    ${pw}   #to pass into deactivateacc.robot
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

GetToDeactivatePage
      wait until page does not contain element      dt_core_header_acc-info-preloader       60
      sleep   5
      click element     //*[@id="dt_core_header_acc-info-container"]/div[2]/div/div/span/a
      wait until page contains element   //*[@id="dc_deactivate-account_link"]
      click element     //*[@id="dc_deactivate-account_link"]
      click element     //*[@class="dc-btn dc-btn--primary dc-btn__large deactivate-account__button"]

ChooseReason
      click element   ${check_box}
      click element   ${check_box}
      click element   ${uncheck_box}
      click element   ${uncheck_box}
      sleep     2
      click element   ${check_box}
      click element   ${continue_btn}

ChangeOfMind
      sleep     3
      click element   ${goback_btn}

ProceedToDeactivation
      click element   ${continue_btn}
      sleep     3
      click element   ${deactivate_btn}


