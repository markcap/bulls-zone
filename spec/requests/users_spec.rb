require 'spec_helper'
include EmailSpec::Helpers
include EmailSpec::Matchers

describe "Users" do
  
  describe "GET /users" do
    it "sends a confirmation email after entering email on homepage" do
      visit root_path
      fill_in "Email", :with => 'jojo@y748hiruwefjksnd.com'
      click_button "Sign up"
      page.should have_content("You have signed up successfully.")
    end
  end
  
end
