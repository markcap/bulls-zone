class AddingScoresToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :bulls_score, :integer
    add_column :games, :opponent_score, :integer
  end

  def self.down
    remove_column :games, :bulls_score
    remove_column :games, :opponent_score
  end
end
