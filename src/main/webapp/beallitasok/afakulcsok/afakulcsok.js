/**
 * Created by gaborsornyei on 29/07/15.
 */
angular.module('myApp.afakulcsok', [])

    .config(function ($stateProvider) {
        $stateProvider
            .state('afakulcsok', {
                url: '/afakulcsok',
                templateUrl: 'beallitasok/afakulcsok/afakulcsok.list.html',
                controller: 'AfakulcsokCtrl'
            })
            .state('afakulcsokEdit', {
                url: '/afakulcsok/edit/:id',
                templateUrl: 'beallitasok/afakulcsok/afakulcsok.form.html',
                controller: 'AfakulcsokEditCtrl'
            })
    })