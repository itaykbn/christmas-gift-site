// gets form value by name(made for not duplicating code)
function getFormValueByName(name) {
    return document.forms["UpdateForm"][name].value;
}


// gets the year out of the date and returns it

// validate mail has correct structure and return false not
function validateMail(mail) {
    var hasDot = false;
    var hasAt = false;
    for (var i = 0; i < mail.length; i++) {
        if (mail[i] == ".") {
            hasDot = true;
        }

        if (mail[i] == "@") {
            hasAt = true;
        }

    }
    return (hasDot && hasAt)
}

// checks the password and returns true if error and false if not
function checkPassword(password, english, userNameRule) {

    var upperCase = false;
    var lowerCase = false;
    for (var i = 0; i < password.length; i++) {
        var isEnglish = english.test(password[i])
        if (password[i] == password[i].toUpperCase() && isEnglish) {
            upperCase = true


        }
        if (password[i] == password[i].toLowerCase() && isEnglish) {
            lowerCase = true;
        }
    }
    var isUpperIsLower = upperCase && lowerCase;
    var validLength = password.length > 6 && password.length < 10;
    var validPassword = !(userNameRule.test(password) && isUpperIsLower && validLength);
    return validPassword
}

// checks the element ,decides wether to show the error block and returns if there is an error
function checkElem(id, isCurrentError, isPrevError) {
    var errorP = document.getElementById(id);
    if (isCurrentError) {
        errorP.style.display = 'block';
    } else {
        errorP.style.display = 'none';
    }
    return (isPrevError || isCurrentError)
}

// validates the form and returns true if there are no errors and false if there are
function validateForm() {
    var fName = getFormValueByName("fname");
    var lName = getFormValueByName("lname");
    var password = getFormValueByName("pass");
    var mail = getFormValueByName("mail");
    var phone = getFormValueByName("phone");
    var passConf = getFormValueByName("passConf");
    const hebrew = new RegExp(/^[\u0590-\u05FF ,.'-]+$/i);
    const english = new RegExp(/^[a-zA-Z]+$/i);
    const userNameRule = new RegExp(/^[a-zA-Z0-9_]+$/i);

    var validPasswordConfirmation = (password != passConf);
    var isError = checkElem("passConf", validPasswordConfirmation, false);


    var validFName = !hebrew.test(fName);
    isError = checkElem("fName", validFName, isError);

    var validLName = !hebrew.test(lName);
    isError = checkElem("lName", validLName, isError);

    var validPassword = checkPassword(password, english, userNameRule);
    isError = checkElem("pass", validPassword, isError);

    var validMail = !validateMail(mail);
    isError = checkElem("mail", validMail, isError);

    var validPhone = !(phone.length == 10 && !isNaN(phone));
    if (phone == "" || phone == "No data") {
        validPhone = false;
    }

    isError = checkElem("phone", validPhone, isError);

    if (!isError) {
        return true;
    }

    return false;
}
