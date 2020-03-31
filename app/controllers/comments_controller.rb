class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
    @comment = Comment.create(comment_params)
    

    if @comment.creator==nil
      respond_to do |format|
        format.html{redirect_to content_path(params[:content_id])}
        format.json{ render '/comment/create', handlers: 'jbuilder' }
      end
    else
      @comment.creator_name
      respond_to do |format|
        format.html{redirect_to content_path(params[:content_id])}
        format.json{ render '/comment/creator', handlers: 'jbuilder' }
      end
    end
  end

  def edit
  end

  def update
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
    params.require(:comment).permit(:body, :creator_name).merge(user_id: current_user.id, creator_id: current_creator.id, content_id: params[:content_id])
  end

  def current_creator
    Creator.find_by(id: session[:creator_id])
  end
end
