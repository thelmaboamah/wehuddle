class DirectMessagesController < ApplicationController
  before_action :authenticate_user!

  def show
    users = [current_user, User.find(params[:id])]
    @chatroom = Chatroom.direct_message_for_users(users)
    @chatrooms = Chatroom.all
    @users = User.all
    @message = Message.new
    @messages = @chatroom.messages.order(created_at: :desc).limit(100).reverse
    @chatroom_user = current_user.memberships.find_by(chatroom_id: @chatroom.id)
    render "chatrooms/show"
    end
end
