# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
     
  
$ ->
  handler = StripeCheckout.configure({
    key: 'pk_test_VfHP98Jj6JcxsM3JGHjvYrne',
    image: '/ehLogo.png',
    billingAddress: true,
    shippingAddress: true,
    token: (token, args)  ->
        window.location.href = "/cart/complete"
  })

  $("#new_shipping_address").hide();
  $("#statedropdown").prop("selectedIndex", 0);
  
  $(".shipping").click ->
    if $(this).is(':checked')
      $("#new_shipping_address").show()
    else
      $("#new_shipping_address").hide()
 
  $('#payWithCard').click (e) ->
    total = parseInt($("#grandTotal").text()) * 100;
    state = $("#statedropdown").children(":selected").text();
    
    
    
    if state != ''
      handler.open({
        name: 'Eliza Hugh',
        description: '',
        amount: total,
        stripeBillingAddressState: state
      });
      e.preventDefault();
     
    else
      $("#checkoutInfo").text("Please Choose a state");

	  
  $("#statedropdown").change ->
    if $(this).children(":selected").text() == 'ME'
      $("#grandTotal").text($("#totalMaine").attr("value"))
    else
      $("#grandTotal").text($("#totalOut").attr("value"))
  