# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

root = exports ? this
root.add_one_like = (user_id) ->
  $.ajax({
    url: '/users/' + user_id + '/like',
    success: (like_number) ->
      $('#user-' + (user_id) + ' .like').text(like_number)
  })