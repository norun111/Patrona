class RoomsController < ApplicationController
  before_action :authenticate_user! 
  def show
    @room = Room.find(params[:id]) #ルーム情報の取得
    # @message = Message.new #新規メッセージ投稿
    if @room.messages
      @messages = @room.messages
    end #このルームのメッセージを全て取得

    unless current_user.creator
      if @room.user.id == current_user.id
        @creator = @room.creator
      else
        redirect_to root_path
      end
    else
      if @room.creator.id == current_user.creator.id
        @user = @room.user
      else
        redirect_to root_path
      end
    end
  end

  def create
    unless current_user.creator
      #userがログインしてたらuser_idを, shopがログインしてたらshop_idを@roomにいれる
      @room = Room.new(room_creator_params)
      @room.user_id = current_user.id
    else 
      @room = Room.new(room_user_params)
      @room.creator_id = current_user.creator.id
    end

    if @room.save
      redirect_to :action => "show", :id => @room.id
    else
      redirect_to root_path
    end
  end

  private
  def room_creator_params
    params.require(:room).permit(:creator_id)
  end

  def room_user_params
    params.require(:room).permit(:user_id)
  end
end
