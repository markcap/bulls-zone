class CreateAchievements < ActiveRecord::Migration
  def self.up
    create_table :achievements do |t|
      t.string :name
      t.integer :points
      t.integer :rank
      t.timestamps
    end
  end

  def self.down
    drop_table :achievements
  end
end
