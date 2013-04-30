window.app =
  ready: ->
    $('#login_form,#register_form').on('click', 'a[data-clear-form]', app.clear_form)
    $(document).foundation()
    $("#tiles").imagesLoaded ->
      options =
        autoResize: true
        container: $("#tiles")
        offset: 5 # Optional, the distance between grid items
        flexibleWidth: 310 # Optional, the maximum width of a grid item
      handler = $("#tiles li")
      handler.wookmark options

  clear_form: (e) ->
    console.log('click!')
    e.preventDefault()
    $('#login_form,#register_form').empty()

$(document).ready(app.ready)