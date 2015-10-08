/**
 * Created by gaborsornyei on 24/07/15.
 */
(function () {
    angular.module('myApp.bank')

        .controller('BankCtrl', function ($scope, $rootScope, $state, $stateParams, CommonSrvc, naplo, AuthSrvc) {

            if (!AuthSrvc.isLoggedIn()) {
                $state.go('login');
            }

            $scope.tetel = {
                naplotipus: 'B',
                tkjelleg: 'T',
                osszeg: 0,
                kontir: [],
                tartosszesen: 0,
                kovosszesen: 0,
                egyenlegTKjelleg: 'K',
            };
            $scope.sor = {
                tkjelleg: 'K',
                osszeg: 0,
                ellenbizszam: ''
            };

            $scope.kiegyenlites = false;
            $scope.naplo = naplo.data[3];
            $scope.bankok = [];
            $scope.partnerek = [];
            $scope.szamlatukor = [];

            // Button callbacks
            //
            $scope.open = function ($event, opened) {
                $event.preventDefault();
                $event.stopPropagation();

                $scope[opened] = !$scope[opened];

            }

            $scope.datumMasol = function () {
                $scope.tetel.kialldatum = $scope.tetel.eseddatum = $scope.tetel.teljdatum;
            }

            $scope.addRow = function () {
                if (!$scope.sor.osszeg || !$scope.sor.fokszam || !$scope.sor.megnevezes || !$scope.bankForm.$valid)
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
                if ($scope.bankForm.$valid &&
                    $scope.tetel.tartosszesen == $scope.tetel.kovosszesen) {
                    CommonSrvc.save($scope.tetel.naplotipus, $scope.tetel)
                        .success(function () {
                            reset()
                            getNextNaploSorszam();
                            toastr.success('Mentés sikerült!', '', {
                                "timeOut": "1000"
                            });
                        })
                        .error(function (data) {
                            $rootScope.error = data;
                            $state.go('error');
                        })

                }
            }

            $scope.kiegyenlit = function (fokszam) {
                if ($scope.sor.fokszam.toString().indexOf('31') > -1
                    || $scope.sor.fokszam.toString().indexOf('454') > -1
                ) {
                    $scope.kiegyenlites = true;
                    $scope.sor.megnevezes = "Kiegyenlítés";
                } else {
                    $scope.kiegyenlites = false;
                }
            }

            $scope.checkBizszam = function () {
                CommonSrvc.getKifizetetlenBizszamok($scope.tetel.partner)
                    .success(function (bizszamok) {
                        if (bizszamok.indexOf($scope.sor.ellenbizszam) < 0) {
                            toastr.warning('Ez a bizonylatszám nem könyvelhető a megadott partnerhez', '', {
                                timeOut: "3000"
                            });
                            $scope.bankForm.ellenbizszam.$invalid = true;
                        }
                    })
                    .error(function (data) {
                        $rootScope.error = data;
                        $state.go('error');
                    })
            }

            reset = function () {
                $scope.tetel = {
                    naplotipus: 'B',
                    tkjelleg: 'T',
                    osszeg: 0,
                    kontir: [],
                    tartosszesen: 0,
                    kovosszesen: 0,
                    egyenlegTKjelleg: 'T'
                };

                $scope.sor = {
                    tkjelleg: 'K',
                    osszeg: 0
                };
                $scope.bankForm.$setUntouched();
            }

            getNextNaploSorszam = function () {
                CommonSrvc.getNextNaploSorSzam('B')
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

            CommonSrvc.getPartnerek()
                .success(function (data) {
                    $scope.partnerek = data;
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
                            item.fokszam.toString().indexOf('381') === -1 &&
                            item.fokszam.toString().indexOf('384') === -1 &&
                            item.fokszam.toString().indexOf('467') === -1 &&
                            item.fokszam.toString().indexOf('466') === -1
                        )
                    });
                    $scope.bankok = _.filter(data, function (item) {
                        return item.fokszam.toString().indexOf('384') > -1 &&
                            item.osszesito === false;
                    });

                })
                .error(function (data) {
                    $rootScope.error = data;
                    $state.go('error');
                })

            CommonSrvc.getAfak()
                .success(function (data) {
                    $scope.afak = data;
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