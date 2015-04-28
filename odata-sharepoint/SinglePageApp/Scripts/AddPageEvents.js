"use strict";

var Wingtip = window.Wingtip || {};
Wingtip.Contacts = Wingtip.Contacts || {};

(function () {

    //Add the new contact
    $("#addButton").live("click", function () {
        Wingtip.Contacts.Data.create($("#lastName").val(), $("#firstName").val(), $("#workPhone").val()).then(
            function () {
                setTimeout(function () { window.frameElement.commitPopup("Item added..."); }, 250);
            },
            function (err) {
                alert(JSON.stringify(err));
                setTimeout(function () { window.frameElement.cancelPopUp(); }, 250);
            }
        );
        return false;
    });

}());
