# Overrides defaults used by Devise to allow administrators
# to create and edit accounts. Users can edit their own accounts.

class UsersController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource :user

  # get :index
  # List all user accounts
  def index
    @users = User.all
  end
  
  # get :show
  # Show an individual user
  def show
  end

  # get :new
  # Display a form to create a new user
  def new
    @user = User.new
  end

  # post :create
  # Process data to create a new user
  def create            
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to users_url
    else
      render :action => 'new'
    end
  end

  # get :edit
  # Display a form to edit a user
  def edit
  end

  # put :update
  # Process data to update a user
  def update    
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated information."
      redirect_to edit_user_path(@user)
    else
      render :action => 'edit'
    end
  end

  # delete :destroy
  # Delete a user account
  def destroy
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to users_url
  end
end
