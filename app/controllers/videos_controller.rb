class VideosController < ApplicationController
  # before_action :set_video, only: [:show]

  # include Wicked::Wizard
  # steps :video_step
  
  # def show
  #   @content = current_content
  #   render_wizard
  # end

  # def update
  #   @content = current_content
  #   @content.attributes = content_params
  #   @creator = current_creator
  #   render_wizard @content
  # end

  # private
  # def content_params
  #   params.require(:content).permit(
  #     :video,
  #     :video_url,
  #     :video_thumbnail,
  #     :video_title,
  #     :video_description
  #   )
  # end

  # # def redirect_to_finish_wizard(options = nil, params = {})
  # #   redirect_to creator_path(@creator.id)
  # # end

  # def current_content
  #   Content.find_by(id: session[:creator_id])
  # end

  # def current_creator
  #   Creator.find_by(id: session[:creator_id])
  # end


#   def new
#     @video = Video.new
#   end

#   def create
#     @video = Video.new(video_params)
   
    
#     respond_to do |format|
#       if @video.save
#         format.html { redirect_to video_url(@video.id), notice: 'Article was successfully created.' }
#         format.json { render action: 'show', status: :created, location: @video }
#       else
#         format.html { render action: 'new' }
#         format.json { render json: @video.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   def show
#   end

#   private 
#   def set_video
#     @video = Video.find(params[:id])
#   end


#   def video_params
#     params.require(:video).permit(:video, :video_url, :title, :image, :description)
#   end
# end
end
