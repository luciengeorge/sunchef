# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  SUNCHEF_EMAIL = "hello@sunchef.co"

  default from: SUNCHEF_EMAIL
  layout "mailer"

  # Suppressed addresses fail on every retry, so log once instead of retrying
  rescue_from Postmark::InactiveRecipientError do |error|
    Rails.logger.error("[#{self.class.name}] #{error.message}")
  end
end
