$(document).on('turbolinks:load', function(){

  var searchResult = $('#creator-search-result');

  function builtHTML(creator) {
    var html = `
      <li>
        <div class="incremental-creator-name">
          <a href="/creators/${creator.id}"> 
            <p class="incremental-creator-name__text">${creator.creator_name}</p>
          </a>
        </div>
      </li>
    `;
    searchResult.append(html);
  }

  function NoResult(message){
    let html = `
    <li>${message}</li>
    `
    searchResult.append(html);
  }

  $("#incremental-creator-name").on('keyup', function(){
    var input = $("#incremental-creator-name").val();
    
    $.ajax({
      type: "GET",
      url: "/creators/search",
      data: { keyword: input },
      dataType: "json"
    })
    .done(function(creators) {
      console.log(creators);
      $("#creator-search-result").empty();

      if (creators.length !== 0){
        creators.forEach(function(creator) {
          builtHTML(creator);
        });
      } else{
        NoResult('no creator')
      }
    })
    .fail(function() {
      // alert("通信エラーです。ユーザーが表示できません。");
    })
  });
});
