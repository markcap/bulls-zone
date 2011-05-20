class PusherController < ApplicationController
  
  def auth
    if current_user
      response = Pusher[params[:channel_name]].authenticate(params[:socket_id], {
        :user_id => current_user.id, # => required
        :user_info => { # => optional - for example
                  :name => current_user.display_name,
                  :email => current_user.email
                }
      })
      render :json => response
    else
      render :text => "Not authorized", :status => '403'
    end
  end
end
