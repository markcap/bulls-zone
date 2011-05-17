class ChatMessagesController < ApplicationController
  def index
    @chat_messages = ChatMessage.all
  end

  def show
    @chat_message = ChatMessage.find(params[:id])
  end

  def new
    @chat_message = ChatMessage.new
  end

  def create
    # @chat_message = ChatMessage.create!(params[:chat_message])
    # @chat_message = params[:chat_message][:message].to_s
    # @chat_username = current_user.display_name
    # @chat_created_at = Time.now.strftime("%l:%M")
    
    #my Pusher Config
    if !params[:chat_message][:message].blank?
      Pusher['bulls_zone'].trigger('send_chat', {
        :message => params[:chat_message][:message].to_s, 
        :created_at => Time.now.strftime("%l:%M"),
        :username => current_user.display_name.to_s
      })
    end
  end

  def edit
    @chat_message = ChatMessage.find(params[:id])
  end

  def update
    @chat_message = ChatMessage.find(params[:id])
    if @chat_message.update_attributes(params[:chat_message])
      redirect_to @chat_message, :notice  => "Successfully updated chat message."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @chat_message = ChatMessage.find(params[:id])
    @chat_message.destroy
    redirect_to chat_messages_url, :notice => "Successfully destroyed chat message."
  end
end
