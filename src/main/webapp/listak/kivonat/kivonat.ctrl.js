/**
 * Created by gaborsornyei on 28/07/15.
 */
angular.module('myApp.kivonat')

    .controller('KivonatCtrl', function ($modal, $scope, $rootScope, $state, $window, appConfig, $http, AuthSrvc) {
        var init = function () {
            if (!AuthSrvc.isLoggedIn()) {
                $state.go('login');
            }
            else {
                var modalInstance = $modal.open({
                    animation: false,
                    templateUrl: 'listak/kivonat/kivonat.modal.html',
                    controller: 'ModalCtrl',
                    resolve: {
                        szamlak: function ($http) {
                            return $http.get(appConfig.baseUrl + 'szamlatukor');
                        }
                    }
                });

                modalInstance.result
                    .then(function (data) {
                        console.log(data);
                        $scope.data = data;
                        $http.get(appConfig.baseUrl + 'fokonyvlista/' + data.datumtol + '/' +
                            data.datumig + '/' + data.fokszamtol + '/' + data.fokszamig)
                            .success(function (data) {
                                if ($scope.data.ures) {
                                    data.fokonyvTetelList = _.filter(data.fokonyvTetelList, function (item) {
                                        return item.halmTartForgalom !== 0 || item.halmKovForgalom !== 0 || item.fokszam.length === 1;
                                    })
                                }
                                $scope.fokonyv = data;
                                console.log(data);

                            })
                            .error(function (data) {
                                $rootScope.error = data;
                                $state.go('error');
                            })

                    }, function () {
                        //$state.go('home');
                    });
            }
        }

        $scope.launch = function () {
            init();
        }

        init();

    })

    .controller('ModalCtrl', function ($scope, $modalInstance, szamlak) {
        $scope.szamlak = szamlak.data;
        $scope.kivonat = {
            ures: true
        }
        $scope.ok = function () {
            $modalInstance.close($scope.kivonat);
        }

        $scope.cancel = function () {
            $modalInstance.dismiss();
        }

        $scope.open = function ($event, opened) {
            $event.preventDefault();
            $event.stopPropagation();

            $scope[opened] = !$scope[opened];
        }
    })