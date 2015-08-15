/**
 * Created by gaborsornyei on 29/07/15.
 */
angular.module('myApp.afakulcsok')

    .factory('AfakulcsokSrvc', function ($http, appConfig) {
        var factory = {};
        var url = appConfig.baseUrl + 'afakulcsok';
        factory.getAfak = function () {
            return $http.get(url);
        }

        factory.getAfaById = function (id) {
            return $http.get(url + '/' + id);
        }

        factory.updateAfa = function (id, data) {
            return $http.put(url + '/' + id, data);
        }

        factory.createAfa = function (data) {
            return $http.post(url, data);
        }

        factory.deleteAfa = function (id) {
            return $http.delete(url + '/' + id);
        }

        return factory;
    })