/**
 * Created by gaborsornyei on 15. 09. 05..
 */
angular.module('myApp.afa')
    .controller('AfaCtrl', function (appConfig, $scope, $rootScope, $state, $http, $modal, AuthSrvc) {


        var init = function () {

            if (!AuthSrvc.isLoggedIn()) {
                $state.go('login');
            }
            else {

                var modalInstance = $modal.open({
                    animation: false,
                    templateUrl: 'listak/afa/afa.modal.html',
                    controller: 'AfaModalCtrl'
                })

                modalInstance.result
                    .then(function (data) {
                        $scope.data = data;
                        $http.get(appConfig.baseUrl + 'afalista/' + data.datumtol + '/' + '/' + data.datumig + '/' + data.tipus)
                            .success(function (data) {
                                var afalistak = data;
                                $scope.afalistak = _.filter(afalistak, function (item) {
                                    return item.afaTetelList.length > 0;
                                });
                            })
                            .error(function (data) {
                                $rootScope.error = data;
                                $state.go('error');
                            })
                    })
            }
        }
        init();

        $scope.launch = function () {
            init();
        }

    })

    .controller('AfaModalCtrl', function ($scope, $modalInstance) {
        $scope.ok = function () {
            $modalInstance.close($scope.afa);
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

