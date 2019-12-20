$(document).on("turbolinks:load", function() {
  var notifications = 1;
  $(".open-notifications").click(function() {
    if (notifications == 1) {
      $(".notifications").css("display", "block");
      notifications = 2;
    } else {
      $(".notifications").css("display", "none");
      notifications = 1;
    }
  });
  $(".close-notifications").click(function() {
    $(".notifications").css("display", "none");
  });
});
