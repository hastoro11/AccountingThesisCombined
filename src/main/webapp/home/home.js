angular.module('myApp.home', [])
    .config(function ($stateProvider) {
        $stateProvider
            .state('kipontoz', {
                url: '/kipontoz',
                controller: 'KipontozCtrl'
            })
    })

    .controller('KipontozCtrl', function ($scope, $rootScope, $http, $state, $modal, appConfig) {

        if (!AuthSrvc.isLoggedIn()) {
            $state.go('login');
        }

        var init = function () {
            var modalInstance = $modal.open({
                animation: false,
                templateUrl: 'home/kipontoz.modal.html',
                controller: 'KipontozMdlCtrl'
            });

            modalInstance.result
                .then(function () {
                    $http.get(appConfig.baseUrl + 'common/kipontoz')
                        .success(function (data) {
                            toastr.success('A kipontozás befejeződött', '', {
                                timeOut: 1000
                            });
                            $state.go('home')
                        })
                        .error(function (data) {
                            $rootScope.error = data;
                            $state.go('error');
                        })
                })
        }
        init();
    })

    .controller('HomeCtrl', function ($scope, AuthSrvc, $state) {
        if (!AuthSrvc.isLoggedIn()) {
            $state.go('login');
        }
    })

    .controller('KipontozMdlCtrl', function ($scope, $state, $modalInstance) {
        $scope.ok = function () {
            $modalInstance.close();
        }

        $scope.cancel = function () {
            $modalInstance.dismiss();
            toastr.info('Kipontozás megszakítva', '', {
                timeOut: 1000
            })
            $state.go('home');
        }
    })

