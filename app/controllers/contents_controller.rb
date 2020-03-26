class ContentsController < ApplicationController
  def post
  end

  def new
    @image = Content.new
  end

  def create
    @image = Content.new(image_params)
    @image["creator_id"] = current_creator.id
    
    if @image.save
      redirect_to creator_path(current_creator.id)
    end
  end

  def video_new
    @video = Content.new
  end

  def video_create
    @video = Content.new(video_params)
    @video["creator_id"] = current_creator.id

    if @video.save
      redirect_to creator_path(current_creator.id)
    end
  end

  def audio_new
    @audio = Content.new
  end

  def audio_create
    @audio = Content.new(audio_params)
    @audio["creator_id"] = current_creator.id

    if @audio.save
      redirect_to creator_path(current_creator.id)
    end
  end

  private
  def image_params
    params.require(:content).permit(:image,:image_title,:image_description)
  end

  def video_params
    params.require(:content).permit(:video,:video_url,:thumbnail,:video_title,:video_description)
  end

  def audio_params
    params.require(:content).permit(:audio,:audio_image,:audio_title,:audio_description)
  end
  
  def current_creator
    Creator.find_by(id: session[:creator_id])
  end
end
