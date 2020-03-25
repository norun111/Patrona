class ImagesController < ApplicationController
  def new
    @image = Content.new
  end


  # private
  # def image_params
  #   params.require(:image).permit(:image,:title,:description)
  # end
end
