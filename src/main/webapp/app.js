'use strict';

// Declare app level module which depends on views, and components
angular.module('myApp', [
    'ngAnimate',
    'ui.bootstrap',
    'ui.router',
    'ui.mask',
    'angular-loading-bar',
    'ngStorage',
    'myApp.auth',
    'myApp.home',
    'myApp.szallito',
    'myApp.vevo',
    'myApp.bank',
    'myApp.penztar',
    'myApp.vegyes',
    'myApp.kivonat',
    'myApp.karton',
    'myApp.naplo',
    'myApp.afa',
    'myApp.partner',
    'myApp.common',
    'myApp.cegadatok',
    'myApp.partnerek',
    'myApp.szamlatukor',
    'myApp.fizmodok',
    'myApp.afakulcsok'
]).
    config(['$stateProvider', '$urlRouterProvider', function ($stateProvider, $urlRouterProvider) {
        $urlRouterProvider.otherwise('/');

        $stateProvider
            .state('home', {
                url: '/',
                templateUrl: 'home/home.html',
                controller: 'HomeCtrl'
            })
            .state('dokumentacio', {
                url: '/dokumentacio',
                templateUrl: 'dokumentacio/dokumentacio.html',
                controller: function () {

                }
            })
            .state('error', {
                templateUrl: 'common/error.html',
                controller: 'ErrorCtrl'
            })

    }])

    .controller('ErrorCtrl', function ($scope, $rootScope) {
        $scope.error = $rootScope.error;
    })

    .constant('appConfig', {
        baseUrl: '/'
    })

    .run(function ($rootScope, AuthSrvc, $localStorage) {
        if (AuthSrvc.isLoggedIn()) {
            $rootScope.user = $localStorage.user;
        }
    })

