/**
 * Created by gaborsornyei on 15. 09. 06..
 */
angular.module('myApp.partner', [])
    .config(function ($stateProvider) {
        $stateProvider
            .state('partner', {
                url:'/partner',
                templateUrl:'listak/partner/partner.list.html',
                controller:'PartnerCtrl'
            });
    })