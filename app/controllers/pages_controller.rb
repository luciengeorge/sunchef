# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home; end
  def about; end

  def cook
    @categories = Recipe.categories.keys
  end

  def shop
    @images = policy_scope(CarouselImage).joins(:image_attachment)
  end

  def coaching
    @testimonials = Testimonial.limit(Testimonial::FEATURED)
    @colors = Contact::COLORS
    @testimonial_colors = [
      {
        background: "#A1BFCD",
        text: "#024261",
      },
      {
        background: "#D8C3DD",
        text: "#8D29A5",
      },
      {
        background: "#CBD6AB",
        text: "#5F751F",
      },
    ]
  end

  def maintenance
    admin = User.find_by(admin: true)
    return redirect_to(root_path) unless admin.locked_website_at.present?
  end
end
