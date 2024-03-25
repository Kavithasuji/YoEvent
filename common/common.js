function CallDBOFronEndFunction(paramUrl, paramType, DTO, CallSuccess) {
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