/**
 * Created by gaborsornyei on 29/07/15.
 */
angular.module('myApp.naplo')

    .controller('NaploCtrl', function ($scope, $modal, $window, $http, appConfig) {
        var init = function () {
            var modalInstance = $modal.open({
                animation: false,
                templateUrl: 'listak/naplo/naplo.modal.html',
                controller: 'NaploModalCtrl',
                resolve: {
                    naplok: function ($http) {
                        return $http.get(appConfig.baseUrl + 'naplok');
                    }
                }
            });

            modalInstance.result
                .then(function (data) {
                    $scope.data = data;
                    console.log($scope.naplo);
                    var from = new Date(data.datumtol);
                    var to = new Date(data.datumig);
                    var url = 'naplolista/' + from + '/' + to + '/' + data.tipus.jel;
                    $http.get(appConfig.baseUrl + url)
                        .success(function (data) {
                            console.log(data);
                            $scope.naplo = data;
                        })
                }, function () {
                    //$window.history.back();
                })
        }

        $scope.launch = function () {
            init();
        }

        osszesit = function (naplolista) {
            var osszesen = [];
            osszesen[0]=0;
            osszesen[1]=0;
            for (var i = 0; i < naplolista.length; i++) {
                osszesen[0] += naplolista[i].tartozik;
                osszesen[1] += naplolista[i].kovetel;
            }

            return osszesen;
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