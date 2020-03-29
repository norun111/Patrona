$(function(){
  function addCreator(creator) {
    var html = `
      <div class="incremental-creator-name">
        <a href="/creators/${creator.id}"> 
          <p class="incremental-creator-name__text">${creator.creator_name}</p>
        </a>
      </div>
    `;
    $("#creator-search-result").append(html);
  }

  $("#incremental-creator-name").on('keyup', function(){
    var input = $("#incremental-creator-name").val();
    $.ajax({
      type: "GET",
      url: "/creators",
      data: { keyword: input },
      dataType: "json"
    })
    .done(function(creators) {
      $("#creator-search-result").empty();

      if (creators.length !== 0) {
        creators.forEach(function(creators) {
          addCreator(creators);
        });
      } else if (input.length === 0) {
        return false;
      }
      // } else {
      //   addNoUser();
      // }
    })
    .fail(function() {
      alert("通信エラーです。ユーザーが表示できません。");
    });
  });
});