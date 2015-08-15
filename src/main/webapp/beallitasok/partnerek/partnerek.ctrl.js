/**
 * Created by gaborsornyei on 29/07/15.
 */
angular.module('myApp.partnerek')

    .controller('PartnerekCtrl', function ($scope, $state, PartnerekSrvc) {

        $scope.vevo = {open: false};
        $scope.szallito = {open: false};
        $scope.invalid = true;

        $scope.open = function (group) {
            if (group === 'vevo') {
                $scope.vevo.open = true;
                $scope.szallito.open = false;
            } else {
                $scope.szallito.open = true;
                $scope.vevo.open = false;
            }
        }

        $scope.close = function () {
            $scope.szallito.open = false;
            $scope.vevo.open = false;
        }

        $scope.edit = function (partner) {
            $state.go('partnerekEdit');
        }

        PartnerekSrvc.getPartnerek()
            .success(function (data) {
                $scope.szallitok = _.filter(data, function (partner) {
                    return partner.szallito === true;
                })
                $scope.vevok = _.filter(data, function (partner) {
                    return partner.vevo === true;
                })
            })
    })


    .controller('PartnerekEditCtrl', function ($scope, $state, $stateParams, $modal, PartnerekSrvc) {
        $scope.edit = false;
        if ($stateParams.id > 0) { //Edit
            $scope.edit = true;
            $scope.title = 'Partner adatainak szerkesztése';
            PartnerekSrvc.getPartnerById($stateParams.id)
                .success(function (data) {
                    $scope.partner = data;
                })
        } else {
            $scope.title = 'Új partner felvitele';
        }

        $scope.save = function () {

            if (!$scope.partner.szallito && !$scope.partner.vevo) {
                toastr.info('A partner lehet szállító vagy vevő vagy mindkettő, de az egyiket legalább ki kell választani')
                return;
            }

            PartnerekSrvc.savePartner($scope.partner.id, $scope.partner).
                success(function () {
                    toastr.success('Mentés sikeres', '', {"timeOut": 1000})
                    $state.go('partnerek');
                })

        }

        $scope.cancel = function () {
            $state.go('partnerek');
        }


        $scope.delete = function (partner) {
            var modalInstance = $modal.open({
                animation: false,
                templateUrl: 'common/confirm.modal.html',
                controller: 'PartnerModalCtrl',
                resolve: {
                    data: function () {
                        return {
                            message: 'A partner törlésre kerül'
                        }
                    }
                }
            })

            modalInstance.result
                .then(function () {
                    PartnerekSrvc.deletePartner(partner.id)
                        .success(function (data) {
                            toastr.success('A törlés sikerült', '', {timeOut: 1000});
                            $state.go('partnerek');
                        })
                }, function () {
                    toastr.warning('A törlés megszakítva', '', {timeOut: 1000});
                })
        }

    })

    .controller('PartnerModalCtrl', function ($scope, $modalInstance, data) {
        $scope.data = data;
        $scope.cancel = function () {
            $modalInstance.dismiss();
        }

        $scope.ok = function () {
            $modalInstance.close();
        }
    })