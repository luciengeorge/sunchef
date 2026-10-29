# frozen_string_literal: true

require "test_helper"

class ContactTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper

  test "deliver_email sends one admin email per recipient and one to the contact" do
    contact = contacts(:one)

    assert_enqueued_emails 3 do
      contact.send(:deliver_email)
    end
    SunchefMailer::RECIPIENTS.each do |email|
      assert_enqueued_email_with SunchefMailer, :new_contact, args: { contact:, to: email }
    end
    assert_enqueued_email_with ContactMailer, :new_contact, args: { contact: }
  end
end
