class CreatorsController < ApplicationController
  before_action :authenticate_user!
  before_action :creator_set, only: [:show, :edit, :update, :demo, :creator_perks]

  def index
    @creators = Creator.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def search
    @creators = Creator.where('creator_name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json{ render '/creators/search', handlers: 'jbuilder' }
    end
  end

  def new
    @creator = Creator.new
    @user = current_user
  end

  def create
    @creator = Creator.new(creator_params)
    @creator["user_id"] = current_user.id
    @creator["creator_name"] = current_user.nickname
    @creator["creator_email"] = current_user.email
    
    if @creator.save
      session[:creator_id] = @creator.id
      session[:creator_name] = @creator.creator_name
      session[:creator_email] = @creator.creator_email
      redirect_to creator_steps_path
    else
      render :new
    end
  end

  def show
    
  end

  def creator_perks
  end

  def demo
  end

  def edit
  end

  def update
    respond_to do |format|
      if @creator.update(edit_creator_params)
        format.html { redirect_to @creator, notice: 'creator was successfully updated.' }
        format.json { render :show, status: :ok, location: @creator }
      else
        format.html { render :edit }
        format.json { render json: @creator.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def creator_params
    params.require(:creator).permit(:user_id, :creator_name, :creator_email)
  end

  def edit_creator_params
    params.require(:creator).permit(:creator_name, :creator_email, :image, :cover_image, :video, :description, :thumbnail, :dm_permission)
  end

  def creator_set
    @creator = Creator.find(params[:id])
  end

  def current_creator
    Creator.find_by(id: session[:creator_id])
  end

  def current_content
    Content.find_by(id: session[:content_id])
  end
end
