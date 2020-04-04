class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
    @content = Content.find(params[:content_id])
    @comment = @content.comments.build(comment_params)
    @comment.creator_name = current_user.creator.creator_name
    
    @comment.save

    gon.creator_comment = @comment.creator_name

    respond_to do |format|
      format.html{redirect_to content_path(params[:content_id])}
      format.json{ render '/comments/create', handlers: 'jbuilder' }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
     
    end
  end

  private
  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :creator_name).merge(user_id: current_user.id, creator_id: current_user.creator.id, content_id: params[:content_id] )
  end

  def current_creator
    Creator.find_by(id: session[:creator_id])
  end
end
