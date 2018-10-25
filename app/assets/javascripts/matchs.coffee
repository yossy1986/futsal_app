# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change', '#match_req_pref_id', ->
  $.ajax(
    type: 'GET'
    url: '/matchs/get_facilities'
    data: {
      pref_id: $(this).val()
    }
  ).done (data) ->
    $('#matchreq_facility_id').html(data)