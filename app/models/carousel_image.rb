# frozen_string_literal: true

class CarouselImage < ApplicationRecord
  scope :published, -> { where(published: true) }
  has_one_attached :image do |attachable|
    attachable.variant(:carousel, resize: "600x600")
  end

  validates :image, presence: true

  after_save_commit :process_image, if: -> { image.attached? }

  def image_variant_url
    image.representation(resize_to_limit: [700, 300], format: :webp).url || image.url
  end

  private

  def process_image
    return unless image.representable?

    variant = image.representation(resize_to_limit: [700, 300], format: :webp)
    variant.processed
  rescue ActiveStorage::FileNotFoundError
    nil
  end
end
