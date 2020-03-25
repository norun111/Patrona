class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create

  end

  private
  def image_params
    params.permit(:image).permit(:image,:title)
  end
end
