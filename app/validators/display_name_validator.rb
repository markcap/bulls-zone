class DisplayNameValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    if !value.blank? and !value.nil?
      if value.length < 3 || value.length > 16
        object.errors[attribute] << (options[:message] || "Name must be between 3 and 16 characters") 
      end
    end
  end
end

