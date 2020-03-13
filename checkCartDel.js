// gets form value by name(made for not duplicating code)
function getFormValueByName(name) {
    return document.forms["delCart"][name].value;
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
    var number = getFormValueByName("delId");
    validNumber = isNaN(number)
    isError = false;
    var isError = checkElem("delId", validNumber, isError);

    if (!isError) {
        return true;
    }

    return false;
}