/**
 * Created by gaborsornyei on 15. 09. 06..
 */
angular.module('myApp.partner')
    .controller('PartnerCtrl', function ($scope, $http, $modal, appConfig) {
        var init = function () {

            var modalInstance = $modal.open({
                animation: false,
                templateUrl: 'listak/partner/partner.modal.html',
                controller: 'PartnerListModalCtrl'
            })

            modalInstance.result
                .then(function (data) {
                    $scope.data = data;
                    $http.get(appConfig.baseUrl + 'partnerlista/' + data.tipus)
                        .success(function (data) {
                            $scope.partnerlistak = data;
                        })
                })
        }

        init();

        $scope.launch = function () {
            init();
        }
    })

    .controller('PartnerListModalCtrl', function ($scope, $modalInstance) {
        $scope.partner = {tipus: 'S'}
        $scope.ok = function () {
            console.log($scope.partner);
            $modalInstance.close($scope.partner);
        }

        $scope.cancel = function () {
            $modalInstance.dismiss('cancel');
        }
    })