window.app =
  ready: ->
    $("#tiles").imagesLoaded ->
      options =
        autoResize: true
        container: $("#tiles")
        offset: 5 # Optional, the distance between grid items
        flexibleWidth: 310 # Optional, the maximum width of a grid item

      handler = $("#tiles li")

      handler.wookmark options

$(document).ready(app.ready)