# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#adminTabs').on('shown.bs.tab', (e) ->
    target = $(e.target).attr("href")
    $.get("/admin/" + target.replace(/#/, ''), ((data) ->
      $("#adminContent").html(data)
      $("#content").trigger("refreshProducts")
      ), 'html')
     
  )
  
  
  $('#adminTabs a:first').tab('show')
    
  $("#content").on("ajax:complete", ".remove", ->
    alert("success"))
    
    	
  $("#content").on("ajax:complete", ".edit_special", (data, status, xhr) ->
    $(this).find(".saveStatus:first").text(status.responseText))

  $("#content").on("ajax:complete", ".newSpecial", (data, status, xhr) ->
    $("#specialsTable tbody").append("<tr><td>" + status.responseText))
     
  $("#content").on("refreshProducts", () ->
    if ($(".updated").length == 1)
      topOffsetFirst = $(".updated:first").offset().top
      topOffsetContainer = $(".prodContainer:first").offset().top
      $(".prodContainer:first").scrollTop(topOffset - topOffsetContainer)
  )

  
  
    