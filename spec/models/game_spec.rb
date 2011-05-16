require File.dirname(__FILE__) + '/../spec_helper'

describe Game do
  it "should be valid" do
    Factory.build(:game).should be_valid
  end
  
  it "invalid factory should be invalid" do
    Factory.build(:invalid_game).should_not be_valid
  end
  
  it "should be invalid without an opponent" do
    Factory.build(:game, :opponent => nil).should_not be_valid
  end
  
  it "should be invalid without a location" do
    Factory.build(:game, :home_away => nil).should_not be_valid
  end
  
  it "should be invalid without a date" do
    Factory.build(:game, :game_date => nil).should_not be_valid
  end
  
  it "should be invalid on the same date as another game" do
     game_1 = Factory(:game, :game_date => Date.today)
     game_2 = Factory.build(:game, :game_date => Date.today)
     game_2.should_not be_valid
  end
  
  it "should require a score if game was in the past" do
    game = Factory.build(:game, :game_date => Date.today - 1, :bulls_score => nil)
    game.should_not be_valid
  end
  
  it "should be able to pass in nil scores if game date is in the future or today" do
    game1 = Factory.build(:game, :game_date => Date.today, :bulls_score => nil)
    game2 = Factory.build(:game, :game_date => Date.today + 1, :bulls_score => nil)
    game1.should be_valid
    game2.should be_valid
  end
  
end
