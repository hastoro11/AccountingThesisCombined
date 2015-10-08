/**
 * Created by gaborsornyei on 30/07/15.
 */
angular.module('myApp.fizmodok')

    .controller('FizmodokCtrl', function ($scope, $rootScope, $state, FizmodokSrvc, AuthSrvc) {

        if (!AuthSrvc.isLoggedIn()) {
            $state.go('login');
        }

        FizmodokSrvc.getFizmodok()
            .success(function (data) {
                $scope.fizmodok = data;
            })
            .error(function (data) {
                $rootScope.error = data;
                $state.go('error');
            })
    })

    .controller('FizmodokEditCtrl', function ($scope, $rootScope, $modal, $state, $stateParams, FizmodokSrvc, AuthSrvc) {

        if (!AuthSrvc.isLoggedIn()) {
            $state.go('login');
        }

        $scope.edit = false;
        $scope.title = 'Új fizetési mód felvitele';
        if ($stateParams.id > 0) {
            $scope.edit = true;
            $scope.title = 'Fizetési mód szerkesztése';
            FizmodokSrvc.getFizmodById($stateParams.id)
                .success(function (data) {
                    $scope.fizmod = data;
                })
                .error(function (data) {
                    $rootScope.error = data;
                    $state.go('error');
                })
        }

        $scope.save = function () {
            if ($scope.edit) {
                FizmodokSrvc.updateFizmod($stateParams.id, $scope.fizmod)
                    .success(function () {
                        toastr.success('A mentés sikerült', '', {timeOut: 1000});
                        $state.go('fizmodok');
                    })
                    .error(function (data) {
                        $rootScope.error = data;
                        $state.go('error');
                    })
            } else {
                $scope.fizmod.torolheto = true;
                FizmodokSrvc.createFizomd($scope.fizmod)
                    .success(function () {
                        toastr.success('A mentés sikerült', '', {timeOut: 1000});
                        $state.go('fizmodok');
                    })
                    .error(function (data) {
                        $rootScope.error = data;
                        $state.go('error');
                    })
            }
        }

        $scope.delete = function (fizmod) {
            var modalInstance = $modal.open({
                animation: false,
                templateUrl: 'common/confirm.modal.html',
                controller: 'FizmodokModalCtrl',
                resolve: {
                    data: function () {
                        return {
                            message: 'A fizetési mód törlésre kerül'
                        }
                    }
                }
            })

            modalInstance.result.then(
                function () {
                    FizmodokSrvc.deleteFizmod(fizmod.id)
                        .success(function () {
                            toastr.success('A törlés sikerült', '', {timeOut: 1000});
                            $state.go('fizmodok');
                        })
                        .error(function (data) {
                            $rootScope.error = data;
                            $state.go('error');
                        })

                }, function () {
                    toastr.warning('A törlés megszakítva', '', {timeOut: 1000});
                    $state.go('fizmodok');
                }
            )
        }

        $scope.cancel = function () {
            $state.go('fizmodok');
        }

    })

    .controller('FizmodokModalCtrl', function ($modalInstance, $scope, data) {
        $scope.data = data;
        $scope.ok = function () {
            $modalInstance.close();
        }
        $scope.cancel = function () {
            $modalInstance.dismiss();
        }
    })