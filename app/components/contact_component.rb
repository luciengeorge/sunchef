# frozen_string_literal: true

class ContactComponent < ViewComponent::Base
  attr_reader :contact, :colors

  def initialize(contact:)
    @contact = contact
    @colors = Contact::COLORS
  end

  def color
    @color ||= colors.sample
  end
end
