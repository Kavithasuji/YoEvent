function Sevent() {
    try {
        var saveEvent = {};
        saveEvent.S_Event = $("[id*=S_Ename]").val() || '';
        saveEvent.S_Description = $("[id*=description]").val() || '';
        saveEvent.S_Sdate = $("[id*=E_Sdate]").val() || '';
        saveEvent.S_Edate = $("[id*=E_Edate]").val() || '';
        saveEvent.S_Stime = $("[id*=E_Stime]").val() || '';
        saveEvent.S_Etime = $("[id*=E_Etime]").val() || '';
        saveEvent.S_Venue = $("[id*=venue]").val() || '';
        saveEvent.S_Room = $("[id*=S_Room]").val() || '';
        saveEvent.S_Sponsor = $("[id*=S_Sponcer]").val() || '';
        saveEvent.S_Organizer = $("[id*=S_Organizer]").val() || '';



        var DTO1 = { "Course": saveEvent };
        var paramUrl1 = '/UI/Module/dashboard/SchedulePage.aspx/ScheduleEventMaster';
        var paramType1 = "POST";
        //console.log(status);
        var saveSuccess = function (data) {
            console.log(data.d);
            var status = JSON.parse(data.d);
            console.log(status);
        };

        CallDBOFrontEndFunction(paramUrl1, paramType1, DTO1, saveSuccess);
    } catch (e) {
        console.error(e);
    }
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
