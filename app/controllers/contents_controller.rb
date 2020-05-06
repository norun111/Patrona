class ContentsController < ApplicationController
  before_action :get_perks, only: [:new,:create]

  def post
    @creator = current_user.creator
  end

  def new
    @creator = current_user.creator
    @image = Content.new
  end

  def create
    @image = Content.new(image_params)
    @image["creator_id"] = current_user.creator.id
    binding.pry
    if @image.save
      redirect_to creator_path(current_user.creator.id)
    end
  end

  def video_new
    @creator = current_user.creator
    @video = Content.new
  end

  def video_create
    @video = Content.new(video_params)
    @video["creator_id"] = current_user.creator.id

    if @video.save
      redirect_to creator_path(current_user.creator.id)
    end
  end

  def audio_new
    @creator = current_user.creator
    @audio = Content.new
  end

  def audio_create
    @audio = Content.new(audio_params)
    @audio["creator_id"] = current_user.creator.id

    if @audio.save
      redirect_to creator_path(current_user.creator.id)
    end
  end

  def destroy
    content = Content.find(params[:id])
    if content.creator_id == current_user.creator.id
      
      if content.destroy
        redirect_to creator_path(current_user.creator.id)
      end
    end
  end

  def show
    @content = Content.find(params[:id])
    @comment = Comment.new
    @comments = @content.comments.includes(:user)

    @rooms = @content.creator.rooms
    unless current_user.id == @content.creator.user.id
      rooms = current_user.rooms
      #自分が入ってるroomの相手のidを格納する
      @creator_ids = []
      rooms.each do |r|
        @creator_ids << r.creator_id
      end
    else
      rooms = current_user.creator.rooms
      #自分が入ってるroomの相手のidを格納する
      @user_ids = []
      rooms.each do |r|
        @user_ids << r.user_id
      end
    end
  end

  def creator_post
    @creator = current_creator
    @content = @creator.contents.find_by(content_id: current_content.id)
  end

  private
  def get_perks
    @perks = current_user.creator.perks
  end

  def image_params
    params.require(:content).permit(:image, :image_title, :image_description, perk_ids: [])
  end

  def video_params
    params.require(:content).permit(:video,:video_url,:thumbnail,:video_title,:video_description)
  end

  def audio_params
    params.require(:content).permit(:audio,:audio_image,:audio_title,:audio_description)
  end

  def current_content
    Content.find_by(id: session[:content_id])
  end
end
