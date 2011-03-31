class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.datetime :game_date
      t.string :opponent
      t.string :home_away
      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
