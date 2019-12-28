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
            height: "15.6rem"
          });
        };
        reader.readAsDataURL(input.files[0]);
      }
      readURL(this);
    });
  });
  // お気に入りの場所を入力すると自動で存在するか検索
  $("#postAddress").blur(function() {
    var address_value = $("#postAddress").val();
    if (address_value.length !== 0) {
      $("#address-search-form").val(address_value);
      $("#address-search-button").trigger("click");
    }
  });
  // お気に入りポイントで５０文字を超えるとメッセージで知らせる
  var WordCountValidation = `<p class="ValidationMsg">５０文字を超えています</p>`;
  $(document).on("input", "#postDescription", function() {
    var DescriptionWordCount = $("#postDescription").val().length;
    if (DescriptionWordCount >= 51 && $(".ValidationMsg").length == 0) {
      $(this)
        .parent()
        .append(WordCountValidation);
      $(".ValidationMsg").css({
        color: "red"
      });
    } else if (DescriptionWordCount <= 50 && $(".ValidationMsg").length == 1) {
      $(".ValidationMsg").remove();
    }
  });
});
