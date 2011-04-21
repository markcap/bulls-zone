class AddingDisplayNameAndRemovingEmailIndexFromUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :display_name, :string
    
    remove_index :users, :email
    add_index :users, :email, :unique => false
  end

  def self.down
    remove_column :users, :display_name
    remove_index :users, :email
  end
end
