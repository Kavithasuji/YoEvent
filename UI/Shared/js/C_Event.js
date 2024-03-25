//CREATED BY : B.LOKESH
//ON:09-01-2024
//FOR: CREATE EVENT 


function Cevent()
{
    try {
        var saveEvent = {};
        saveEvent.E_Name = $("[id*=event_name]").val() || '';
        saveEvent.E_Description = $("[id*=description]").val() || '';
        saveEvent.E_Sdate = $("[id*=E_Sdate]").val() || '';
        saveEvent.E_Edate = $("[id*=E_Edate]").val() || '';
        saveEvent.E_Venue = $("[id*=venue]").val() || '';
        saveEvent.E_LocationLink = $("[id*=location_link]").val() || '';
        saveEvent.E_Type = $("[id*=Event_Type]").val() || '';
        saveEvent.E_Mode = $("[id*=Event_Mode]").val() || '';
        saveEvent.E_Seat = $("[id*=seating_capacity]").val() || '';
        saveEvent.E_RegisterLink = $("[id*=registration_link]").val() || '';
        saveEvent.E_Stime = $("[id*=E_Stime]").val() || '';
        saveEvent.E_Etime = $("[id*=E_Etime]").val() || '';
    
        var E_BannerImg = $("[id*=banner_image]")[0].files[0];
        var E_Icon = $("[id*=event_icon]")[0].files[0];
        var E_FloorMap = $("[id*=floor_map]")[0].files[0];

        if (E_BannerImg) {
            saveEvent.E_BannerImg = E_BannerImg.name; 
        } else {
            saveEvent.E_BannerImg = 'null';
        }

        if (E_Icon) {
            saveEvent.E_Icon = E_Icon.name;
        } else {
            saveEvent.E_Icon = 'null';
        }

        if (E_FloorMap) {
            saveEvent.E_FloorMap = E_FloorMap.name;
        } else {
            saveEvent.E_FloorMap = 'null';
        }

        var DTO1 = { "Course": saveEvent };
        var paramUrl1 = '/UI/Module/dashboard/C_Event.aspx/SaveEventMaster';
        var paramType1 = "POST";
        /*console.log(status);*/
        var saveSuccess = function (data) {
            console.log(data.d);
            var status = JSON.parse(data.d);
            console.log(status);
        };

        CallDBOFrontEndFunction(paramUrl1, paramType1, DTO1, saveSuccess);
    } catch (e) {
        console.error(e);
    }

    //var validationPasses = true; // Assume validation passes initially

    //// Check if any required fields are empty
    //if ($("[id*=event_name]").val() === '' ||
    //    $("[id*=description]").val() === '' ||
    //    $("[id*=E_Sdate]").val() === '' ||
    //    $("[id*=E_Edate]").val() === '' ||
    //    $("[id*=venue]").val() === '' ||
    //    $("[id*=location_link]").val() === '' ||
    //    $("[id*=Event_Type]").val() === '' ||
    //    $("[id*=Event_Mode]").val() === '' ||
    //    $("[id*=seating_capacity]").val() === '' ||
    //    $("[id*=registration_link]").val() === '') {
    //    validationPasses = false; // Validation fails if any required field is empty
    //}

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
