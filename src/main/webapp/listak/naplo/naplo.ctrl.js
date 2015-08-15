/**
 * Created by gaborsornyei on 29/07/15.
 */
angular.module('myApp.naplo')

    .controller('NaploCtrl', function ($scope, $modal, $window) {
        var init = function () {
            var modalInstance = $modal.open({
                animation: false,
                templateUrl: 'listak/naplo/naplo.modal.html',
                controller: 'NaploModalCtrl',
                resolve: {
                    naplok: function ($http) {
                        return $http.get('http://localhost:3000/fizmodok');
                    }
                }
            });

            modalInstance.result
                .then(function (data) {
                    $scope.naplo = data;
                }, function () {
                    //$window.history.back();
                })
        }

        $scope.launch = function () {
            init();
        }

        init();
    })

    .controller('NaploModalCtrl', function ($scope, $modalInstance, naplok) {
        $scope.naplok = naplok.data;

        $scope.ok = function () {
            $modalInstance.close($scope.naplo);
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