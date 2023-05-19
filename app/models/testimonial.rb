# frozen_string_literal: true

class Testimonial < ApplicationRecord
  validates :name, presence: true
  validates :body, presence: true

  FEATURED = 4
end
