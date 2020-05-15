//初期表示は非表示
// document.getElementById("sidebar").style.display ="none";

// function clickBtn1(){
// 	var sidebar = document.getElementById("sidebar");

// 	if(sidebar.style.display=="block"){
// 		// noneで非表示
// 		sidebar.style.display ="none";
// 	}else{
// 		// blockで表示
// 		sidebar.style.display ="block";
// 	}
// }

// 初めはtoogledクラスをはずす

  $(".page-wrapper").removeClass("toggled");
  $(".sidebar-wrapper").css('display','block');

  $(".side_button").click(function() {
    $(".sidebar-submenu").slideUp(200);
    if (
      $(this)
        .parent()
        .hasClass("active")
    ) {
      // $(".sidebar-dropdown").removeClass("active");
      $(this)
        .parent()
        .removeClass("active");
    } else {
      // $(".sidebar-dropdown").removeClass("active");
      $(this)
        .next(".sidebar-submenu")
        .slideDown(200);
      $(this)
        .parent()
        .addClass("active");
    }
  });

  $("#close-sidebar").click(function() {
    $(".page-wrapper").removeClass("toggled");
    
  });
  $("#show-sidebar").click(function() {
    $(".page-wrapper").addClass("toggled");
    
  });

// ナビの範囲外をクリックするとメニューが閉じる
$(function () {
  // ナビの範囲外のどこかをクリックしたときに発動
  $('.wrapper-perk').on('click', function () {
      // if ($('#target').is(':visible')) {
      //     // ナビが表示されていたらcloseを実行
      //     $('#close').trigger('click');
      // } else {
      //     // ナビが非表示の場合は起動しない
      //     event.stopPropagation();
      // }
      $(".page-wrapper").removeClass("toggled");
  });
});

