//// Function to save registered people
//function Saveregisterpeople() {
//    var SaveCourse = {};
//    SaveCourse.User_Type = "Organization";
//    SaveCourse.User_Name = $("[id*=name]").val();
//    SaveCourse.Mobile_Number = $("[id*=phone]").val();
//    SaveCourse.Email = $("[id*=email]").val();
//    SaveCourse.Password = $("[id*=pwd]").val();
//    SaveCourse.Confirm_Password = $("[id*=Conpwd]").val();
//    SaveCourse.Person_type = $("[id*=Persontype]").val(); // Corrected variable name
//    SaveCourse.Per_status = $("[id*=rbActive]").prop("checked") ? "Active" : "Inactive";

//    var DTO1 = { "Course": SaveCourse };
//    var paramUrl1 = '/UI/Module/dashboard/C_user.aspx/SaveUserMaster';
//    var paramType1 = "POST";

//    var SaveSuccess = function (data) {
//        console.log(data.d);
//        var status = JSON.parse(data.d);
//        console.log(status);
//    };

//    CallDBOFrontEndFunction(paramUrl1, paramType1, DTO1, SaveSuccess);
//}





//function CallDBOFrontEndFunction(paramUrl, paramType, DTO, CallSuccess) {
//    var d = $.Deferred();

//    $.ajax({
//        contentType: "application/json; charset=utf-8",
//        data: JSON.stringify(DTO),
//        dataType: "json",
//        type: "POST",
//        url: paramUrl,
//        success: CallSuccess,
//        error: function (xhr) {
//            $("*").css("cursor", "default");

//            var readyState = {
//                1: "Loading",
//                2: "Loaded",
//                3: "Interactive",
//                4: "Complete"
//            };

//            if (xhr.readyState !== 0 && xhr.status !== 0 && xhr.responseText !== undefined) {
//                console.log("readyState: " + readyState[xhr.readyState] + "\n status: " + xhr.status + "\n\n responseText: " + xhr.responseText);
//            }

//        }

//    });

//    // Return a promise
//    return d.promise();
//}

// Function to save registered people
function Saveregisterpeople() {
    try {
        var SaveCourse = {};
        SaveCourse.User_Type = "Organization";
        SaveCourse.User_Name = $("[id*=name]").val();
        SaveCourse.Mobile_Number = $("[id*=phone]").val();
        SaveCourse.Email = $("[id*=email]").val();
        SaveCourse.Password = $("[id*=pwd]").val();
        SaveCourse.Confirm_Password = $("[id*=Conpwd]").val();
        SaveCourse.Person_type = $("[id*=Persontype]").val(); // Corrected variable name
        SaveCourse.Per_status = $("[id*=rbActive]").prop("checked") ? "Active" : "Inactive";

        var DTO1 = { "Course": SaveCourse };
        var paramUrl1 = '/UI/Module/dashboard/C_user.aspx/SaveUserMaster';
        var paramType1 = "POST";

        var SaveSuccess = function (data) {
            try {
                console.log(data.d);
                var status = JSON.parse(data.d);
                console.log(status);
            } catch (parseError) {
                console.error("Error parsing JSON response:", parseError);
            }
        };

        CallDBOFrontEndFunction(paramUrl1, paramType1, DTO1, SaveSuccess);
    } catch (error) {
        console.error("Error in Saveregisterpeople function:", error);
    }
}

function CallDBOFrontEndFunction(paramUrl, paramType, DTO, CallSuccess) {
    try {
        var d = $.Deferred();

        $.ajax({
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(DTO),
            dataType: "json",
            type: "POST",
            url: paramUrl,
            success: CallSuccess,
            error: function (xhr) {
                $("*").css("cursor", "default");

                var readyState = {
                    1: "Loading",
                    2: "Loaded",
                    3: "Interactive",
                    4: "Complete"
                };

                if (xhr.readyState !== 0 && xhr.status !== 0 && xhr.responseText !== undefined) {
                    console.log("readyState: " + readyState[xhr.readyState] + "\n status: " + xhr.status + "\n\n responseText: " + xhr.responseText);
                }

            }
        });

        // Return a promise
        return d.promise();
    } catch (error) {
        console.error("Error in CallDBOFrontEndFunction:", error);
    }
}
