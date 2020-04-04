class CreatorsController < ApplicationController
  before_action :authenticate_user!

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
    @creator = Creator.find(params[:id])
  end

  def demo
  end

  private
  def creator_params
    params.require(:creator).permit(:user_id, :creator_name, :creator_email)
  end

  def current_creator
    Creator.find_by(id: session[:creator_id])
  end

  def current_content
    Content.find_by(id: session[:content_id])
  end
end
