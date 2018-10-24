# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                  587,
  domain:               'gmail.com',
  user_name:            ENV['MAIL_USER_NAME'],
  password:             ENV['MAIL_PASSWORD'],
  authentication:       'plain',
  enable_starttls_auto:  true,
  :tls => true
}