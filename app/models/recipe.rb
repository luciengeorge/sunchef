# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :instructions, dependent: :destroy

  validates :name, presence: true
  has_many_attached :images do |attachable|
    attachable.variant(:thumb, resize: "100x100")
    attachable.variant(:medium, resize: "300x300", monochrome: true)
  end
  enum category: [:lunch_dinner, :sweets, :smoothies, :drinks, :snacks, :dressings, :breakfast]

  accepts_nested_attributes_for(:ingredients)
  accepts_nested_attributes_for(:instructions)

  def to_s
    name
  end

  def to_param
    "#{name.parameterize}-#{id}"
  end
end
