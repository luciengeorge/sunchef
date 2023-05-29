# frozen_string_literal: true

module Contacts
  class FormComponent < ViewComponent::Base
    attr_reader :contact

    def initialize(contact:)
      super()
      @contact = contact
    end
  end
end
