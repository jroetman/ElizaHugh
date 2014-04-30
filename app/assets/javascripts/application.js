//This is a manifest file that'll be compiled into application.js, which will include all the files
//listed below.

//Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
//or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.

//It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
//compiled file.

//Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
//about supported directives.

//= require jquery
//= require jquery_ujs
//require jquery.turbolinks
//= require bootstrap
//= require d3
//= require angular.min
//= require jscolor/jscolor 
//= require_tree .

$(function(){
 
  $(".message").hide();
  $(".closemessage").click(function() {
	 $(this).closest(".message").hide(); 
  });
  $(".message").hover(function() {
	  $(this).stop()
	  $(this).fadeTo("fast", 1);
	  
   }, function() {
	  $(this).fadeOut(2500);
   });
  
  faye = new Faye.Client('http://localhost:9292/faye');
  faye.subscribe('/item/added_to_cart', function(data) {
	 $("#itemadded .messageBody").html(data)
	 $("#itemadded").fadeIn(500);
	 $("#itemadded").fadeOut(10000);
  });
  
  var userChan = $(".usermessage").attr("id")
 
  faye.subscribe('/item/' + userChan, function(data) {	     
		 $("#" + userChan + " .messageBody").html(data);
		 $("#" + userChan).fadeIn(500);
		 $("#" + userChan).fadeOut(10000);
   });
});