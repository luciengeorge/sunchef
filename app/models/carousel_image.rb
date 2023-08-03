# frozen_string_literal: true

class CarouselImage < ApplicationRecord
  scope :published, -> { where(published: true) }
  has_one_attached :image do |attachable|
    attachable.variant(:carousel, resize: "600x600")
  end

  validates :image, presence: true
end
