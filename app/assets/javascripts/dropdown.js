$(function() {
  var contents = $(".dropdown-menu");
  $(".creator-avatar").click(function(){
    $(contents).toggle();
    return false;
  });
  $(".dropdown-nest")
  .mouseover(function(){
    $(contents).show();
  })
  .mouseout(function(){
    $(contents).hide();
  });

  $(".dropdown-menu")
  .mouseover(function(){
    $(contents).show();
  })
  .mouseout(function(){
    $(contents).hide();
  });
});