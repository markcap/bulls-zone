class Game < ActiveRecord::Base
  attr_accessible :game_date, :game_time, :opponent, :home_away
  
  validates_presence_of :opponent, :home_away, :game_date, :game_time
  validates_uniqueness_of :game_date
  validates :bulls_score, :past_game => true
end
