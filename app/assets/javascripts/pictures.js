$(document).on("turbolinks:load", function() {
  $(".image-sortable").sortable({
    axis: "y",
    items: ".image"
  });

  var cliclTimes = 0;
  $(".add-image").click(function() {
    console.log(cliclTimes);
    $(".file_fields").append(
      `<li class="file_field${cliclTimes} file_field_style">
        <input multiple="multiple" type="file" name="post[pictures][]" class=""form-control-file id="exampleFormControlFile">
        <button type="button" class="remove-image btn btn-outline-danger">削除</button>
      </li>`
    );
  });

  $(document).on("click", ".remove-image", function() {
    console.log(this);
    $(this)
      .parent()
      .remove();
  });

  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        $("#img_prev").attr("src", e.target.result);
      };
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#exampleFormControlFile1").change(function() {
    readURL(this);
  });
});
