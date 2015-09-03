'use strict';

// Declare app level module which depends on views, and components
angular.module('myApp', [
    'ngAnimate',
    'ui.bootstrap',
    'ui.router',
    'ui.mask',
    'angular-loading-bar',
    'myApp.home',
    'myApp.szallito',
    'myApp.vevo',
    'myApp.bank',
    'myApp.penztar',
    'myApp.vegyes',
    'myApp.kivonat',
    'myApp.karton',
    'myApp.naplo',
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

    }])

    .constant('appConfig', {
        baseUrl: '/'
    })

