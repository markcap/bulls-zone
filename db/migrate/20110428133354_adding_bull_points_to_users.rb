class AddingBullPointsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :bull_points, :integer
  end

  def self.down
    remove_column :users, :bull_points
  end
end
