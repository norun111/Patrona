class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    
    @image.save
  end

  private
  def image_params
    params.require(:image).permit(:image,:title,:description)
  end
end
