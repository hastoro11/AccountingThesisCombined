/**
 * Created by gaborsornyei on 06/07/15.
 */
angular.module('myApp.common', ['chieffancypants.loadingBar'])

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

        factory.getNextNaploSorSzam = function (naplotipus) {
            return $http.get(appConfig.baseUrl + 'common/naplo/' + naplotipus);
        }

        factory.getKifizetetlenBizszamok = function (partnerid) {
            return $http.get(appConfig.baseUrl + 'common/kifiztlen/' + partnerid);
        }

        factory.save = function (naplotipus, tetel) {
            if (naplotipus === 'E') {
                return $http.post(appConfig.baseUrl + 'vegyes', tetel);
            } else if (naplotipus === 'P')
                return $http.post(appConfig.baseUrl + 'penztar', tetel);
            else if (naplotipus == 'B') {
                return $http.post(appConfig.baseUrl + 'bank', tetel);
            }
            else if (naplotipus == 'S') {
                return $http.post(appConfig.baseUrl + 'szallito', tetel);
            }
            else if (naplotipus == 'V') {
                return $http.post(appConfig.baseUrl + 'vevo', tetel);
            }
        }

        factory.checkPartnerAndBizszam = function (parnterid, bizsszam) {
            return $http.get(appConfig.baseUrl + 'common/checkbizsz/' + parnterid + '/' + bizsszam);
        }

        //---------------
        return factory;
    })