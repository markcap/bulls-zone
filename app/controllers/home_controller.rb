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
  
      Pusher['bulls_zone'].trigger('send_notification', {
        :message =>  (current_user.nil? ? "Guest" : current_user.display_name.to_s) + " has entered the room.",
        :created_at => Time.now.strftime("%l:%M")
      })
    
      Pusher['bulls_zone'].trigger('add_user', {
        :username => (current_user.nil? ? "Guest" : current_user.display_name.to_s), 
        :user_type => user_type
      })
    end
  end
    
end
