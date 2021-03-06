class AuthenticationsController < ApplicationController
  def index
    @authentications = Authentication.all
  end

  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, authentication.user)
      # render :text => omniauth.to_yaml
    elsif current_user
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Authentication successful."
      redirect_to authentications_url
    else
      temp_pw = ActiveSupport::SecureRandom.hex(10)
      user = User.new(:password => temp_pw, :password_confirmation => temp_pw)
      user.apply_omniauth(omniauth)
      user.confirm!
      #bypassing validations for outside authentication
      if user.save(:validate => false)
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end

  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
end
