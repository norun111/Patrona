class TopsController < ApplicationController
  def home
    @creator = current_creator
  end
  
  private
  def current_creator
    Creator.find_by(id: session[:creator_id])
  end
end
