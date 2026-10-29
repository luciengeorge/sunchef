# frozen_string_literal: true

require "test_helper"
require "minitest/mock"

class SunchefMailerTest < ActionMailer::TestCase
  test "new_contact goes to the given address" do
    mail = SunchefMailer.with(contact: contacts(:one), to: "by.sunchef@gmail.com").new_contact

    assert_equal ["by.sunchef@gmail.com"], mail.to
  end

  test "new_contact defaults to hello" do
    mail = SunchefMailer.with(contact: contacts(:one)).new_contact

    assert_equal [ApplicationMailer::SUNCHEF_EMAIL], mail.to
  end

  test "new_contact does not raise when postmark marks the recipient inactive" do
    mail = SunchefMailer.with(contact: contacts(:one)).new_contact
    error = Postmark::InactiveRecipientError.new(
      406,
      "",
      { "Message" => "Found inactive addresses: hello@sunchef.co." },
    )

    mail.message.stub(:deliver, -> { raise error }) do
      assert_nothing_raised { mail.deliver_now }
    end
  end
end
