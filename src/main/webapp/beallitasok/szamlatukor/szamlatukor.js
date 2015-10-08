/**
 * Created by gaborsornyei on 30/07/15.
 */
angular.module('myApp.szamlatukor', ['chieffancypants.loadingBar'])

    .config(function ($stateProvider, cfpLoadingBarProvider) {
        cfpLoadingBarProvider.includeSpinner = true;
        $stateProvider
            .state('szamlatukor', {
                url: '/szamlatukor',
                templateUrl: 'beallitasok/szamlatukor/szamlatukor.html',
                controller: 'SzamlatukorCtrl'
                /*                ,
                 resolve: {
                 szamlatukor: function ($http, appConfig) {
                 return $http.get(appConfig.baseUrl + 'szamlatukor');
                 }
                 }*/
            })
            .state('szamlatukorEdit', {
                url: '/szamlatukor/:fokszam',
                templateUrl: 'beallitasok/szamlatukor/szamlatukor.form.html',
                controller: 'SzamlatukorEditCtrl'
            })
    })

    .controller('SzamlatukorCtrl', function ($scope, $rootScope, $state, CommonSrvc, AuthSrvc) {

        if (!AuthSrvc.isLoggedIn()) {
            $state.go('login');
        }

        //$scope.szamlatukor = szamlatukor.data;
        CommonSrvc.getSzamlatukor()
            .success(function (data) {
                $scope.szamlatukor = data;
            })
            .error(function (data) {
                $rootScope.error = data;
                $state.go('error');
            })
    })

    .controller('SzamlatukorEditCtrl', function ($scope, $rootScope, $state, $stateParams, SzamlatukorSrvc, AuthSrvc) {

        if (!AuthSrvc.isLoggedIn()) {
            $state.go('login');
        }

        var fokszam = $stateParams.fokszam;
        SzamlatukorSrvc.getFokSzamla(fokszam)
            .success(function (data) {
                $scope.fokszamla = data;
            })
            .error(function (data) {
                $rootScope.error = data;
                $state.go('error');
            })
        $scope.cancel = function () {
            $state.go('szamlatukor');
        }

        $scope.save = function () {
            SzamlatukorSrvc.save($stateParams.fokszam, $scope.fokszamla)
                .success(function () {
                    toastr.success('Mentés sikeres', '', {"timeOut": 1000})
                    $state.go('szamlatukor');
                })
                .error(function (data) {
                    $rootScope.error = data;
                    $state.go('error');
                })
        }

    })

    .factory('SzamlatukorSrvc', function ($http, appConfig) {
        var factory = {};
        var url = appConfig.baseUrl + 'szamlatukor';

        factory.getFokSzamla = function (fokszam) {
            return $http.get(url + '/' + fokszam);
        }

        factory.save = function (fokszam, fokSzamla) {
            return $http.put(url + '/' + fokszam, fokSzamla);
        }

        return factory;
    })