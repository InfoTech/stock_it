<% if params[:untagged] %>
  $(".image_row[data-id='<%= @image.id %>']").fadeOut()
<% else %>
  $(".image_details[data-id='<%= @image.id %>']").html("<%= j render('show', image: @image) %>")
<% end %>