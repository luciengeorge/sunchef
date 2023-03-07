# frozen_string_literal: true

module Shared
  class FlashComponent < ViewComponent::Base
    attr_reader :notice, :alert

    def initialize(notice:, alert:)
      super
      @notice = notice
      @alert = alert
    end
  end
end
