# frozen_string_literal: true
# typed: true

module Shared
  class NavbarComponent < ViewComponent::Base
    extend T::Sig
    attr_reader :user_signed_in

    sig { params(user_signed_in: T::Boolean).void }
    def initialize(user_signed_in:)
      super
      @user_signed_in = user_signed_in
    end
  end
end
