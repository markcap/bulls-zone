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
    @chat_message = ChatMessage.create!(params[:chat_message])
    # if @chat_message.save
    #   redirect_to @chat_message, :notice => "Successfully created chat message."
    # else
    #   render :action => 'new'
    # end
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
