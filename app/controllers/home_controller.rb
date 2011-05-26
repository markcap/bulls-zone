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
    if current_user
      if current_user.moderator? || current_user.admin?
        user_type = "moderator"
      else
        user_type = "normal"
      end

    end
  end
    
end
