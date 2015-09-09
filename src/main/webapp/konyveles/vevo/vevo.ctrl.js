/**
 * Created by gaborsornyei on 24/07/15.
 */
(function () {
    angular.module('myApp.vevo')

        .controller('VevoCtrl', function ($scope, $rootScope, $state, VevoSrvc, CommonSrvc, naplo) {

            $scope.tetel = {
                naplotipus: 'V',
                tkjelleg: 'T',
                osszeg: 0,
                kontir: [],
                tartosszesen: 0,
                kovosszesen: 0,
                egyenlegTKjelleg: 'K'
            };
            $scope.sor = {
                tkjelleg: 'K',
                osszeg: 0
            };

            $scope.naplo = naplo.data[1];
            $scope.vevok = [];
            $scope.partnerek = [];
            $scope.fizmodok = [];
            $scope.szamlatukor = [];

            // Button callbacks
            //
            $scope.open = function ($event, opened) {
                $event.preventDefault();
                $event.stopPropagation();

                $scope[opened] = !$scope[opened];
            }

            $scope.addRow = function () {
                if (!$scope.sor.osszeg || !$scope.sor.fokszam || !$scope.sor.megnevezes || !$scope.vevoForm.$valid)
                    return;
                if ($scope.sor.afa) {
                    var kulcs = $scope.sor.afa.kulcs;
                    var afaSor = JSON.parse(JSON.stringify($scope.sor));
                    var bruttoOsszeg = Math.floor(($scope.sor.osszeg / (1 + kulcs / 100)) + 0.5)
                    var afaOsszeg = $scope.sor.osszeg - bruttoOsszeg;
                    $scope.sor.osszeg = bruttoOsszeg;
                    $scope.tetel.kontir.push(JSON.parse(JSON.stringify($scope.sor)));
                    afaSor.osszeg = afaOsszeg;
                    afaSor.fokszam = $scope.sor.afa.fokszam;
                    $scope.tetel.kontir.push(JSON.parse(JSON.stringify(afaSor)));

                } else {
                    $scope.tetel.kontir.push(JSON.parse(JSON.stringify($scope.sor)));
                }
                $scope.calculate();
                $scope.sor.afa = null;
                toastr.success('Sor hozzáadva', '', {
                    "timeOut": "1000"
                })
            }

            $scope.edit = function (index) {
                var kontir = $scope.tetel.kontir;
                if (kontir[index].afa) {
                    $scope.tetel.kontir.splice(index, 2);
                } else {
                    $scope.tetel.kontir.splice(index, 1);
                }

                $scope.calculate();
                toastr.warning('Sor törölve', '', {
                    "timeOut": "1000"
                })
            }

            $scope.reset = function () {
                reset();
                toastr.warning('Mezők törölve', '', {
                    "timeOut": "1000"
                })
            }

            $scope.save = function () {
                if ($scope.vevoForm.$valid &&
                    $scope.tetel.tartosszesen == $scope.tetel.kovosszesen) {
                    CommonSrvc.save($scope.tetel.naplotipus, $scope.tetel)
                        .success(function () {
                            reset();
                            toastr.success('Mentés sikerült!', '', {
                                "timeOut": "1000"
                            });
                            getNextNaploSorszam();
                        })
                        .error(function (data) {
                            $rootScope.error = data;
                            $state.go('error');
                        })

                }
            }

            $scope.checkPartnerAndBizszam = function () {
                CommonSrvc.checkPartnerAndBizszam($scope.tetel.partner, $scope.tetel.bizszam)
                    .success(function (data) {
                        var result = data;
                        if (result)
                            toastr.warning('Ehhez a partnerhez már volt ez a bizonylat rögzítve', '', {
                                "timeOut": "2000"
                            })
                    })
                    .error(function (data) {
                        $rootScope.error = data;
                        $state.go('error');
                    })
            }

            reset = function () {
                $scope.tetel = {
                    naplotipus: 'V',
                    tkjelleg: 'K',
                    osszeg: 0,
                    kontir: [],
                    tartosszesen: 0,
                    kovosszesen: 0,
                    egyenlegTKjelleg: 'T'
                };

                $scope.sor = {
                    tkjelleg: 'T',
                    osszeg: 0
                };
                $scope.vevoForm.$setUntouched();
            }

            getNextNaploSorszam = function () {
                CommonSrvc.getNextNaploSorSzam('V')
                    .success(function (data) {
                        $scope.naploSorszam = data;
                    })
                    .error(function (data) {
                        $rootScope.error = data;
                        $state.go('error');
                    })
            }

            // Activate

            getNextNaploSorszam();

            VevoSrvc.getPartnerek()
                .success(function (data) {
                    $scope.partnerek = _.filter(data, function (partner) {
                        return partner.vevo === true;
                    })
                })
                .error(function (data) {
                    $rootScope.error = data;
                    $state.go('error');
                })

            CommonSrvc.getAfak()
                .success(function (data) {
                    $scope.afak = _.filter(data, function (afa) {
                        return afa.fokszam.toString().indexOf('467') > -1;
                    })
                })
                .error(function (data) {
                    $rootScope.error = data;
                    $state.go('error');
                })

            CommonSrvc.getFizModok()
                .success((function (data) {
                    $scope.fizmodok = data;
                }))
                .error(function (data) {
                    $rootScope.error = data;
                    $state.go('error');
                })

            CommonSrvc.getSzamlatukor()
                .success(function (data) {
                    $scope.szamlatukor = _.filter(data, function (item) {
                        return (
                            item.osszesito === false &&
                            item.fokszam.toString().indexOf('31') === -1 &&
                            item.fokszam.toString().indexOf('454') === -1 &&
                            item.fokszam.toString().indexOf('467') === -1 &&
                            item.fokszam.toString().indexOf('466') === -1
                        )
                    });
                    $scope.vevok = _.filter(data, function (item) {
                        return item.fokszam.toString().substr(0, 2) === '31' &&
                            item.osszesito === false;
                    });
                })
                .error(function (data) {
                    $rootScope.error = data;
                    $state.go('error');
                })


            // Functions
            //
            $scope.calculate = function () {
                var tetel = $scope.tetel;
                var tart = (tetel.tkjelleg == 'T') ? tetel.osszeg : 0;
                var kov = (tetel.tkjelleg == 'K') ? tetel.osszeg : 0;
                for (var i = 0; i < tetel.kontir.length; i++) {
                    var kontir = tetel.kontir[i];
                    if (kontir.tkjelleg == 'T')
                        tart += kontir.osszeg;
                    else
                        kov += kontir.osszeg;
                }
                $scope.tetel.tartosszesen = tart;
                $scope.tetel.kovosszesen = kov;
                $scope.tetel.egyenlegTKjelleg = (tart > kov) ? 'K' : 'T';
                $scope.sor.tkjelleg = $scope.tetel.egyenlegTKjelleg;
                $scope.sor.osszeg = ($scope.sor.tkjelleg == 'T') ? ($scope.tetel.kovosszesen - $scope.tetel.tartosszesen) :
                    ($scope.tetel.tartosszesen - $scope.tetel.kovosszesen)
                $scope.sor.megnevezes = $scope.tetel.megnevezes;
            }
        })
})();