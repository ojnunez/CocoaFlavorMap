#= require jquery
#= require jquery_ujs
#= require foundation
#= require turbolinks
#= require jquery.slick
# require_tree .

$(document).on "turbolinks:load", ->

  $(document).foundation()

  $('.projects-wrapper').slick
    dots: true,
    infinite: true,
    speed: 500,
    slidesToShow: 3,
    slidesToScroll: 3,
    autoplay: true,
    responsive: [
      {
        breakpoint: 800
        settings:
          slidesToShow: 2
          slidesToScroll: 2
      }
      {
        breakpoint: 480
        settings:
          slidesToShow: 1
          slidesToScroll: 1
      }
    ]

    $('.news-wrapper').slick
      dots: true,
      infinite: true,
      speed: 500,
      slidesToShow: 3,
      slidesToScroll: 3,
      autoplay: true,
      responsive: [
        {
          breakpoint: 800
          settings:
            slidesToShow: 2
            slidesToScroll: 2
        }
        {
          breakpoint: 480
          settings:
            slidesToShow: 1
            slidesToScroll: 1
        }
      ]

() ->
  $(document).foundation()
