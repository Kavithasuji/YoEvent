function confirmDelete(button) {
    var confirmPanel = document.getElementById('confirm');
    confirmPanel.style.display = 'block';

    // Set CommandArgument to track which row is being deleted
    document.getElementById('<%= popyes.ClientID %>').commandArgument = button.commandArgument;
    return false; // Prevent default postback
}
