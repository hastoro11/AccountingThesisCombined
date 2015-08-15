/**
 * Created by gaborsornyei on 30/07/15.
 */
angular.module('myApp.fizmodok')

    .factory('FizmodokSrvc', function ($http, appConfig) {
        var factory = {};
        var url = appConfig.baseUrl + 'fizmodok';

        factory.getFizmodok = function () {
            return $http.get(url);
        }

        factory.getFizmodById = function (id) {
            return $http.get(url + '/' + id);
        }

        factory.updateFizmod = function (id, data) {
            return $http.put(url + '/' + id, data);
        }

        factory.createFizomd = function (data) {
            return $http.post(url, data);
        }

        factory.deleteFizmod = function (id) {
            return $http.delete(url + '/' + id);
        }

        return factory;
    })