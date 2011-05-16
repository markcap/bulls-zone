class HomeController < ApplicationController
  
  def index
  end
  
  def error 
    flash[:error] = 'There was an error with your request.'
    redirect_to root_path
  end
  
  def denied
    flash[:error] = 'You do not have proper permission to access this page.'
    redirect_to root_path
  end
  
  def chat
    @chat_messages = ChatMessage.all
  end
end
