ready = ->

  if $('#gmap').length > 0
    gmap = $('#gmap')
    home = gmap.data('home')
    markers = $.map gmap.data('markers'), (marker, index) ->
      latitude: marker.latitude
      longitude: marker.longitude
      info:
        number: index+1
        title: marker.name
        address: marker.full_address

    EligeTuEscuela['schools_map'] = new PinDropper('#gmap', markers, home)

  $('#filter_schools').on('ajax:success', (e, data, status, xhr) ->
    $('tbody', '#school-results').html JST["templates/schools/schools"](schools : data)

    # update map with new pins
    markers = $.map data, (marker, index) ->
      latitude: marker.latitude
      longitude: marker.longitude
      info:
        number: index+1
        title: marker.name
        address: marker.full_address

    window.EligeTuEscuela['schools_map'].updateMarkers(markers)
    true

  ).on 'ajax:error', (e, xhr, status, error) ->
    alert(xhr.responseText)

$(document).ready(ready)
$(document).on('page:load', ready)
