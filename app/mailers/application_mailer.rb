class ApplicationMailer < ActionMailer::Base
  default from: 'support@tm91myapp.heroku.com'
  layout 'mailer'
end
