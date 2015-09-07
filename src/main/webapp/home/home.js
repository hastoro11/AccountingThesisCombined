angular.module('myApp.home', [])
    .config(function ($stateProvider) {
        $stateProvider
            .state('kipontoz', {
                url: '/kipontoz',
                controller: 'KipontozCtrl'
            })
    })

    .controller('KipontozCtrl', function ($scope, $http, $state, appConfig) {
        $http.get(appConfig.baseUrl + 'common/kipontoz')
            .success(function (data) {
                toastr.success('A kipontozás befejeződött','', {
                    timeOut:1000
                });
                $state.go('home')
            })
    })

    .controller('HomeCtrl', function ($scope) {

    })

