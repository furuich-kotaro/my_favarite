$(document).on("turbolinks:load", function() {
  var clickTimes = 0;

  $(".add-image").click(function() {
    clickTimes += 1;
    var form = `<div class="f-item" id="item${clickTimes}">
                  <input multiple="multiple" type="file" name="post[pictures][]" id="post_img${clickTimes}" class="form-control-file">
                  <img class="prev">
                  <button type="button" class="remove-image btn btn-outline-danger btn-block">
                    削除
                  </button>
                </div>`;
    $(".input-area").append(form);
  });

  $(document).on("click", ".remove-image", function() {
    $(this)
      .parent()
      .remove();
  });

  $(document).on("click", ".form-control-file", function() {
    var inputId = $(this).attr("id");
    var itemId = $(this)
      .parent()
      .attr("id");

    $(document).on("change", `#${inputId}`, function() {
      function readURL(input) {
        var reader = new FileReader();
        reader.onload = function(e) {
          $(`#${itemId}`)
            .find("img")
            .attr({
              src: e.target.result
            });
          $(".prev").css({
            width: "100%",
            height: "250px"
          });
        };
        reader.readAsDataURL(input.files[0]);
      }
      readURL(this);
    });
  });
});
