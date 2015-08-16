/**
 * Created by gaborsornyei on 24/07/15.
 */
angular.module('myApp.vevo', [])

    .config(function ($stateProvider) {
        $stateProvider
            .state('vevo', {
                url: '/vevo',
                templateUrl: 'konyveles/vevo/vevo.html',
                controller: 'VevoCtrl',
                resolve: {
                    naplo: function ($http, appConfig) {
                        return $http.get(appConfig.baseUrl + 'naplok');
                    }
                }
            })
    })