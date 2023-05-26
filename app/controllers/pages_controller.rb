# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home; end
  def about; end

  def cook
    @categories = Recipe.categories.keys
  end

  def shop; end

  def coaching
    @testimonials = Testimonial.limit(Testimonial::FEATURED)
    @colors = Contact::COLORS
  end
end
