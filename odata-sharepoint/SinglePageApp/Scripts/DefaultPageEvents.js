"use strict";

var Wingtip = window.Wingtip || {};
Wingtip.Contacts = Wingtip.Contacts || {};

$(document).ready(function () {
    Wingtip.Contacts.ViewModel.loadItems();
    ko.applyBindings(Wingtip.Contacts.ViewModel, document.getElementById("resultsTable"));
});

//Event Handlers
(function () {

    //Open New Contact dialog
    $("#newButton").live("click", function () {
        SP.UI.ModalDialog.showModalDialog({
            url: "AddContact.aspx?IsDlg=1",
            title: "Add Contact",
            allowMaximize: false,
            showClose: true,
            width: 500,
            height: 250,
            dialogReturnValueCallback: Function.createDelegate(null, function (result, value) {
                if (result === 1) {
                    SP.UI.Notify.addNotification(value);
                    Wingtip.Contacts.ViewModel.loadItems();
                }
            })
        });
        return false;
    });

    //Open edit dialog
    $(".editButton").live("click", function () {
        var id = $(this).attr("id").substring(4);
        SP.UI.ModalDialog.showModalDialog({
            url: "EditContact.aspx?IsDlg=1",
            title: "Edit Contact",
            allowMaximize: false,
            showClose: true,
            width: 500,
            height: 250,
            args: id,
            dialogReturnValueCallback: Function.createDelegate(null, function (result, value) {
                if (result === 1) {
                    SP.UI.Notify.addNotification(value);
                    Wingtip.Contacts.ViewModel.loadItems();
                }
            })
        });
        return false;
    });

    //Delete a contact
    $(".deleteButton").live("click", function () {
        Wingtip.Contacts.Data.remove($(this).attr("id").substring(6)).then(
            function () {
                SP.UI.Notify.addNotification("Item deleted...")
                Wingtip.Contacts.ViewModel.loadItems();
            },
            function (err) {
                alert(JSON.stringify(err));
                Wingtip.Contacts.ViewModel.loadItems();
            }
        );
        return false;
    });

}());
