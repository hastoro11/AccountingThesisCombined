/**
 * Created by gaborsornyei on 30/07/15.
 */
angular.module('myApp.fizmodok', [])

    .config(function ($stateProvider) {
        $stateProvider
            .state('fizmodok', {
                url: '/fizmodok',
                templateUrl: 'beallitasok/fizmodok/fizmodok.list.html',
                controller: 'FizmodokCtrl'
            })
            .state('fizmodokEdit', {
                url: '/fizmodok/edit/:id',
                templateUrl: 'beallitasok/fizmodok/fizmodok.form.html',
                controller: 'FizmodokEditCtrl'
            })
    })