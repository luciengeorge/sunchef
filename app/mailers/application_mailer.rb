class ApplicationMailer < ActionMailer::Base
  SUNCHEF_EMAIL = "by.sunchef@gmail.com"

  default from: SUNCHEF_EMAIL
  layout "mailer"
end
