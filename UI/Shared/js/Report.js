function report() {
    try {
        var report = {};
        report.Event_Name = $("[id*=event_name]").val() || '';
        report.User_Name = $("[id*=User_name]").val() || '';
        report.R_description = $("[id*=description]").val() || '';

        var DTO1 = { "Course": report };
        var paramUrl1 = '/UI/Module/dashboard/E_Report.aspx/SaveReportMaster';
        var paramType1 = "POST";
        
        var saveSuccess = function (data) {
            try {
                console.log(data.d);
                var status = JSON.parse(data.d);
                console.log(status);
            } catch (e) {
                console.error(e);
            }
        };

        CallDBOFrontEndFunction(paramUrl1, paramType1, DTO1, saveSuccess);
    } catch (e) {
        console.error(e);
    }
    var event_name = document.getElementById("event_name");
    var user_name = document.getElementById("User_name");
    var description = document.getElementById("description");

    if (event_name) event_name.value = "";
    if (user_name) user_name.value = "";
    if (description) description.value = "";
}

function CallDBOFrontEndFunction(paramUrl, paramType, DTO, CallSuccess) {
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

    return d.promise();
}
