/**
 * Created by gaborsornyei on 05/07/15.
 */
angular.module('myApp.szallito')

    .factory('SzallitoSrvc', function ($http, appConfig) {
        var factory = {};
        factory.getPartnerek = function () {
            return $http.get(appConfig.baseUrl + 'partnerek');
        }

        factory.save = function (tetel) {
            return $http.post(appConfig.baseUrl + 'szallito', tetel);
        }


        return factory;
    })