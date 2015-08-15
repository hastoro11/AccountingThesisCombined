/**
 * Created by gaborsornyei on 24/07/15.
 */
angular.module('myApp.vegyes', [])

    .config(function ($stateProvider) {
        $stateProvider
            .state('vegyes', {
                url: '/vegyes',
                templateUrl: 'konyveles/vegyes/vegyes.html',
                controller: 'VegyesCtrl',
                resolve: {
                    naplo: function ($http) {
                        return $http.get('http://localhost:3000/naplo');
                    }
                }
            })
    })