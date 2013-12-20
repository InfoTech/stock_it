$ ->

  $(document).on("click", ".image_link", ->
    $("#modal_image_name").text($(this).data("name"))
    $.get($(this).attr("href"), (data) ->
      $("#imageModal .modal-body").html(data)
    )
    return false
  )

  Dropzone.options.imagesDropzone = {
    paramName: "image[attachment]",
    complete: (file) ->
      $("#edit_untagged_images").show()
  };