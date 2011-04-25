class User < ActiveRecord::Base
  has_many :authentications, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :display_name
  
  #custom validation for sign in forms that only have an email address
  def validate
    if !display_name.blank? and !display_name.nil?
      if display_name.length < 3 || display_name.length > 16
        errors.add_to_base "Display name must be between 3 and 16 characters." 
      end
      
      if display_name != self.display_name && User.all.map {|u| u.display_name}.include?(display_name)
        errors.add_to_base "Name already taken." 
      end
    end
  end

  def apply_omniauth(omniauth)
    set_email(omniauth['user_info']['email'])
    set_display_name(omniauth['user_info']['nickname'])
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid']) 
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
  
  def set_display_name(disp_name)
    if User.all.map {|u| u.display_name}.include?(disp_name)
      self.display_name = disp_name + rand(10000).to_s
    else 
      self.display_name = disp_name
    end
  end
  
  def set_email(email)
    if email.nil?
      self.email = " "
    else
      self.email = email if email.blank?
    end
  end
  
end
