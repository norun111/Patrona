unless @comment.creator_name
  json.id @comment.id
  json.body  @comment.body
  json.user_id  @comment.user.id
  json.user_name  @comment.user.nickname
else
  json.id @comment.id
  json.body  @comment.body
  json.creator_id  @comment.creator.id
  json.creator_name  @comment.creator.creator_name
end