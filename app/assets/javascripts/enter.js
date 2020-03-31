$(function() {
  var $form = $(".creator-post-comment__form");
  var $ta = $(".creator-post-comment__form--body");

  $(document).on("keypress", ".creator-post-comment__form--body", function(e) {
    if (e.keyCode == 13) { 
      if (e.shiftKey) { 
        $.noop();
      } else if ($ta.val().replace(/\s/g, "").length > 0) {
        e.preventDefault();
        $form.submit();
      }
    } else {
      $.noop();
    }
  });
});