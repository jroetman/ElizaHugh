# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
     
  
jQuery ->
  
  handler = StripeCheckout.configure({
    key: 'pk_test_VfHP98Jj6JcxsM3JGHjvYrne',
    image: '/ehLogo.png',
    token: (token, args)  ->
  
  })

  $("#new_shipping_address").hide()
  
  $(".shipping").click ->
    if $(this).is(':checked')
      $("#new_shipping_address").show()
    else
      $("#new_shipping_address").hide()
 

  $('#payWithCard').click (e) ->
    handler.open({
      name: 'Eliza Hugh',
      description: '23',
      amount: 2000
    });
    e.preventDefault();
  
  $("#statedropdown").change ->
    if $(this).children(":selected").text() == 'ME'
      $("#grandTotal").text($("#totalMaine").attr("value"))
    else
      $("#grandTotal").text($("#totalOut").attr("value"))