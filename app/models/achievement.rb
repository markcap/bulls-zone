class Achievement < ActiveRecord::Base
  attr_accessible :name, :points, :rank
end
