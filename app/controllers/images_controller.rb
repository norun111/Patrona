class ImagesController < ApplicationController
  include Wicked::Wizard
  steps :image_step
  
  def show
    @content = current_content
    render_wizard
  end

  def update
    @content = current_content
    @content.attributes = content_params
    # @creator = current_creator
    render_wizard @content
  end

  private
  def content_params
    params.require(:content).permit(
      :image,
      :image_title,
      :image_description
    )
  end

  # def redirect_to_finish_wizard(options = nil, params = {})
  #   redirect_to creator_path(@creator.id)
  # end

  def current_content
    Content.find_by(id: session[:creator_id])
  end


end
