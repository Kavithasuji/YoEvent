

function Saveregisterpeople() {
    try {
        var email = $("[id*=Email]").val();

        // Check if email already exists
        $.ajax({
            type: "POST",
            url: "register.aspx/CheckEmailExists",
            data: JSON.stringify({ email: email }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.d) {
                    document.getElementById("Panel1").style.display = "block";


                } else {
                    var SaveCourse = {};
                    SaveCourse.User_Type = $("[id*=organizationInput]").val() || 0;
                    SaveCourse.User_Name = $("[id*=Name]").val();
                    SaveCourse.Mobile_Number = $("[id*=Phnumber]").val();
                    SaveCourse.Email = email;
                    SaveCourse.Password = $("[id*=Pass]").val();
                    SaveCourse.Confirm_Password = $("[id*=Cpass]").val();
                    SaveCourse.Pre_Status = "A";

                    var DTO1 = { "Course": SaveCourse };
                    var paramUrl1 = 'register.aspx/SaveCourseMaster';
                    var paramType1 = "POST";
                    var SaveSuccess = function (data) {
                        console.log(data.d);
                        var status = JSON.parse(data.d);
                        console.log(status);
                    };
                    CallDBOFronEndFunction(paramUrl1, paramType1, DTO1, SaveSuccess);
                }
            },
            error: function (xhr, status, error) {
                console.log(xhr.responseText);
            }
        });
    } catch (e) {
        console.log(e);
    }
}


