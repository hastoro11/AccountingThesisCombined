/**
 * Created by gaborsornyei on 27/07/15.
 */
angular.module('myApp.cegadatok')

    .controller('CegadatokCtrl', function ($scope, $rootScope, $state, $window, CegadatokSrvc) {
        $scope.cegadatok = {};
        CegadatokSrvc.getCegadatok()
            .success(function (data) {
                $scope.cegadatok = data;
            })
            .error(function (data) {
                $rootScope.error = data;
                $state.go('error');
            })


    })

    .controller('CegadatokEditCtrl', function ($scope, $rootScope, $state, CegadatokSrvc) {

        $scope.cegadatok = {};
        CegadatokSrvc.getCegadatok()
            .success(function (data) {
                $scope.cegadatok = data;
            })
            .error(function (data) {
                $rootScope.error = data;
                $state.go('error');
            })

        $scope.save = function () {
            CegadatokSrvc.setCegadatok($scope.cegadatok.id, $scope.cegadatok)
                .success(function (data, header, config) {
                    toastr.success('A mentés sikerült', '', {"timeOut": 1000});
                    $state.go('cegadatok');
                })
                .error(function (data) {
                    $rootScope.error = data;
                    $state.go('error');
                })
        }


    })