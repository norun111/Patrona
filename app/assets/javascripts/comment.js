$(function(){

    function buildHTML(comment){
      var html = `<li class="user-comment-index">
                    <div class="user-comment-index__img">
                      <img src="/assets/patreon1.png">
                    </div>
                    <div class="user-comment-index__body"> 
                      <div class="user-comment-index__body--name">
                        <a href=/users/${comment.user_id}>${comment.user_name}</a>
                      </div>
                      <div class="user-comment-index__body--text">
                        <p>${comment.body}</p>
                      </div>

                      <div class="user-comment-option-nest">
                        <div class="user-comment-option">
                          <div class="user-comment-option__reply">
                            <i class="fas fa-reply"></i>
                          </div>
                          <div class="user-comment-option__like">
                            <i class="far fa-heart"></i>
                          </div>
                        </div>
                        <a data-method="delete" href="/comments/${comment.id}">delete</a>
                      </div>
                    </div>
                  </li>`
      return html;
    }

    function creatorHTML(comment){
      var html = `<li class="user-comment-index">
                    <div class="user-comment-index__img">
                      <img src="/assets/patreon1.png">
                    </div>
                    <div class="user-comment-index__body"> 
                      <div class="user-comment-index__body--name">
                        <a href=/creators/${comment.creator_id}>${comment.creator_name}</a>
                        <h1>creator</h1>
                      </div>
                      <div class="user-comment-index__body--text">
                        <p>${comment.body}</p>
                      </div>

                      <div class="user-comment-option-nest">
                        <div class="user-comment-option">
                          <div class="user-comment-option__reply">
                            <i class="fas fa-reply"></i>
                          </div>
                          <div class="user-comment-option__like">
                            <i class="far fa-heart"></i>
                          </div>
                        </div>
                        <a data-method="delete" href="/comments/${comment.id}" data-remote="true" class="user-comment-delete">delete</a>
                      </div>
                    </div>
                  </li>`
      return html;
    }

    $('.creator-post-comment__form').on('submit', function(e){
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action');
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data, comment){
        if(comment.user_id===undefined){
          var html = creatorHTML(data);
          $('.content-comment-show').append(html);
          $('.creator-post-comment__form--body').val('');
          $('submit').prop('disabled', false);
        }else if(comment.creator_id===undefined){
          var html = buildHTML(data);
          $('.content-comment').append(html);
          $('.creator-post-comment__form--body').val('');
          $('submit').prop('disabled', false);
        }
      })
      .fail(function(){
        alert('error');
      })
      .always(function(data){
        $('submit').prop('disabled', false); //ここで解除している
      })
    });
});