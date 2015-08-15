/**
 * Created by gaborsornyei on 24/07/15.
 */
angular.module('myApp.penztar', [])

    .config(function ($stateProvider) {
        $stateProvider
            .state('penztar', {
                url: '/penztar',
                templateUrl: 'konyveles/penztar/penztar.html',
                controller: 'PenztarCtrl',
                resolve: {
                    naplo: function ($http) {
                        return $http.get('http://localhost:3000/naplo');
                    }
                }
            })
    })