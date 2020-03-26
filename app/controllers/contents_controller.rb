class ContentsController < ApplicationController
  def post
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    @content["creator_id"] = current_creator.id
    
    if params[:image_send]
      if @content.save
        session[:id] = @content.id
        redirect_to images_path
      else
        render :new
      end
    else
      if @content.save
        session[:id] = @content.id
        redirect_to videos_path
      else
        render :new
      end
    end
  end

  private
  def content_params
    params.require(:content).permit(:creator_id)
  end

  def current_creator
    Creator.find_by(id: session[:creator_id])
  end
end
