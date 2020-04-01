class TopsController < ApplicationController
  def home
    
  end
  
  private
  def current_creator
    Creator.find_by(id: params[:creator_id])
  end
end
