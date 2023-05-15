# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home; end
  def about; end
  def cook; end
  def shop; end

  def coaching
    @testimonials = Testimonial.limit(4)
    @colors = ["#FAD685", "#F8CFC5", "#CBD6AB", "#D5EEE9"]
  end
end
