/**
 * Created by gaborsornyei on 29/07/15.
 */
angular.module('myApp.afakulcsok')

    .controller('AfakulcsokCtrl', function ($scope, $state, $rootScope, AfakulcsokSrvc, AuthSrvc) {

        if (!AuthSrvc.isLoggedIn()) {
            $state.go('login');
        }

        AfakulcsokSrvc.getAfak()
            .success(function (data) {
                $scope.fizafak = _.filter(data, function (afa) {
                    return afa.fokszam.toString().indexOf('467') > -1;
                });
                $scope.levafak = _.filter(data, function (afa) {
                    return afa.fokszam.toString().indexOf('466') > -1;
                });
            })
            .error(function (data) {
                $rootScope.error = data;
                $state.go('error');
            })
    })

    .controller('AfakulcsokEditCtrl', function ($scope, $state, $stateParams, $modal, CommonSrvc, AfakulcsokSrvc, AuthSrvc) {

        if (!AuthSrvc.isLoggedIn()) {
            $state.go('login');
        }

        $scope.edit = false;

        if ($stateParams.id > 0) { // Edit
            $scope.edit = true;
            AfakulcsokSrvc.getAfaById($stateParams.id)
                .success(function (data) {
                    $scope.afakulcs = data;
                })
                .error(function (data) {
                    $rootScope.error = data;
                    $state.go('error');
                })
        }

        $scope.save = function () {
            if ($scope.edit) {
                AfakulcsokSrvc.updateAfa($stateParams.id, $scope.afakulcs)
                    .success(function () {
                        toastr.success('A mentés sikerült', '', {timeOut: 1000});
                        $state.go('afakulcsok');
                    })
                    .error(function (data) {
                        $rootScope.error = data;
                        $state.go('error');
                    })
            } else {
                AfakulcsokSrvc.createAfa($scope.afakulcs)
                    .success(function () {
                        toastr.success('A mentés sikerült', '', {timeOut: 1000});
                        $state.go('afakulcsok');
                    })
                    .error(function (data) {
                        $rootScope.error = data;
                        $state.go('error');
                    })
            }
        }

        $scope.cancel = function () {
            $state.go('afakulcsok');
        }

        $scope.delete = function () {
            var modalInstance = $modal.open({
                animation: false,
                templateUrl: 'common/confirm.modal.html',
                controller: 'AfakulcsModalCtrl',
                resolve: {
                    data: function () {
                        return {
                            message: 'Az ÁFA kulcs törlésre kerül'
                        }
                    }
                }
            })

            modalInstance.result.then(
                function () {
                    AfakulcsokSrvc.deleteAfa($scope.afakulcs.id)
                        .success(function () {
                            toastr.success('A törlés sikerült', '', {timeOut: 1000});
                            $state.go('afakulcsok');
                        })
                        .error(function (data) {
                            $rootScope.error = data;
                            $state.go('error');
                        })
                },
                function () {
                    toastr.warning('A törlés megszakítva', '', {timeOut: 1000})
                }
            )

        }


        CommonSrvc.getSzamlatukor()
            .success(function (data) {
                $scope.fizafak = _.filter(data, function (fokszam) {
                    return fokszam.fokszam.toString().indexOf('467') > -1 && fokszam.osszesito === false;
                });
                $scope.levafak = _.filter(data, function (fokszam) {
                    return fokszam.fokszam.toString().indexOf('466') > -1 && fokszam.osszesito === false;
                });
            })
            .error(function (data) {
                $rootScope.error = data;
                $state.go('error');
            })

    })

    .controller('AfakulcsModalCtrl', function ($scope, $modalInstance, data) {
        $scope.data = data;
        $scope.cancel = function () {
            $modalInstance.dismiss();
        }

        $scope.ok = function () {
            $modalInstance.close();
        }
    })