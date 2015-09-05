/**
 * Created by gaborsornyei on 15. 09. 05..
 */
angular.module('myApp.afa', [])
    .config(function ($stateProvider) {
        $stateProvider
            .state('afa', {
                url: '/afa',
                templateUrl: 'listak/afa/afa.list.html',
                controller: 'AfaCtrl'
            })
    });