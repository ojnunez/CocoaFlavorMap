#= require jquery
#= require jquery_ujs
#= require foundation
#= require turbolinks
# require_tree .

@initMap = ->
  if document.getElementById('map')
    ele = document.getElementById('map')
    map = new google.maps.Map(ele, {
      center: {
        lat: parseFloat(ele.getAttribute('data-lat')),
        lng: parseFloat(ele.getAttribute('data-lng'))
      },
      zoom: 6,
      scrollwheel: false
    })

    marker = new google.maps.Marker({
      position: {
        lat: parseFloat(ele.getAttribute('data-lat')),
        lng: parseFloat(ele.getAttribute('data-lng'))
      },
      animation: google.maps.Animation.DROP,
      draggable: true,
      map: map
    })

    google.maps.event.addListener marker, 'dragend', ->
      document.getElementById('item_lat').value = marker.getPosition().lat()
      document.getElementById('item_lng').value = marker.getPosition().lng()

$(document).on "turbolinks:load", ->

  $(document).foundation()
