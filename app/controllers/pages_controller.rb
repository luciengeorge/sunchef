# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home; end
  def about; end

  def cook
    @categories = Recipe.categories.keys
  end

  def shop
    @images = policy_scope(CarouselImage)
  end

  def coaching
    @testimonials = Testimonial.limit(Testimonial::FEATURED)
    @colors = Contact::COLORS
  end

  def maintenance
    admin = User.find_by(admin: true)
    return redirect_to(root_path) unless admin.locked_website_at.present?
  end
end
