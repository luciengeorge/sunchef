# frozen_string_literal: true

class Recipe < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_name,
    against: [:name],
    associated_against: {
      ingredients: [:description],
      instructions: [:description],
    },
    using: {
      tsearch: { prefix: true, any_word: true },
    }

  has_many :ingredients, dependent: :destroy
  has_many :instructions, dependent: :destroy

  validates :name, presence: true
  has_many_attached :images
  enum category: [:lunch_dinner, :sweets, :smoothies, :drinks, :snacks, :dressings, :breakfast]

  accepts_nested_attributes_for(:ingredients)
  accepts_nested_attributes_for(:instructions)

  after_commit :process_images, if: -> { images.attached? }

  def to_s
    name
  end

  def to_param
    "#{name.parameterize}-#{id}"
  end

  def show_first_image_url
    images.first.representation(resize_to_limit: [2000, 1500], format: :webp).url || images.first.url
  end

  def show_second_image_url
    images.second.representation(resize_to_limit: [2000, 1500], format: :webp).url || images.second.url
  end

  def index_image_url
    images.first.representation(resize_to_limit: [624, 400], format: :webp).url || images.first.url
  end

  private

  def process_images
    images.each do |image|
      next unless image.representable?

      show_variant = image.representation(resize_to_limit: [2000, 1500], format: :webp)
      index_variant = image.representation(resize_to_limit: [624, 400], format: :webp)

      show_variant.processed
      index_variant.processed
    rescue ActiveStorage::FileNotFoundError
      next
    end
  end
end
