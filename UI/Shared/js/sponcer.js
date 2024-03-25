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









