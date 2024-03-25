function Sponcer() {
    try {
        var sponcer = {};
        sponcer.First_name = $("[id*=First_name]").val() || '';
        sponcer.Last_name = $("[id*=Last_name]").val() || '';
        sponcer.Description = $("[id*=description]").val() || '';
        sponcer.Website = $("[id*=website]").val() || '';
        sponcer.Email = $("[id*=email]").val() || '';
        sponcer.Phone = $("[id*=phone]").val() || '';

        var Logo = '';
        var Logo = $("[id*=logo]")[0].files[0];
        console.log(Logo);

        if (Logo) {
            sponcer.Logo = Logo.name;
        } else {
            sponcer.Logo = 'null';
        }

        var DTO1 = { "Course": sponcer };
        var paramUrl1 = '/UI/Module/dashboard/create_sponcers.aspx/SaveSponcerMaster';
        var paramType1 = "POST";
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
        window.location.href = '/UI/Module/dashboard/sponcer1.aspx';
    }, 7000); // 7000 milliseconds = 7 seconds

    // Cancel the default click behavior for ".yes" buttons
    return false;
}





