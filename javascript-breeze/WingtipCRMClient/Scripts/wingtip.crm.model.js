var Wingtip = window.Wingtip || {};
Wingtip.Crm = Wingtip.Crm || {};
Wingtip.Crm.Model = Wingtip.Crm.Model || {};

Wingtip.Crm.Model.create = function (Id, FirstName, LastName, Company, EmailAddress, WorkPhone, HomePhone) {
    "use strict";

    var newCustomer = {
        "Id": Id,
        "FirstName": FirstName,
        "LastName": LastName,
        "Company": Company,
        "EmailAddress": EmailAddress,
        "WorkPhone": WorkPhone,
        "HomePhone": HomePhone
    };

    // add simple getter methods
    newCustomer.getId = function () { return Id; }
    newCustomer.getFirstName = function () { return FirstName; }
    newCustomer.getLastName = function () { return LastName; }
    newCustomer.getCompany = function () { return Company; }
    newCustomer.getEmail = function () { return EmailAddress; }
    newCustomer.getWorkPhone = function () { return WorkPhone; }
    newCustomer.getHomePhone = function () { return HomePhone; }

    // add computation functions
    newCustomer.getFullName = function () {
        return FirstName + " " + LastName;
    }

    return newCustomer;

};
