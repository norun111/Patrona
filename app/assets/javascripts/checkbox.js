$(document).on('turbolinks:load', function() {
$(function() {
  $('#category-submit-btn').attr('disabled', 'disabled');

  $('#creator_podcasts, #creator_videos, #creator_music').click(function() {
    if ( $(this).prop('checked') == false ) {
      $('#category-submit-btn').attr('disabled', 'disabled');
    } else {
      $('#category-submit-btn').removeAttr('disabled');
    }
  });
});
});
