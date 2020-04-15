class PerksController < ApplicationController
  before_action :set_perk, only: [:show, :edit, :update, :destroy]
  before_action :set_creator, only: [:show, :destroy, :top]
  before_action :authenticate_user!, except: [:index, :show, :stripe_connect]
  def index
    @perks = Perk.all
  end

  def stripe_connect
  end

  def list
    @creator = Creator.find(params[:creator_id])
  end

  def top
    @perk = current_user.creator.perks
  end

  def show
  end

  def new
    @creator = Creator.find(params[:creator_id])
    @perk = Perk.new
  end

  def create
    @perk = Perk.new(perk_params)
    @perk.creator_id = current_user.creator.id
    @perk.user_id = current_user.id

    respond_to do |format|
      if @perk.save
        if current_user.creator.perks.any? && current_user.can_receive_payment?
          CreatePerkPlansJob.perform_now(@perk)
        end
        # ExpireProjectJob.set(wait_until: @project.expires_at).perform_now(@project)
        format.html { redirect_to list_creator_perks_path(current_user.creator.id), notice: 'Perk was successfully created.' }
        format.json { render :show, status: :created, location: @perk }
      else
        format.html { render :new }
        format.json { render json: @perk.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @perk.update(perk_params)
        format.html { redirect_to list_creator_perks_path(current_user.creator.id), notice: 'Perk was successfully updated.' }
        format.json { render :show, status: :ok, location: @perk }
      else
        format.html { render :edit }
        format.json { render json: @perk.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @perk.destroy
    respond_to do |format|
      format.html { redirect_to list_creator_perks_path(current_user.creator.id), notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_perk
    @perk =Perk.find(params[:id])
  end

  def set_creator
    @creator = current_user.creator
  end

   # Only allow a list of trusted parameters through.
  def perk_params
    params.require(:perk).permit(:amount, :title, :description, :image, :creator_id)
  end
end
