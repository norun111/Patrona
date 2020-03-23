class ContentsController < ApplicationController

  def update
    respond_to do |format|
      if @content.update(content_params) && @content.video.recreate_versions!
        format.html { redirect_to @content, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end
end
