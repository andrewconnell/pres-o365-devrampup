"use strict";

var Wingtip = window.Wingtip || {};
Wingtip.Contacts = Wingtip.Contacts || {};

Wingtip.Contacts.ViewModel = function () {

    //private members
    var contacts = ko.observableArray(),
        get_contacts = function () { return contacts; },
        get_contact = function (index) { return contacts()[index]; },

        loadItem = function (id) {

            Wingtip.Contacts.Data.readItem(id).then(

                function (data) {

                    contacts.removeAll();

                    contacts.push(
                        new Wingtip.Contacts.Model(
                        data.d.Id,
                        data.d.Title,
                        data.d.FirstName,
                        data.d.WorkPhone));

                    ko.applyBindings(Wingtip.Contacts.ViewModel, document.getElementById("formDiv"));

                },

                function (err) {
                    alert(JSON.stringify(err));
                }

            );


        },

        loadItems = function () {

            Wingtip.Contacts.Data.readList().then(

                function (data) {

                    //When successful, fill observable array
                    var results = data.d.results;

                    contacts.removeAll();

                    for (var i = 0; i < results.length; i++) {
                        contacts.push(
                            new Wingtip.Contacts.Model(
                            results[i].Id,
                            results[i].Title,
                            results[i].FirstName,
                            results[i].WorkPhone));
                    }

                },

                function (err) {
                    alert(JSON.stringify(err));
                }

            );

        };

    //public interface
    return {
        loadItem: loadItem,
        loadItems: loadItems,
        get_contact: get_contact,
        get_contacts: get_contacts
    };

}();