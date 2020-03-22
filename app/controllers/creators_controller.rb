class CreatorsController < ApplicationController
  def category
    @creator = Creator.new
  end

  def restriction
    session[:type] = creator_params[:type]
    # binding.pry
    @creator = Creator.new
  end

  def create
    session[:restriction] = creator_params[:restriction]
    @creator = Creator.new(
      type: session[:type],
      restriction: session[:restriction]
    )
    if @creator.save
      session[:id] = @creator.id
    else
      render '/creators/step1'
    end
  end
end
