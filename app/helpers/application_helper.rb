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
  
  # def broadcast(channel, &block)
  #     message = {:channel => channel, :data => capture(&block), :ext => {:auth_token => FAYE_TOKEN}}
  #     uri = URI.parse("http://localhost:9292/faye")
  #     Net::HTTP.post_form(uri, :message => message.to_json)
  # end
  
end
