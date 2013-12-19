$ ->

  $(document).on("click", ".image_link", ->
    $("#modal_image_name").text($(this).data("name"))
  )