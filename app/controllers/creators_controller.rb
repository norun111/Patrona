class CreatorsController < ApplicationController
  def category
    @creator = Creator.new
  end

  def restriction
    session[:podcasts] = creator_params[:podcasts]
    session[:videos] = creator_params[:videos]
    session[:music] = creator_params[:music]
    @creator = Creator.new
  end

  def create
    session[:no] = creator_params[:no]
    session[:prohibited] = creator_params[:prohibited]
    @creator = Creator.new(
      podcasts: session[:podcasts]
      videos: session[:videos]
      music: session[:music]
      no: session[:no]
      prohibited: session[:prohibited]
    )
    if @creator.save
      session[:id] = @creator.id
    else
      render '/creators/category'
    end
  end
end
