class VideosController < ApplicationController
  before_action :set_video, only: [:show]

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
   
    
    respond_to do |format|
      if @video.save
        format.html { redirect_to video_url(@video.id), notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @video }
      else
        format.html { render action: 'new' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private 
  def set_video
    @video = Video.find(params[:id])
  end


  def video_params
    params.require(:video).permit(:video, :video_url, :title, :image, :description)
  end
end
