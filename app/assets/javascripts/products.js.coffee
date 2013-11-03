# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

processDragOverOrEnter = (event) ->
  event?.preventDefault()
  event.dataTransfer.effectAllowed = 'copy'
  false
  
element.bind 'dragover', processDragOverOrEnter
element.bind 'dragenter', processDragOverOrEnter

element.bind 'drop', (event) ->
  event.preventDefault()
  reader = new FileReader()
  reader.onload = (evt) ->
    if checkSize(size) and isTypeValid(type)
      scope.$apply ->
        scope.file = evt.target.result
        scope.fileName = name if angular.isString scope.fileName
        
   file = event.dataTransfer.files[0]
   name = file.name
   type = file.type
   size = file.size
   reader.readAsDataURL file
   false
   