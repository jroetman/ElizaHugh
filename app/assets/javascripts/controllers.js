var storeFront = angular.module('storeFront', []);

storeFront.controller('SpecialsCtrl', function SpecialsCtrl($scope) {
    $scope.specials = [{'title':'Summer Clearance', 'description':'Save 20%!', 'color':'warning'}, 
                       {'title':'New Arrivals', 'description': 'Horse Plops, Sweaters', 'color':'info'}, 
                       {'title':'In the Nick of Time', 'description' : 'The holidays are here. Have your gift wrapped and delivered on time!','color':'success'}]; 
   });

