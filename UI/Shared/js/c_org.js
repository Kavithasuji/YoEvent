
function org() {

    try {
        var organization = {};
        organization.First_Name = $("[id*=First_Name]").val() || '';
        organization.Last_Name = $("[id*=Last_Name]").val() || '';
        organization.Organizer_Type = $("[id*=Organizer_Type]").val() || '';
        organization.Email = $("[id*=Email]").val() || '';
        organization.Phone = $("[id*=Phone]").val() || '';

        var Org_Image = $("[id*=Org_Image]")[0].files[0];
        console.log(Org_Image);

        if (Org_Image) {
            organization.Org_Image = Org_Image.name;
        } else {
            organization.Org_Image = 'null';
        }
        var DTO1 = { "Course": organization };
        var paramUrl1 = '/UI/Module/dashboard/c_org.aspx/SaveOrganizerPage';
        var paramType1 = "POST";
        var saveSuccess = function (data){
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

function Clear() {
    var First_Name = document.getElementById("First_Name");
    var Last_Name = document.getElementById("Last_Name");
    var Organizer_Type = document.getElementById("Organizer_Type");
    var Email = document.getElementById("Email");
    var Phone = document.getElementById("Phone");
    var Org_Image = document.getElementById("Org_Image");

    if (First_Name) First_Name.value = "";
    if (Last_Name) Last_Name.value = "";
    if (Organizer_Type) Organizer_Type.value = "";
    if (Email) Email.value = "";
    if (Phone) Phone.value = "";
    if (Org_Image) Org_Image.value = "";
}


