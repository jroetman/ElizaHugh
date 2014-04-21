# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  
  $("#new_shipping_address").hide()
   
  $(".shipping").click ->
    if $(this).is(':checked') 
      $("#new_shipping_address").show()
    else
      $("#new_shipping_address").hide()
   