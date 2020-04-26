$(document).on('turbolinks:load', function(){
  $(function() {
    $('.chat_box').animate({scrollTop : $('.chat_box')[0].scrollHeight });
  });
});