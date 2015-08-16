/**
 * Created by gaborsornyei on 05/07/15.
 */
angular.module('myApp.szallito')

    .factory('SzallitoSrvc', function ($http, appConfig) {
        var factory = {};
        factory.getPartnerek = function () {
            return $http.get(appConfig.baseUrl + 'partnerek');
        }


        return factory;
    })