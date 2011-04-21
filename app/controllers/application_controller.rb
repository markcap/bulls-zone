class ApplicationController < ActionController::Base
  helper_method :user_session 
  protect_from_forgery
  
  #For first time logins after confirmation emails.
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      if resource_or_scope.sign_in_count <= 1
        edit_user_path(resource_or_scope, :new_user => true)
      else
        super
      end
    else
      super
    end
  end
  
end
