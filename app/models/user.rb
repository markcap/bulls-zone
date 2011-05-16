class User < ActiveRecord::Base
  has_many :authentications, :dependent => :destroy
  has_many :chat_messages, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :display_name
  
  #custom validation for sign in forms that only have an email address
  validates :display_name, :uniqueness => true, :display_name => true, :allow_nil => true
  # validates :email, :uniqueness => true, :email => true
  
  after_create :set_temp_display_name
  
  def apply_omniauth(omniauth)
    set_email(omniauth['user_info']['email'])
    set_display_name(omniauth['user_info']['nickname'])
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid']) 
  end

  def password_required?
    authentications.empty? && email.nil?
  end
  
  def set_display_name(disp_name)
    #for omniauth accounts
    if User.all.map {|u| u.display_name}.include?(disp_name)
      self.display_name = disp_name + rand(100000).to_s
    else 
      self.display_name = disp_name
    end
  end
  
  def set_temp_display_name
    #for regular accounts
    if !display_name
      display_name = "BZ FAN " + rand(100000).to_s
    end
  end
  
  def set_email(email)
    # if email.nil?
    #   self.email = " "
    # else
    #   self.email = email if email.blank?
    # end
  end
  

  
end
