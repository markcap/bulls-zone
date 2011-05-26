class Article < ActiveRecord::Base
  validates_presence_of :user_id, :subject, :body, :abstract
  
  attr_accessible :user_id, :subject, :body, :abstract, :publish
  
  belongs_to :user
  acts_as_commentable
end
