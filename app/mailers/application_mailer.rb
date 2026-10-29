# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  SUNCHEF_EMAIL = "hello@sunchef.co"

  default from: SUNCHEF_EMAIL
  layout "mailer"
end
