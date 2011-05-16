admin_user = User.create(
  :email => 'pimea.mark@gmail.com', 
  :password => 'temp123', 
  :password_confirmation => 'temp123',
  :display_name => "The Ultimation"
)

normal_user = User.create(
  :email => 'mark.desuu@gmail.com', 
  :password => 'temp123', 
  :password_confirmation => 'temp123',
  :display_name => "WHITE GHOST"
)

admin_user.confirm!
admin_user.admin = 1
admin_user.moderator = 1
admin_user.save

normal_user.confirm!
normal_user.admin = 0
normal_user.moderator = 0
normal_user.save