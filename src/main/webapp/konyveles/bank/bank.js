/**
 * Created by gaborsornyei on 24/07/15.
 */
angular.module('myApp.bank', [])

    .config(function ($stateProvider) {
        $stateProvider
            .state('bank', {
                url: '/bank',
                templateUrl: 'konyveles/bank/bank.html',
                controller: 'BankCtrl',
                resolve: {
                    naplo: function ($http) {
                        return $http.get('http://localhost:3000/naplo');
                    }
                }
            })
    })