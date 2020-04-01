class TiersController < ApplicationController
  def top
  end

  def index
  end

  def new
    @tier = Tier.new
  end

  def create
    @tier = Tier.new(tier_params)
    @tier.creator_id = current_user.creator.id

    @tier.save
  end

  def show
    @creator = Creator.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def tier_params
    params.require(:tier).permit(:price, :title, :description, :image, :creator_id)
  end
end
