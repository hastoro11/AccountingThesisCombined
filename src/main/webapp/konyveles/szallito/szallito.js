angular.module('myApp.szallito', [])

    .config(function ($stateProvider) {
        $stateProvider
            .state('szallito', {
                url: '/szallito',
                templateUrl: 'konyveles/szallito/szallito.html',
                controller: 'SzallitoCtrl',
                resolve: {
                    naplo: function ($http, appConfig) {
                        return $http.get(appConfig.baseUrl+'naplok');
                    }
                }
            })
    })