$(document).on("turbolinks:load", function() {
  $(".pictures-sortable").sortable({
    axis: "y",
    items: ".picture"
  });

  $(".add-picture").click(function() {
    $(".picture-sortable").append(
      '<div class="picture"><input multiple="multiple" type="file" name="post[pictures][]"></div>'
    );
  });

  $(".remove-picture").click(function() {
    $(this)
      .parent(".picture")
      .remove();
  });
});
