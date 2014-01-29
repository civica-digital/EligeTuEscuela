class window.PinDropper

  constructor: (map_selector, markers, home, options) ->
    @map = new google.maps.Map($(map_selector)[0], @_options(options))
    @_build_marker(home, "home.png")
    @school_markers = @_build_markers_for_schools(markers)
    @cluster = new MarkerClusterer(@map, @school_markers)

  updateMarkers: (markers) ->
    @clearMap()
    @school_markers = @_build_markers_for_schools(markers)
    @cluster = new MarkerClusterer(@map, @school_markers)

  clearMap: ->
    for marker in @school_markers
      marker.setMap(null)
    @school_markers = []

  _options: (raw_options) ->
    mapOptions = $.extend({
      zoom: 8
      center: new google.maps.LatLng(0.0,0.0)
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }, raw_options)

  _build_marker: (marker, icon) ->
    new google.maps.Marker(
      position: new google.maps.LatLng(marker.latitude, marker.longitude)
      map: @map
      draggable: false
      animation: google.maps.Animation.DROP
      icon: "/assets/google_icons/#{icon}"
    )

  _build_markers_for_schools: (markers) ->
    bounds = new google.maps.LatLngBounds()
    info_window_content = "<strong></strong>"
    info_window = new google.maps.InfoWindow(
      content: info_window_content
      maxWidth: 400
    )
    g_markers = $.map markers, (e) =>
      marker = @_build_marker(e, "number_#{e.info.number}.png")

      google.maps.event.addListener marker, 'click', ->
        info_window.setContent "<h3>#{e.info.title}</h3><p>#{e.info.address}</p>"
        info_window.open(@map, marker)


      bounds.extend(marker.getPosition())
      marker

    if markers.length > 1
      @map.fitBounds(bounds)
    else if markers.length == 1
      @map.setCenter(g_markers[0].getPosition())

    g_markers
