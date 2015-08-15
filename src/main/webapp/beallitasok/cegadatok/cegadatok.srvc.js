/**
 * Created by gaborsornyei on 27/07/15.
 */
angular.module('myApp.cegadatok')

    .factory('CegadatokSrvc', function ($http, appConfig) {
        var factory = {};
        var url = appConfig.baseUrl + 'cegadatok';

        factory.getCegadatok = function () {
            return $http.get(url);
        }

        factory.setCegadatok = function (id, data) {
            return $http.put(url, data);
        }

        return factory;
    })


