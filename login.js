// gets form value by name(made for not duplicating code)
function getFormValueByName(name) { 
    return document.forms["LoginForm"][name].value;
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
    var username = getFormValueByName("un");
    var password = getFormValueByName("pass");
    const english = new RegExp(/^[a-zA-Z]+$/i);
    const userNameRule = new RegExp(/^[a-zA-Z0-9_]+$/i);

    var validUserName = !userNameRule.test(username);
    var isError = checkElem("un", validUserName, isError);

    var validPassword = checkPassword(password, english, userNameRule);
    isError = checkElem("pass", validPassword, isError);

    if (!isError) {
        return true;
    }

    return false;
}