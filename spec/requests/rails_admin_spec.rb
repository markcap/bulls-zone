require 'spec_helper'

describe "Normal access" do

  before :each do 
    @user = Factory(:user)
    visit "/users/sign_out"
    visit "/users/sign_in"
    fill_in "Email", :with => @user.email
    fill_in "user_password", :with => @user.password
    click_button "Sign in"
  end
  
  it "should deny access to rails admin" do
    visit "/admin"
    page.should have_content("You do not have proper permission to access this page.")
  end
  
end

describe "Admin Access" do
  
  before :each do 
    @user = Factory(:user, :admin => 1)
    visit "/users/sign_out"
    visit "/users/sign_in"
    fill_in "Email", :with => @user.email
    fill_in "user_password", :with => @user.password
    click_button "Sign in"
  end
  

  it "should allow access to rails_admin" do
    visit "/admin"
    page.should have_content("Dashboard")
  end
end