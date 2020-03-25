class ContentsController < ApplicationController
  def post
  end

  def create
    @image = Content.new(content_params)
    @image.save
  end

  private
  def content_params
    params.require(:content).permit(:image,:image_title,:image_description,:video,:video_url,:thumbnail,:video_title,:video_description,:creator_id)
  end
end
