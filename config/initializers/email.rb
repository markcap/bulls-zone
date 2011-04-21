ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
  :address  => "smtp.ku.edu",
  :port  => 25,
  :domain  => "www.ku.edu",
  :tls                  => true,
  :authentication       => :plain,
  :enable_starttls_auto => true  }