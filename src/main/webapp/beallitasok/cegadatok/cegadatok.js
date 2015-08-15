/**
 * Created by gaborsornyei on 27/07/15.
 */
angular.module('myApp.cegadatok', [])

    .config(function ($stateProvider) {
        $stateProvider
            .state('cegadatok', {
                url: '/cegadatok',
                templateUrl: 'beallitasok/cegadatok/cegadatok.html',
                controller: 'CegadatokCtrl'
            })
            .state('cegadatokEdit',{
                url:'/cegadatokEdit',
                templateUrl:'beallitasok/cegadatok/cegadatok.form.html',
                controller:'CegadatokEditCtrl'
            })
    })
