# frozen_string_literal: true

class Plan < ApplicationRecord
  has_many :features, dependent: :destroy

  accepts_nested_attributes_for(:features)
end
