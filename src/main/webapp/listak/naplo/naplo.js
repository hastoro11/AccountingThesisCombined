/**
 * Created by gaborsornyei on 29/07/15.
 */
angular.module('myApp.naplo', [])

    .config(function ($stateProvider) {
        $stateProvider
            .state('naplo', {
                url: '/naplo',
                templateUrl: 'listak/naplo/naplo.list.html',
                controller: 'NaploCtrl'
            })
    })