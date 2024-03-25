
/*BY:B.LOKESH DATE:01-01-2024*/

function signIn() {
    let oauth2Endpoint = "https://accounts.google.com/o/oauth2/v2/auth";
    let form = document.createElement("form");
    form.setAttribute('method', 'get');
    form.setAttribute('action', oauth2Endpoint);

    let params = {
        "client_id": "670171915443-f381n2ek3cpkr1m78fuh9donv88aq7c7.apps.googleusercontent.com",
        "redirect_uri": "https://localhost:44310/UI/Module/dashboard/Dashboard.aspx",
        "response_type": "token",
        "scope": "https://www.googleapis.com/auth/userinfo.profile",
        "include_granted_scopes": 'true',
        "state": generateRandomNumber(),
        "access_type": "online",
    };

    for (var p in params) {
        let input = document.createElement('input');
        input.setAttribute('type', 'hidden');
        input.setAttribute('name', p);
        input.setAttribute('value', params[p]);
        form.appendChild(input);
    }

    document.body.appendChild(form);
    form.submit();
}

function generateRandomNumber() {
    return Math.floor(Math.random() * 1000000000) + 1;
}