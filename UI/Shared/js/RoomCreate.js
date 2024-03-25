function C_Room() {
    try {
        var Room = {};
        Room.Name = $("[id*=name]").val() || '';
        Room.Description = $("[id*=description]").val() || '';
        Room.Event_Venue = $("[id*=venue]").val() || '';
        Room.Location_Link = $("[id*=location_link]").val() || "";
        Room.Event_type = $("[id*=event_type]").val() || "";
        Room.Equipment = $("[id*=Equipment]").val() || "";
        Room.Seat = $("[id*=seating_capacity]").val() || "";
        Room.Room_Img = $("[id*=Room_Img]").val() || "";

        var DTO1 = { "Course": Room };
        var paramUrl1 = '/UI/Module/dashboard/Room_Count.aspx/SaveRoomMaster';
        var paramType1 = "POST";
        /*console.log(status);*/
        var saveSuccess = function (data) {
            console.log(data.d);
            var status = JSON.parse(data.d);
            console.log(status);
        }

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

function functionAlert(msg, myYes) {
    var confirmBox = $("#confirm");
    confirmBox.find(".message").text(msg);

    confirmBox.find(".yes").unbind().click(function () {
        confirmBox.hide();
    });

    // Attach the provided click event handler
    confirmBox.find(".yes").click(myYes);

    // Show the confirm box
    confirmBox.show();

    // Set a timeout to hide the confirm box after 7 seconds
    setTimeout(function () {
        confirmBox.hide();
        // Redirect after 7 seconds
        window.location.href = '/UI/Module/dashboard/RoomList.aspx';
    }, 7000); // 7000 milliseconds = 7 seconds

    // Cancel the default click behavior for ".yes" buttons
    return false;
}

