# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :category
  has_many :ingredients, dependent: :destroy
  has_many :instructions, dependent: :destroy

  validates :name, presence: true
  has_many_attached :images
end
