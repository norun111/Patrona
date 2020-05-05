$(document).on('turbolinks:load', function(){
  $(document).ready(function(){
    
    $(".menuItem").hover(function(){
      var pos=$(this).attr("alt");
      
  $( "#slider" ).stop().animate({
      marginLeft: 150*(pos-1),
    }, 300)
        
        
    });
  });
});