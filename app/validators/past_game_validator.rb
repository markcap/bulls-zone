class PastGameValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless !object.game_date.nil? && object.game_date >= Date.today
      object.errors[attribute] << (options[:message] || "Please enter scores") 
    end
  end
end

