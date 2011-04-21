module ApplicationHelper
  
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def devise_error_messages!
    resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
  end
  
end
