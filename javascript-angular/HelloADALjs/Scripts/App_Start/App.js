var myApp = angular.module("MyApp", ["ngRoute", "AdalAngular"]);


myApp.config(["$routeProvider", "$httpProvider", "adalAuthenticationServiceProvider",
    function ($routeProvider, $httpProvider, adalProvider) {

        'use strict';

        //Initialize ADAL
        adalProvider.init({
            tenant: "devramp.onmicrosoft.com",
            clientId: "0668aee7-a453-4110-aa1a-80486e39ab72",
            cacheLocation: "sessionStorage",
            endpoints: {
                'https://devramp.sharepoint.com/_api/': 'https://devramp.sharepoint.com',
                'https://devramp-my.sharepoint.com/_api/v1.0/me': 'https://devramp-my.sharepoint.com'
             }
        }, $httpProvider);

        //Configure routes
        $routeProvider.when("/", {
            controller: 'homeCtrl',
            templateUrl: 'Views/home.html',
            requireADLogin: true
        });
        $routeProvider.when("/documents", {
            controller: 'docsCtrl',
            templateUrl: 'Views/docs.html',
            requireADLogin: true
        });
        $routeProvider.otherwise({
            redirectTo: "/"
        });
    }
]);

