var Wingtip = window.Wingtip || {};

Wingtip.ProfileQuery = function () {

    "use strict";

    var execute = function () {

        return $.ajax(
                {
                    url: "../_api/SP.UserProfiles.PeopleManager/GetMyProperties",
                    method: "GET",
                    headers: {
                        "accept": "application/json;odata=nometadata",
                    }
                }
            );

    };


    return {
        execute: execute
    }

}();

Wingtip.FeedQuery = function () {

    var execute = function (accountName) {

            return $.ajax(
                    {
                        url:"../_api/social.feed/actor(item='" + accountName + "')/Feed",
                        method: "GET",
                        headers: {
                            "accept": "application/json;odata=nometadata",
                        }
                    }
                );

        };


    return {
        execute: execute
    };

}();
