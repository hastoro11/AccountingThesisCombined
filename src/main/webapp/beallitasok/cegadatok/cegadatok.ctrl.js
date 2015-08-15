/**
 * Created by gaborsornyei on 27/07/15.
 */
angular.module('myApp.cegadatok')

    .controller('CegadatokCtrl', function ($scope, $state, $window, CegadatokSrvc) {
        $scope.cegadatok = {};
        CegadatokSrvc.getCegadatok()
            .success(function (data) {
                $scope.cegadatok = data;
            })


    })

    .controller('CegadatokEditCtrl', function ($scope, $state, CegadatokSrvc) {

        $scope.cegadatok = {};
        CegadatokSrvc.getCegadatok()
            .success(function (data) {
                $scope.cegadatok = data;
            })

        $scope.save = function () {
            CegadatokSrvc.setCegadatok($scope.cegadatok.id, $scope.cegadatok)
                .success(function (data, header, config) {
                    toastr.success('A mentés sikerült', '', {"timeOut": 1000});
                    $state.go('cegadatok');
                })
                .error(function (data, header, config) {
                    toastr.error('A mentés nem sikerült', '', {"timeOut": 1000});
                });
        }


    })