# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
storeFront = angular.module 'storeFront', []
storeFront.controller 'SpecialsCtrl',  ($scope) ->
      $scope.specials  = [{'title':'Summer Clearance', 'description':'Save 20%!', 'color':'warning'}, 
                  {'title':'New Arrivals', 'description': 'Horse Plops, Sweaters', 'color':'info'}, 
                  {'title':'In the Nick of Time', 'description' : 'The holidays are here. Have your gift wrapped and delivered on time!','color':'success'}];
   

