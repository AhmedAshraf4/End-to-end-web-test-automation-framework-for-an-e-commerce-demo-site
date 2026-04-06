*** Variables ***
${CHECKOUT_FIRST_NAME}           id:first-name
${CHECKOUT_LAST_NAME}            id:last-name
${CHECKOUT_POSTAL_CODE}          id:postal-code
${CHECKOUT_CONTINUE_BUTTON}      id:continue
${CHECKOUT_FINISH_BUTTON}        id:finish
${CHECKOUT_ERROR_MESSAGE}        xpath://h3[@data-test='error']
${CHECKOUT_OVERVIEW_TITLE}       xpath://span[text()='Checkout: Overview']
${CHECKOUT_COMPLETE_TEXT}        Thank you for your order!
${CHECKOUT_ITEM_TOTAL}           class:summary_subtotal_label