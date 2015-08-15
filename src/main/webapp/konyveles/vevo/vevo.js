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
                    naplo: function ($http) {
                        return $http.get('http://localhost:3000/naplo');
                    }
                }
            })
    })