window.app =
  ready: ->
    $('.content').isotope
      itemSelector: ".item"
      layoutMode: "fitRows"

$(document).ready(app.ready)