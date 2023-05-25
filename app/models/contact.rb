# frozen_string_literal: true

class Contact < ApplicationRecord
  enum gender: [:male, :female]
  enum relationship_status: [:single, :married, :in_a_relationship, :devorced, :other]
end
