/**
 * Created by gaborsornyei on 29/07/15.
 */
angular.module('myApp.partnerek', [])

    .config(function ($stateProvider) {
        $stateProvider
            .state('partnerek', {
                url: '/partnerek',
                templateUrl: 'beallitasok/partnerek/partnerek.list.html',
                controller: 'PartnerekCtrl'
            })
            .state('partnerekEdit', {
                url: '/partnerek/edit/:id',
                templateUrl: 'beallitasok/partnerek/partnerek.form.html',
                controller: 'PartnerekEditCtrl'
            })
    })