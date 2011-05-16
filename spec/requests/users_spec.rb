require 'spec_helper'
include EmailSpec::Helpers
include EmailSpec::Matchers

describe "Users" do
  
  describe "GET /" do
    it "sends a confirmation email after entering email on homepage" do
      visit root_path
      fill_in "Email", :with => 'jojo@y748hiruwefjksnd.com'
      click_button "Create Account"
      page.should have_content("You have signed up successfully.")
    end
  end
  
end

describe "Logged in Users" do

  before :each do 
    @user = Factory(:user)
    visit "/users/sign_out"
    visit "/users/sign_in"
    fill_in "Email", :with => @user.email
    fill_in "user_password", :with => @user.password
    click_button "Sign in"
  end
  
  describe "GET /" do
    it "should sign you in" do
      page.should have_content("Signed in successfully.")
    end
  end
end
