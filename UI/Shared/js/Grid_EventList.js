$(document).ready(function () {
    BindEvent();
});

function BindEvent() {
    var DTO1 = {};
    var paramUrl1 = '/UI/Module/dashboard/C_Event.aspx/Eventbindrequest';
    var paramType1 = "POST";

    var SaveSuccess = function (data) {
        // Your server response handling logic here
        //alert("hii");
        var status = JSON.parse(data.d);
        // Uncomment the following code to initialize the Kendo Grid
         $("#grid").kendoGrid({
             columns: [
                 { field: "E_Name" },
                 { field: "E_Description" },
                 { field: "E_Sdate" },
                 { field: "E_Edate" },
                 { field: "E_Venue" },
                 { field: "E_LocationLink" },
             //    {
             //        command: [
             //            {
             //                name: "edit",
             //                text: {
             //                    edit: "Edit",
             //                    update: "Update",
             //                    cancel: "Cancel"
             //                },
             //                template: "<a class='k-button k-grid-edit' href='\\#'><span class='k-icon k-i-pencil'></span></a>"
             //            },
             //            {
             //                name: "destroy",
             //                text: "Delete",
             //                template: "<a class='k-button k-grid-delete' href='\\#'><span class='k-icon k-i-close'></span></a>"
             //            }
             //        ]
             //    }
             ],
             dataSource: {
                 data: status
             },
             editable: "popup",
             edit: function (e) {
                 e.container.find("input[name='Event']").attr("readonly", "readonly");
             },
             dataBound: function () {
                 this.expandRow(this.tbody.find("tr.k-master-row").first());
             },
             toolbar: ["create"],
             create: function (e) {
                 e.container.find("input[name='Event']").removeAttr("readonly");
             }
         });
    };

    CallDBOFronEndFunction(paramUrl1, paramType1, DTO1, SaveSuccess);
}

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
