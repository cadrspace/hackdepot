# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

setPointFromLocationTag = (handler) ->
  cllLat = $("#location").data("location-lat")
  cllLng = $("#location").data("location-lng")

  if cllLat != undefined && cllLng != undefined
    
    latlng = new google.maps.LatLng(cllLat, cllLng)
    handler.getMap().setCenter(latlng)

    marker = new Marker()
    mark = marker.add(handler.getMap(), latlng)
    handler.addMarker(mark)
    
  return 


$(document).ready ->

  markers = []
  
  handler = Gmaps.build('Google')
  handler.buildMap {
    provider: {}
    internal: id: 'map'
  }, ->

    if navigator.geolocation
      browserSupportFlag = true
      navigator.geolocation.getCurrentPosition ((position) ->
        initialLocation = new (google.maps.LatLng)(position.coords.latitude, position.coords.longitude)
        handler.getMap().setCenter initialLocation
        setPointFromLocationTag(handler)
        return
      ), ->
        handleNoGeolocation browserSupportFlag
        return
    else
      browserSupportFlag = false
      handleNoGeolocation browserSupportFlag

    handler.fitMapToBounds()
    map = handler.getMap()


    google.maps.event.addListener map, 'click', (event) ->

      if $(".edit_place").length > 0
        marker = new Marker()
        marker = marker.add(map, event.latLng)
        console.log(event)
        $("#place_location").val("[" + event.latLng.lat().toString() + ", "+ event.latLng.lng().toString() + "]")
      
        if markers.length > 0
          handler.removeMarker(markers[0])
          markers = []
        
        mark = handler.addMarker(marker)
        markers.push(mark)
        
    return

    
class Marker
  construct: (data) ->
    @data = data
    @googleMarker = false
    return this

  this.clean = (markers) ->
    $(markers).each (k,m) ->
      m.setMap(null)
    return markers
        
  add: (map, position) ->
    marker = new google.maps.Marker({
      'lat': position.lat()
      'lng': position.lng()
      'width': 36
      'height': 36
      'infowindow': 'hello!'
      })
    return marker


class Data
  getPlaces:() ->
    $.get 'http://localhost:3000/places.json', (data) ->
      return data


class Place
  constructor: (place) ->
    @name = place.name
    @description = place.description
    @location = place.location
