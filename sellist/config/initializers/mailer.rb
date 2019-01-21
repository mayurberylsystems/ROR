ActionMailer::Base.smtp_settings = {
  address:        'smtp.gmail.com', # default: localhost
  port:           '587',                  # default: 25
  user_name:      'beryl.testing123@gmail.com',
  password:       'changeit',
  authentication: :login,                 # :plain, :login or :cram_md5
  enable_starttls_auto: true
}
