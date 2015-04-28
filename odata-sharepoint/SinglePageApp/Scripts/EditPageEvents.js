"use strict";

var Wingtip = window.Wingtip || {};
Wingtip.Contacts = Wingtip.Contacts || {};

$(document).ready(function () {
    Wingtip.Contacts.ViewModel.loadItem(window.frameElement.dialogArgs);
});

(function () {

    //Update the edited contact
    $("#updateButton").live("click", function () {
        Wingtip.Contacts.Data.update($("#identifier").val(), $("#lastName").val(), $("#firstName").val(), $("#workPhone").val()).then(
            function () {
                setTimeout(function () { window.frameElement.commitPopup("Item updated..."); }, 250);
            },
            function (err) {
                alert(JSON.stringify(err));
                setTimeout(function () { window.frameElement.cancelPopUp(); }, 250);
            }
        );
        return false;
    });

}());



