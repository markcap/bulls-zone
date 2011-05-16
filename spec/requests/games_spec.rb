require 'spec_helper'

describe "games#index" do
  
  describe "Normal Access"
  
  it "should go to schedule when schedule link is clicked" do
    visit root_path
    click_link "Schedule"
    page.should have_content("Bulls Schedule")
  end
  
  before :each do
    @game = Factory(:game)
    visit games_path
  end
  
  it "should display scores" do
    page.should have_content("#{@game.bulls_score}")
    page.should have_content("#{@game.opponent_score}")
  end
  
  it "should display dates"
  
  it "should display teams"
  
  it "should not display edit link"
  
  it "should not display new game link"
  
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

  it "should have edit link for each game"
  
  it "should have add game link"
  
end