class CreatorStepsController < ApplicationController
  include Wicked::Wizard
  steps :category, :restriction

  def show
    @creator = current_creator
    render_wizard
  end

  def update
    @creator = current_creator
    @creator.attributes = creator_params
    render_wizard @creator
  end

  private
  def current_creator
    Creator.find_by(id: session[:creator_id])
  end

  def creator_params
    params.require(:creator).permit(:podcasts, :videos, :music, :no, :prohibited)
  end

  
end
