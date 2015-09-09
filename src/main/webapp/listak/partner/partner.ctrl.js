/**
 * Created by gaborsornyei on 15. 09. 06..
 */
angular.module('myApp.partner')
    .controller('PartnerCtrl', function ($scope, $rootScope, $state, $http, $modal, appConfig) {
        var init = function () {

            var modalInstance = $modal.open({
                animation: false,
                templateUrl: 'listak/partner/partner.modal.html',
                controller: 'PartnerListModalCtrl'
            })

            modalInstance.result
                .then(function (data) {
                    $scope.data = data;
                    $http.get(appConfig.baseUrl + 'partnerlista/' + data.tipus + '/' + data.kipontozott)
                        .success(function (data) {
                            //$scope.partnerlista = data;

                            $scope.partnerlistak = _.filter(data, function (item) {
                                return item.partnerTetelList.length > 0;
                            })

                        })
                        .error(function (data) {
                            $rootScope.error = data;
                            $state.go('error');
                        })
                })
        }

        init();

        $scope.launch = function () {
            init();
        }
    })

    .controller('PartnerListModalCtrl', function ($scope, $modalInstance) {
        $scope.partner = {tipus: 'S', kipontozott: true}
        $scope.ok = function () {
            $modalInstance.close($scope.partner);
        }

        $scope.cancel = function () {
            $modalInstance.dismiss('cancel');
        }
    })