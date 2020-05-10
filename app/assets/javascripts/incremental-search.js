$(document).on('turbolinks:load', function() {
$(function(){

  var searchResult = $('#creator-search-result');

  function builtHTML(creator) {
    var html = `
      <li class="incremental-search-list">
        <div class="incremental-creator-name">
          <img src="/assets/patreon1.png">
          <a href="/creators/${creator.id}/demo"> 
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
      $("#creator-search-result").empty();

      if (creators.length !== 0){
        creators.forEach(function(creator) {
          builtHTML(creator);
        });
      } else{
        NoResult('no creator');
      }
    })
    .fail(function() {
      alert("error");
    })
  });
});
});
