"use strict";

var Wingtip = window.Wingtip || {};
Wingtip.Contacts = Wingtip.Contacts || {};

Wingtip.Contacts.Model = function (identifier, lastName, firstName, phoneNumber) {

    //This module is used to hold data for a contact
    //It will be added to a collection of contacts

    //private members
    var id = identifier,
        lname = lastName,
        fname = firstName,
        phone = phoneNumber,
        set_id = function (v) { id = v; },
        get_id = function () { return id; },
        set_lname = function (v) { lname = v; },
        get_lname = function () { return lname; },
        set_fname = function (v) { fname = v; },
        get_fname = function () { return fname; },
        set_phone = function (v) { phone = v; },
        get_phone = function () { return phone; };

    //public interface
    return {
        set_id: set_id,
        get_id: get_id,
        set_lname: set_lname,
        get_lname: get_lname,
        set_fname: set_fname,
        get_fname: get_fname,
        set_phone: set_phone,
        get_phone: get_phone
    };
}
