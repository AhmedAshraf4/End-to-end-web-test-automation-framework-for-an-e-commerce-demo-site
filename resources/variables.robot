*** Settings ***
Resource    env/dev.robot

*** Variables ***
${URL}                 ${BASE_URL}
${BROWSER}             chrome

${VALID_USERNAME}      standard_user
${VALID_PASSWORD}      secret_sauce
${LOCKED_USERNAME}     locked_out_user
${INVALID_PASSWORD}    wrong_password

${FIRSTNAME}           Ahmed
${LASTNAME}            Ashraf
${POSTALCODE}          12345

${EMPTY}
${LOGIN_DATA_FILE}     ${CURDIR}/../data/login_data.csv