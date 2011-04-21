class AddingAdminsAndModsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :admin, :integer
    add_column :users, :moderator, :integer
  end

  def self.down
    remove_column :users, :admin
    remove_column :users, :moderator
  end
end
