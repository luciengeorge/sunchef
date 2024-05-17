# frozen_string_literal: true
# typed: true

module ApplicationHelper
  include Pagy::Frontend
  extend T::Sig

  sig { params(category: String).returns(String) }
  def category_img(category)
    case category.to_sym
    when :lunch_dinner
      "category-img-0.svg"
    when :sweets
      "category-img-1.svg"
    when :smoothies
      "category-img-2.svg"
    when :drinks
      "category-img-3.svg"
    when :snacks
      "scategory-img-4.svg"
    when :dressings
      "category-img-5.svg"
    when :breakfast
      "category-img-6.svg"
    else
      "category-img-7.svg"
    end
  end
end
