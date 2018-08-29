#= require jquery
#= require admin/jquery-ui
#= require jquery_ujs
#= require admin/waypoints.min
#= require admin/preloader-script
#= require admin/what-input
#= require admin/foundation.min
#= require ckeditor/init
#= require admin/jquery.slimscroll.min
#= require admin/jquery.slicknav.min
#= require admin/sliding-menu
#= require admin/scriptbreaker-multiple-accordion-1
#= require admin/jquery.counterup.min
#= require admin/jquery.circliful.min
#= require admin/app
#= require admin/jquery.velocity.min
#= require admin/number-pb
#= require admin/loader
#= require admin/demo
#= require admin/jquery.flot.min
#= require admin/jquery.flot.resize.min
#= require admin/jquery.flot.pie.min
#= require admin/jquery.flot.categories.min
#= require admin/skycons
#= require admin/gmap3.min
#= require admin/dashboard
#= require dataTables/jquery.dataTables
#= require dataTables/jquery.dataTables.foundation
#= require jquery_nested_form
#= require admin/jquery.datetimepicker.full
#= require foundation.reveal
#= require admin/table
# require_tree .

$(document).ready ->

  $(document).foundation()

  $('#datetimepicker').datetimepicker()

  $(".simple-data-table").DataTable(
    lengthChange: false,
    language: {
      loadingRecords: "Cargando ...",
      emptyTable: "No se encontraron resultados",
      zeroRecords: "No se encontraron resultados",
      info: "Mostrando desde _START_ hasta _END_ de _TOTAL_ registros",
      infoEmpty: "Mostrando desde 0 hasta 0 de 0 registros",
      infoFiltered: "(filtrado de _MAX_ registros en total)",
      search: "Filtro rápido: ",
      paginate: {
        previous: "Anterior",
        next: "Siguiente"
      }
    }
  )

readURL = (input, previewer) ->
if input.files and input.files[0]
  reader = new FileReader()
  reader.onload = (e) ->
    previewer.attr "src", e.target.result
    return
  reader.readAsDataURL input.files[0]
return

makePreviewer = (obj) ->
  self = obj
  img = $(self).next("img")
  a = $("<a />").
        addClass("input-file").
        addClass("button").
        text("Seleccione una imagen")

  $(self).before(
    a.on "click", (e) ->
      e.preventDefault()
      e.stopPropagation()
      $(self).trigger "click"
  )

  $(self).on "change", ->
    readURL(self, img)
    img.css("height", a.outerHeight())

  $(self).hide()

$(document).ready ->
  $("[data-preview]").each ->
    makePreviewer(this)

$(document).on "nested:fieldAdded", (event) ->
  container = event.field.closest(".fields")
  container.find("[data-preview]").each ->
    makePreviewer(this)
