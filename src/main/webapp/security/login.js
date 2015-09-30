/**
 * Created by gaborsornyei on 15. 09. 27..
 */
angular.module('myApp.auth', [])

    .config(function ($stateProvider) {
        $stateProvider
            .state('login', {
                url: '/login',
                templateUrl: 'security/login.html',
                controller: 'AuthCtrl'
            })
            .state('logout', {
                url: '/logout',
                controller: function (AuthSrvc, $state) {
                    AuthSrvc.logout();
                    $state.go('login');
                }
            })
    })

    .controller('AuthCtrl', function ($scope, AuthSrvc) {
        $scope.login = function () {
            AuthSrvc.login($scope.user);
        }

        $scope.logout = function () {
            AuthSrvc.logout();
        }
    })

    .factory('AuthSrvc', function ($localStorage, $state, $rootScope, $http, appConfig) {
        var factory = {};


        factory.isLoggedIn = function () {
            return typeof $localStorage.user !== 'undefined' && $localStorage.user.loggedIn;

        }

        factory.login = function (user) {
            delete $localStorage.user;
            $http.post(appConfig.baseUrl + 'auth/getcredentials', user)
                .success(function (data) {
                    console.log(data);
                    data.loggedIn = true;
                    $localStorage.user = data;
                    $rootScope.user = data;
                    $state.go('home')
                })
                .error(function () {
                    console.log('Wrong');
                })
        }

        factory.logout = function () {
            delete $localStorage.user;
            $rootScope.user = {};
        }

        return factory;
    })