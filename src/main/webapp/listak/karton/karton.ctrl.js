/**
 * Created by gaborsornyei on 29/07/15.
 */
angular.module('myApp.karton')

    .controller('KartonCtrl', function ($scope, $rootScope, $modal, $window, $state, $http, appConfig, AuthSrvc) {



        var init = function () {

            if (!AuthSrvc.isLoggedIn()) {
                $state.go('login');
            }else {

                var modalInstance = $modal.open({
                        animation: false,
                        templateUrl: 'listak/karton/karton.modal.html',
                        controller: 'KartonModalCtrl',
                        resolve: {
                            szamlak: function ($http) {
                                return $http.get(appConfig.baseUrl + 'szamlatukor')
                            }
                        }
                    }
                )

                modalInstance.result
                    .then(function (data) {
                        $scope.data = data;
                        $http.get(appConfig.baseUrl + 'kartonlista/' + data.datumtol + '/' + data.datumig + '/' + data.fokszam)
                            .success(function (data) {
                                $scope.karton = data;
                            })
                            .error(function (data) {
                                $rootScope.error = data;
                                $state.go('error');
                            })
                    },
                    function () {
                        //$state.go('home');
                    }
                )
            }
        }

        $scope.launch = function () {
            init();
        }

        init();
    })

    .controller('KartonModalCtrl', function ($scope, szamlak, $modalInstance, AuthSrvc, $state) {

        if (!AuthSrvc.isLoggedIn()) {
            $state.go('login');
        }

        $scope.szamlak = szamlak.data;
        $scope.ok = function () {
            $modalInstance.close($scope.karton);
        }

        $scope.cancel = function () {
            $modalInstance.dismiss('cancel');
        }

        $scope.open = function ($event, opened) {
            $event.preventDefault();
            $event.stopPropagation();

            $scope[opened] = !$scope[opened];
        }
    })