/**
 * Created by gaborsornyei on 28/07/15.
 */
angular.module('myApp.kivonat', [])

    .config(function ($stateProvider) {
        $stateProvider
            .state('kivonatmodal', {
                url: '/kivonatmodal',
                controller: 'KivonatModalCtrl'
            })
            .state('kivonat', {
                url: '/kivonat',
                templateUrl: 'listak/kivonat/kivonat.list.html',
                controller: 'KivonatCtrl',
            })
    })