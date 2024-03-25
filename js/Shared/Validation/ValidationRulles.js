
function lettersonly($jFVNew) {
    $jFVNew.validator.addMethod("lettersonly", function (value, element) {
        return this.optional(element) || /^[a-zA-Z\s]+$/i.test(value);
    }, "Letters only please");
}
function CheckDate($jFVNew) {
    $jFVNew.validator.addMethod("CheckDate", function (value, element) {
        if (value != '') {
            var parts = value.split("-");
            if ((Number(parts[1])) >= 13 || Number(parts[0]) > 32 || Number(parts[1]) < 1 || Number(parts[0]) < 1) {
                return false;
            }
            var d1 = new Date(Number(parts[2]), Number(parts[1]) - 1, Number(parts[0]));
            var d = new Date(Date.parse(d1));
            var fullDate = new Date()
            var minDateVal = new Date(1947, 02, 02);
            var IsValidDate = true;
            if (d1 > fullDate || d1 < minDateVal || d1.toString() == "Invalid Date") {
                IsValidDate = false;
            }
            return this.optional(element) || IsValidDate;
        }
    }, "Date Format or Date is invalid");
}
function CheckDateFormat($jFVNew) {
    $jFVNew.validator.addMethod("CheckDateFormat", function (value, element) {
        if (value == '')
        {
            return true;
        }
        if (value != '') {
            var parts = value.split("-");
            if ((Number(parts[1])) >= 13 || Number(parts[0]) > 32 || Number(parts[1]) < 1 || Number(parts[0]) < 1 || Number(parts[2]) > 9999) {
                return false;
            }
            var d1 = new Date(Number(parts[2]), Number(parts[1]) - 1, Number(parts[0]));
            var d = new Date(Date.parse(d1));            
            var minDateVal = new Date(1947, 02, 02);            
            var IsValidDate = true;
            if (d1 < minDateVal || d1.toString() == "Invalid Date") {
                IsValidDate = false;
            }
            return this.optional(element) || IsValidDate;
        }
    }, "Date Format invalid");
}
function CheckDateDOB($jFVNew) {
    $jFVNew.validator.addMethod("CheckDateDOB", function (value, element) {
        var parts = value.split("-");
        if ((Number(parts[1])) >= 13 || Number(parts[0]) > 32||Number(parts[1]) <1||Number(parts[0])<1) {
            return false;
        }
        var d1 = new Date(Number(parts[2]), Number(parts[1]) - 1, Number(parts[0]));
        var d = new Date(Date.parse(d1));
        var fullDate = new Date()
        fullDate.setFullYear(fullDate.getFullYear() - 6);
        var minDateVal = new Date(1947, 02, 02);
        var IsValidDate = true;
        if (d1 > fullDate || d1 < minDateVal || d1.toString() == "Invalid Date") {
            IsValidDate = false;
        }
        return this.optional(element) || IsValidDate;
    }, "Date Format or Date is invalid");
}

// Added By KR 28-07-2015 Start 

function CheckDateStudentDOB($jFVNew) {
    $jFVNew.validator.addMethod("CheckDateStudentDOB", function (value, element) {
        var parts = value.split("-");
        if ((Number(parts[1])) >= 13 || Number(parts[0]) > 32 || Number(parts[1]) < 1 || Number(parts[0]) < 1) {
            return false;
        }
        var d1 = new Date(Number(parts[2]), Number(parts[1]) - 1, Number(parts[0]));
        var d = new Date(Date.parse(d1));
        var fullDate = new Date()
        fullDate.setFullYear(fullDate.getFullYear() - 16);
        var minDateVal = new Date(1947, 02, 02);
        var IsValidDate = true;
        if (d1 > fullDate || d1 < minDateVal || d1.toString() == "Invalid Date") {
            IsValidDate = false;
        }
        return this.optional(element) || IsValidDate;
    }, "Invalid Date (or) Selected date should be less than 16 years from current year");
}


function CheckDateStaffDOB($jFVNew) {
    $jFVNew.validator.addMethod("CheckDateStaffDOB", function (value, element) {
        var parts = value.split("-");
        if ((Number(parts[1])) >= 13 || Number(parts[0]) > 32 || Number(parts[1]) < 1 || Number(parts[0]) < 1) {
            return false;
        }
        var d1 = new Date(Number(parts[2]), Number(parts[1]) - 1, Number(parts[0]));
        var d = new Date(Date.parse(d1));
        var fullDate = new Date()
        fullDate.setFullYear(fullDate.getFullYear() - 18);
        var minDateVal = new Date(1947, 02, 02);
        var IsValidDate = true;
        if (d1 > fullDate || d1 < minDateVal || d1.toString() == "Invalid Date") {
            IsValidDate = false;
        }
        return this.optional(element) || IsValidDate;
    }, "Invalid Date (or) Selected date should be less than 18 years from current year");
}
// Added By KR 28-07-2015 End 

function board($jFVNew) {
    $jFVNew.validator.addMethod("board", function (value, element) {
        return this.optional(element) || /^[a-zA-Z\s.,-]+$/i.test(value);        
    }, "Invalid Name");
}

function emailvalidation($jFVNew) {
    $jFVNew.validator.addMethod("emailvalidation", function (value, element) {
        return this.optional(element) || /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i.test(value);
    }, "Please Enter valid email address");
}

function dateComparisonPrior($jFVNew) {

    $jFVNew.validator.addMethod("dateComparisonPrior", function (value, element) {
        var result = true;
        if ($("#txtFrom").val() != '' && $("#txtTo").val() != '') {
            var parts = $("#txtFrom").val().split("-");
            var inDate = new Date(Number(parts[2]), Number(parts[1]) - 1, Number(parts[0]));

            var parts1 = $("#txtTo").val().split("-");
            var eDate = new Date(Number(parts1[2]), Number(parts1[1]) - 1, Number(parts1[0]));


            if (inDate > eDate) {
                result = false;
            }
        }

        return result;

    }, "The ending date must be a later date than the start date");
}
function phonevalidation($jFVNew) {
    $jFVNew.validator.addMethod("phonevalidation", function (value, element) {
        return this.optional(element) || /^[5-9][0-9]{9}$/.test(value);
    }, "Invalid Mobile Number");
}
function altmobilenumber($jFVNew) {
    $jFVNew.validator.addMethod("altmobilenumber", function (value, element) {
        return this.optional(element) || /^[1-9][0-9]{5,}$/.test(value);
    }, "Invalid Mobile Number");
}
function landlineno($jFVNew) {
    $jFVNew.validator.addMethod("landlineno", function (value, element) {
        return this.optional(element) || /^[1-9][0-9]{9}$/.test(value);
    }, "Invalid Landline Number");
}
function landnumber($jFVNew) {
    $jFVNew.validator.addMethod("landnumber", function (value, element) {
        return this.optional(element) || /^[1-9][0-9]{15}$/.test(value);
    }, "Please specify a valid phone number");
}


function drivinglicensenumber($jFVNew) {
    $jFVNew.validator.addMethod("drivinglicensenumber", function (value, element) {
        return this.optional(element) || /^[A-Z]{2}[0-9/\-\\]+$/i.test(value);
    }, "Invalid Driving License number");
}

