window.app =
  ready: ->
    $("#tiles").imagesLoaded ->
      options =
        autoResize: true # This will auto-update the layout when the browser window is resized.
        container: $("#tiles") # Optional, used for some extra CSS styling
        offset: 5 # Optional, the distance between grid items
        flexibleWidth: 310 # Optional, the maximum width of a grid item

      handler = $("#tiles li")

      handler.wookmark options
      console.log "LOADED"

$(document).ready(app.ready)