# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :instructions, dependent: :destroy

  validates :name, presence: true
  has_many_attached :images
  enum category: [:lunch, :dinner, :sweets, :smoothies, :drinks, :snacks, :dressings, :breakfast]
end
