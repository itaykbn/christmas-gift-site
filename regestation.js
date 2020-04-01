// gets form value by name(made for not duplicating code)
function getFormValueByName(name) {
    return document.forms["RegestrationForm"][name].value;
}

// writes a message in html
function insertText(msg) {
    document.getElementById("age").innerHTML = msg;
}

// gets the year out of the date and returns it
function GetYear(date) {
    var slashCount = 0
    var startInsert = false
    var year = "";
    for (var i = 0; i < date.length; i++) {
        if (startInsert == true) {
            year += date[i];
        }
        if (date[i] == "/") {
            slashCount++;
        }
        if (slashCount == 2) {
            startInsert = true
        }
    }
    return year
}

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
    var YearOBirth = GetYear(getFormValueByName("bd"));
    var username = getFormValueByName("un");
    var password = getFormValueByName("pass");
    var mail = getFormValueByName("mail");
    var phone = getFormValueByName("phone");
    var passConf = getFormValueByName("passConf");
    const hebrew = new RegExp(/^[\u0590-\u05FF ,.'-]+$/i);
    const english = new RegExp(/^[a-zA-Z]+$/i);
    const userNameRule = new RegExp(/^[a-zA-Z0-9_]+$/i);

    var validPasswordConfirmation = !(password == passConf);
    var isError = checkElem("passConf", validPasswordConfirmation, false);

    var validGender = document.getElementById('gender_Male').checked == false && document.getElementById('gender_Female').checked == false && document.getElementById('gender_Other').checked == false;
    isError = checkElem("gender", validGender, isError);
    var validFName = !hebrew.test(fName);
    isError = checkElem("fName", validFName, isError);



    var validLName = !hebrew.test(lName);
    isError = checkElem("lName", validLName, isError);

    var validBirthDate = YearOBirth < 1960 || isNaN(YearOBirth) && YearOBirth.length != 4;
    isError = checkElem("db", validBirthDate, isError);
    if (!validBirthDate) {
        var d = new Date();
        var now = d.getFullYear();
        insertText(now - YearOBirth)
    }
    var validUserName = !userNameRule.test(username);
    isError = checkElem("un", validUserName, isError);

    var validPassword = checkPassword(password, english, userNameRule);
    isError = checkElem("pass", validPassword, isError);
    var validMail = !validateMail(mail);
    isError = checkElem("mail", validMail, isError);
    var validPhone = !(phone.length == 10 && !isNaN(phone));
    if (phone == "") {
        validPhone = false;
    }
    isError = checkElem("phone", validPhone, isError);



    if (!isError) {
        return true;
    }

    return false;
}
