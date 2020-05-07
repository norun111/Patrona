$(function() { 
  $(".user-goal__bottom").not('.slick-initialized').slick({
    slidesToShow:1,
    slidesToScroll:1,
    accessibility:false,
    arrows:false
  });
  $('.fa-chevron-right').on('click',function(){
    $('.user-goal__bottom').slick('slickNext');
  });

  $('.fa-chevron-left').on('click',function(){
    $('.user-goal__bottom').slick('slickPrev');
  });
  
});