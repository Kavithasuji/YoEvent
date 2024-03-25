
function fetchData(searchText) {
    // Construct your AJAX request here to fetch data from the server
    // Example using jQuery:
    $.ajax({
        type: "POST",
        url: "register.aspx/FetchData", // Replace YourPage.aspx with your actual page
        data: JSON.stringify({ searchText: searchText }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            updateListBox(response.d);
        },
        error: function (xhr, status, error) {
            console.error(xhr.responseText);
        }
    });
}

function updateListBox(data) {
    var listBox = document.getElementById('resultListBox');
    listBox.innerHTML = ''; // Clear previous items
    data.forEach(function (item) {
        var option = document.createElement('option');
        option.text = item;
        listBox.add(option);
    });
    listBox.style.display = data.length > 0 ? 'block' : 'none'; // Show/hide the list box
}


function updateTextbox() {
    var selectElement = document.getElementById("resultListBox");
    var selectedText = selectElement.options[selectElement.selectedIndex].text;
    document.getElementById("<%= organizationInput.ClientID %>").value = selectedText;
}
