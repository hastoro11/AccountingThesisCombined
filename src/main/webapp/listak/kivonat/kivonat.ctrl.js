/**
 * Created by gaborsornyei on 28/07/15.
 */
angular.module('myApp.kivonat')

    .controller('KivonatCtrl', function ($modal, $scope, $state, $window) {
        var init = function () {
            var modalInstance = $modal.open({
                animation: false,
                templateUrl: 'listak/kivonat/kivonat.modal.html',
                controller: 'ModalCtrl',
                resolve: {
                    szamlak: function ($http) {
                        return $http.get('http://localhost:3000/szamlatukor');
                    }
                }
            });

            modalInstance.result
                .then(function (data) {
                    $scope.data = data;
                }, function () {
                    //$state.go('home');
                });
        }

        $scope.launch = function () {
            init();
        }

        init();

    })

    .controller('ModalCtrl', function ($scope, $modalInstance, szamlak) {
        $scope.szamlak = szamlak.data;
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