class ApplicationController < ActionController::Base
  helper_method :user_session 
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to denied_url
  end
  
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

  def handle_unverified_request
    #for the pusher presence channel. Javascript Ajax calls with csrf headers won't work in this case. 
    content_mime_type = request.respond_to?(:content_mime_type) ? request.content_mime_type : request.content_type
    if content_mime_type && content_mime_type.verify_request?
      if request.path != "/pusher/auth"
        raise ActionController::InvalidAuthenticityToken
      end
    else
      super
      cookies.delete 'remember_user_token'
      sign_out :user
    end
  end
end
