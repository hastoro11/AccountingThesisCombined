/**
 * Created by gaborsornyei on 06/07/15.
 */
angular.module('myApp.common', [])

    .factory('CommonSrvc', function ($http, appConfig) {
        var factory = {};
        //---------------

        factory.getFizModok = function () {
            return $http.get(appConfig.baseUrl + 'fizmodok');
        }

        factory.getSzamlatukor = function () {
            return $http.get(appConfig.baseUrl + 'szamlatukor');
        }

        factory.getNaplok = function () {
            return $http.get(appConfig.baseUrl + naplok);
        }

        factory.getPartnerek = function () {
            return $http.get(appConfig.baseUrl + 'partnerek');
        }


        factory.getAfak = function () {
            return $http.get(appConfig.baseUrl + 'afakulcsok');
        }

        //---------------
        return factory;
    })