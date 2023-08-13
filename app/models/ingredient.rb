# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :recipe, touch: true

  validates :description, presence: true
end
