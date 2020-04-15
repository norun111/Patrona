$(function() {
  var $win = $(window),
    $cloneNav = $('#nav').clone().addClass('clone-nav').appendTo('body'),
    showClass = 'is-show';
    var nav = $("#nav");
  $win.on('load scroll', function() {
    var value = $(this).scrollTop();
    if ( value > 800 ) {
      $cloneNav.addClass(showClass);
      nav.css('display','block');
    } else {
      $cloneNav.removeClass(showClass);
      nav.css('display','none');
    }
  });
});