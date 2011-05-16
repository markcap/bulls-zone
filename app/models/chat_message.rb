class ChatMessage < ActiveRecord::Base
  attr_accessible :user_id, :message
  
  belongs_to :user
end
