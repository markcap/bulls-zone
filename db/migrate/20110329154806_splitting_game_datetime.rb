class SplittingGameDatetime < ActiveRecord::Migration
  def self.up
    remove_column :games, :game_date
    add_column :games, :game_date, :date
    add_column :games, :game_time, :time
  end

  def self.down
    remove_column :games, :game_date
    remove_column :games, :game_time
  end
end
