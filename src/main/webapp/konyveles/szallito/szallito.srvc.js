/**
 * Created by gaborsornyei on 05/07/15.
 */
angular.module('myApp.szallito')

    .factory('SzallitoSrvc', function ($http, appConfig) {
        var factory = {};
        var url = "http://localhost:3000/";
        factory.getPartnerek = function () {
            return $http.get(appConfig.baseUrl + 'partnerek');
        }

        factory.getAfak = function () {
            return $http.get(url + 'afakulcsok');
        }

        return factory;
    })