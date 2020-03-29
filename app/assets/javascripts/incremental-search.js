$(function(){
  function addCreator(creator) {
    var html = `
      <a href="/creators/${creator.id}"> 
        <p class="chat-group-user__name">${creator.creator_name}</p>
        <div class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${creator.id}" data-user-name="${creator.creator_name}"></div>
      </a>
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
      $("#user-search-result").empty();

      if (creators.length !== 0) {
        creators.forEach(function(creators) {
          addCreator(creators);
        });
      } else if (input.length == 0) {
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