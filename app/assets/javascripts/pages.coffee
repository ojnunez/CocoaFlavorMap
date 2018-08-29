#= require jquery
#= require jquery_ujs
#= require foundation
#= require turbolinks
#= require jquery.slick
#= require jssocials
#= require jssocials.shares
#= require lightslider.min
#= require lightgallery-all.min
# require_tree .

$(document).on "turbolinks:load", ->

  $(document).foundation()
  #
  #  $('.gallery-element').lightSlider
  #    gallery:true,
  #    item:3,
  #    loop:false,
  #    auto: false,
  #    thumbItem:0,
  #    slideMargin:5,
  #    enableDrag: false,
  #    currentPagerPosition:'left',
  #    onSliderLoad: (el) ->
  #      el.lightGallery selector: '.gallery-element .lslide'
  #      return
