class ChatsController < ApplicationController
  before_action :set_user

  def show
    @messages = Message.user_messages(current_user, @user)
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end
end
