# frozen_string_literal: true

class Instruction < ApplicationRecord
  belongs_to :recipe, touch: true

  validates :description, presence: true
end
