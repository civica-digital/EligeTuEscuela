$(document).on "page:change", ->

  if $('#gmap').length > 0
    gmap = $('#gmap')
    home = gmap.data('home')
    markers = $.map gmap.data('markers'), (marker, index) ->
      latitude: marker.latitude
      longitude: marker.longitude
      info:
        number: index+1
        title: marker.name
        address: marker.to_address


    new PinDropper('#gmap', markers, home)
