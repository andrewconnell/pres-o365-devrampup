var Wingtip = window.Wingtip || {};

$(document).ready(function () { 

    "use strict";

    /* The following uses nested callbacks */
    //Wingtip.FeedViewModel.init(); 

    /* The following uses nested promises */
    //Wingtip.ProfileQuery.execute().then(
    //        function (data) {

    //            var accountName = data.d.AccountName

    //            Wingtip.FeedQuery.execute(accountName).then(

    //                function (data) {
    //                    $("#message").text(data.d.SocialFeed.Threads.results[0].RootPost.Text);
    //                },

    //                function (err) {
    //                    $("#message").text(JSON.stringify(err));
    //                }

    //            );
    //        },
    //        function (err) {
    //            alert(JSON.stringify(err));
    //        }
    //);

    /* The following uses chained promises */
    Wingtip.ProfileQuery.execute()
        .then(
            function (data) {
                var accountName = data.AccountName.split('|')[2];
                console.log(accountName);
                return Wingtip.FeedQuery.execute(accountName); //return a promise to allow chaining
            })
        .then(
            function (data) {
                $("#message").text(data.SocialFeed.Threads.results[0].RootPost.Text);
            })
        .fail(
            function (err) {
                alert(JSON.stringify(err));
            })
        .done(
            function () {
                alert("Success!");
            });



});

