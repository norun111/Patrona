$(function () {
  $(".video-url-container").css("display", "none");

  $('.video-url').on('click', function(){
    $('.video-url-container').toggle();
  });
});