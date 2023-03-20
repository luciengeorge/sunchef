# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :recipe

  validates :description, presence: true
end
