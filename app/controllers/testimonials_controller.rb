# frozen_string_literal: true

class TestimonialsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @testimonials = policy_scope(Testimonial)
  end
end
