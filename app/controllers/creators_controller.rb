class CreatorsController < ApplicationController
  before_action :authenticate_user!

  def new
    @creator = Creator.new
    @user = current_user
  end

  def create
    @creator = Creator.new(creator_params)
    @creator["user_id"] = current_user.id
    
    if @creator.save
      session[:creator_id] = @creator.id
      redirect_to creator_steps_path
    else
      render :new
    end
  end

  private
  def creator_params
    params.require(:creator).permit(:user_id)
  end
end
