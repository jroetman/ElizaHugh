# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->  
    $("#content").on("ajax:complete", ".new_user", (data, status, xhr) ->
       json = $.parseJSON(status.responseText)
       $(".notice").empty();
       if (status = "302")   
         alert('hi')
       else
         $.each(json, (k,v) ->
           $(".notice").append("<li>" + v);
         )
       
       
       
    )
