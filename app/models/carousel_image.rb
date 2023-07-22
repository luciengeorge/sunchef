# frozen_string_literal: true

class CarouselImage < ApplicationRecord
  scope :published, -> { where(published: true) }
  has_one_attached :image

  validates :image, presence: true
end
