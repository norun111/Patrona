$(function(){
  $(document).ready(function(){
    
    $(".menuItem").hover(function(){
      var pos=$(this).attr("alt");
      
  $( "#slider" ).stop().animate({
      marginLeft: 160*(pos-1),
    }, 300)
        
        
    });
  });
});