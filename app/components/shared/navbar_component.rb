# frozen_string_literal: true
# typed: true

require "sorbet-runtime"
module Shared
  class NavbarComponent < ViewComponent::Base
    extend T::Sig
    attr_reader :user_signed_in, :current_user

    sig { params(user_signed_in: T::Boolean, current_user: T.nilable(User)).void }
    def initialize(user_signed_in:, current_user:)
      super
      @user_signed_in = user_signed_in
      @current_user = current_user
    end
  end
end
