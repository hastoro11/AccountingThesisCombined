/**
 * Created by gaborsornyei on 29/07/15.
 */
angular.module('myApp.karton', [])

    .config(function ($stateProvider) {
        $stateProvider
            .state('karton', {
                url: '/karton',
                templateUrl: 'listak/karton/karton.list.html',
                controller: 'KartonCtrl'
            })
    })