$(document).on('turbolinks:load', function() {
$(function() {
    var $win = $(window),
      $cloneNav = $('#nav').clone().addClass('clone-nav').appendTo('body'),
      showClass = 'is-show';
      var nav = $("#nav");
      nav.css('display','none');
    $win.on('load scroll', function() {
      var value = $(this).scrollTop();
      if ( value > 800 ) {
        nav.css('display','block');
        $cloneNav.addClass(showClass);
        
      } else {
        $cloneNav.removeClass(showClass);
        nav.css('display','none');
      }
    });
  });
});