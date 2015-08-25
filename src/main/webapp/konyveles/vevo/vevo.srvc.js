/**
 * Created by gaborsornyei on 24/07/15.
 */
angular.module('myApp.vevo')

    .factory('VevoSrvc', function ($http, appConfig) {
        var factory = {};

        factory.getPartnerek = function () {
            return $http.get(appConfig.baseUrl + 'partnerek');
        }

        factory.save = function (tetel) {
            return $http.post(appConfig.baseUrl + 'vevo', tetel);
        }

        return factory;
    });