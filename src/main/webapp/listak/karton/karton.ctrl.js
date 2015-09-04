/**
 * Created by gaborsornyei on 29/07/15.
 */
angular.module('myApp.karton')

    .controller('KartonCtrl', function ($scope, $modal, $window, $state, $http, appConfig) {
        var init = function () {
            var modalInstance = $modal.open({
                    animation: false,
                    templateUrl: 'listak/karton/karton.modal.html',
                    controller: 'KartonModalCtrl',
                    resolve: {
                        szamlak: function ($http) {
                            return $http.get(appConfig.baseUrl + 'szamlatukor')
                        }
                    }
                }
            )

            modalInstance.result
                .then(function (data) {
                    $scope.data = data;
                    console.log(data);
                    $http.get(appConfig.baseUrl + 'kartonlista/' + data.datumtol + '/' + data.datumig + '/' + data.fokszam)
                        .success(function (data) {
                            $scope.karton = data;
                            console.log(data);
                        })
                },
                function () {
                    //$state.go('home');
                }
            )
        }

        $scope.launch = function () {
            init();
        }

        init();
    })

    .controller('KartonModalCtrl', function ($scope, szamlak, $modalInstance) {
        $scope.szamlak = szamlak.data;
        $scope.ok = function () {
            $modalInstance.close($scope.karton);
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