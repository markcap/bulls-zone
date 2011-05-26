class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.integer :user_id
      t.text :subject
      t.text :body
      t.text :abstract
      t.integer :publish
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
