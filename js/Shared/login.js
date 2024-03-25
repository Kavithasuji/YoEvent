function Saveloginpeople() {
    var email = document.getElementById("Email").value;
    var password = document.getElementById("Pass").value;

    var DTO = {
        email: email,
        password: password
    };

    $.ajax({
        type: "POST",
        url: "Login.aspx/AuthenticateUser",
        data: JSON.stringify(DTO),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            console.log(data);
            var parts = data.d.split(";");
            if (parts[0] === "Success") {
                redirectToDashboard(parts[1]);
            } else if (parts[0] === "Invalid") {
                alert("Invalid email or password. Please try again.");
            } else {
                alert("An error occurred");
            }
        },
        error: function (xhr, status, error) {
            console.error(xhr.responseText);
            alert("Please try again later.");
        }
    });
}

function redirectToDashboard(personType) {
    window.location.href = "UI/Module/dashboard/Dashboard.aspx?PersonType=" + encodeURIComponent(personType);
}
