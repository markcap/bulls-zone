class AddingAdminsAndModsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :admin, :tinyint
    add_column :users, :moderator, :tinyint
  end

  def self.down
    remove_column :users, :admin
    remove_column :users, :moderator
  end
end
