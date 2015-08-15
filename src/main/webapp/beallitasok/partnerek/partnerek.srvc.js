/**
 * Created by gaborsornyei on 29/07/15.
 */
angular.module('myApp.partnerek')

    .factory('PartnerekSrvc', function ($http, appConfig) {
        var factory = {};
        var url = appConfig.baseUrl + 'partnerek';

        factory.getPartnerek = function () {
            console.log(appConfig.baseUrl);
            return $http.get(url);
        }

        factory.getPartnerById = function (id) {
            return $http.get(url + '/' + id);
        }

        factory.savePartner = function (id, partner) {
            if (id > 0) {
                return $http.put(url + '/' + id, partner);
            } else {
                return $http.post(url, partner);
            }
        }

        factory.deletePartner = function (id) {
            return $http.delete(url + '/' + id);
        }

        return factory;
    })