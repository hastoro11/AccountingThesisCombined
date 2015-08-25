/**
 * Created by gaborsornyei on 05/07/15.
 */
angular.module('myApp.szallito')


    .controller('SzallitoCtrl', function ($scope, SzallitoSrvc, CommonSrvc, naplo) {


        $scope.tetel = {
            naplotipus: 'S',
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

        $scope.naplo = naplo.data[0];
        $scope.szallitok = [];
        $scope.partnerek = [];
        $scope.fizmodok = [];
        $scope.szamlatukor = [];
        $scope.hatarido = 0;
        $scope.naploSorszam = 0;
        //------------------

        // Button Functions
        $scope.open = function ($event, opened) {
            $event.preventDefault();
            $event.stopPropagation();

            $scope[opened] = !$scope[opened]
        }

        $scope.addRow = function () {
            if (!$scope.sor.osszeg || !$scope.sor.fokszam || !$scope.sor.megnevezes || !$scope.szallitoForm.$valid)
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

        $scope.reset = function () {
            reset();
            toastr.warning('Mezők törölve', '', {
                "timeOut": "1000"
            })
        }

        $scope.save = function () {
            if ($scope.szallitoForm.$valid &&
                $scope.tetel.tartosszesen == $scope.tetel.kovosszesen) {
                console.log($scope.tetel);
                SzallitoSrvc.save($scope.tetel)
                    .success(function () {
                        toastr.success('Mentés sikerült!', '', {
                            "timeOut": "1000"
                        });
                        reset();
                        getNextNaploSorszam();
                    })
                    .error(function (data) {
                        console.log(data);
                    })

            }
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

        // Functions
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

        reset = function () {
            $scope.tetel = {
                naplotipus: 'S',
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
            $scope.szallitoForm.$setUntouched();
        }

        getNextNaploSorszam = function () {
            CommonSrvc.getNextNaploSorSzam('S')
                .success(function (data) {
                    $scope.naploSorszam = data;
                })
        }

        // Activate
        //

        getNextNaploSorszam();

        SzallitoSrvc.getPartnerek()
            .success(function (data) {
                $scope.partnerek = _.filter(data, function (partner) {
                    return partner.szallito === true;
                })
            })
        CommonSrvc.getAfak()
            .success(function (data) {
                $scope.afak = _.filter(data, function (afa) {
                    return afa.fokszam.toString().indexOf('466') > -1
                })
            })
        CommonSrvc.getFizModok().
            success(function (data) {
                $scope.fizmodok = data;
            })
        CommonSrvc.getSzamlatukor()
            .success(function (data) {
                $scope.szamlatukor = _.filter(data, function (szamla) {
                    return szamla.osszesito === false
                        && szamla.fokszam.toString().indexOf('454') === -1
                        && szamla.fokszam.toString().indexOf('466') === -1
                        && szamla.fokszam.toString().indexOf('467') === -1;
                })

                $scope.szallitok = _.filter(data, function (item) {
                    return item.fokszam.toString().indexOf('454') > -1 &&
                        item.osszesito === false;
                })
            });


    });