var Wingtip = window.Wingtip || {};

Wingtip.FeedViewModel = function () {

    "use strict";

    var init = function () {

        //Get the current user's account information
        $.ajax(
                {
                    url: "../_api/SP.UserProfiles.PeopleManager/GetMyProperties",
                    method: "GET",
                    headers: {
                        "accept": "application/json;odata=nometadata",
                    },
                    success: function (data) {

                        //Now get the current user's social feed
                        var accountName = data.AccountName.split('|')[2];
                        console.log(accountName);

                        $.ajax(
                            {
                                url: "../_api/social.feed/actor(item='" + accountName +"')/Feed",
                                method: "GET",
                                headers: {
                                    "accept": "application/json;odata=nometadata",
                                },
                                success: function (data) {
                                    alert(data.d.SocialFeed.Threads.results[0].RootPost.Text);
                                },
                                error: function (err) {
                                    alert(JSON.stringify(err));
                                }
                            }
                         );

                    },
                    error: function (err) {
                        alert(JSON.stringify(err));
                    }
                }
            );
        };


    return {
        init: init
    };

}();
