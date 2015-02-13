# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

root = exports ? this
root.post_event = () ->
  $.ajax({
    type: "POST",
    url: '/events',
    data: { 'event[message]': $('#post-event textarea').val()},
    success: (json) ->
      if(json.error == undefined)
        $('.new-event .post-result').text(json.message)
      else
        $('.new-event .post-result').text(json.error)
  })