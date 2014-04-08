# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ -> 
   $("#catfilter").on('change', '.catfilter', ->
      p = {cats : []}; 
      $(".catfilter:checked").each -> 
         p.cats.push($(this).attr('value'))
         $("#catSelectAll").attr("checked", false) 
         
      $.get('/products/partIdx', p, ((data) -> 
         $("#productList").html(data)), 'html')
         
    )
    $("#catSelectAll").click( ->
      $(".catfilter").prop("checked", this.checked)
      $.get('/products/partIdx', [], ((data) -> 
         $("#productList").html(data)), 'html')
    )
    $("#content").on("ajax:complete", ".editProduct", (data, status, xhr) ->
      $("#myModal").html(status.responseText).modal();
      
    )