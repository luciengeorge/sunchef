# frozen_string_literal: true

class Contact < ApplicationRecord
  enum gender: [:male, :female]
  enum relationship_status: [:single, :married, :in_a_relationship, :devorced, :other]

  COLORS = ["#FAD685", "#F8CFC5", "#CBD6AB", "#D5EEE9"]

  validates :gender, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true
  validates :birthdate, presence: true
  validates :place_of_birth, presence: true
  validates :height, presence: true
  validates :current_weight, presence: true
  validates :weight_six_month_ago, presence: true
  validates :weight_one_year_ago, presence: true
  validates :weight_change, presence: true
  validates :weight_goal, presence: true
  validates :address, presence: true
  validates :occupation, presence: true
  validates :hours_of_work_per_week, presence: true
  validates :relationship_status, presence: true
  validates :children, presence: true
  validates :pets, presence: true
  validates :health_concerns, presence: true
  validates :best_point_in_life, presence: true
  validates :health_of_mother, presence: true
  validates :health_of_father, presence: true
  validates :sleep_condition, presence: true
  validates :hours_of_sleep, presence: true
  validates :wake_up_at_night, presence: true
  validates :serious_illnesses, presence: true
  validates :pain_stiffness_or_swelling, presence: true
  validates :constipation_diarrhea_or_gas, presence: true
  validates :allergies_or_sensitivities, presence: true
  validates :breakfast, presence: true
  validates :lunch, presence: true
  validates :dinner, presence: true
  validates :snacks, presence: true
  validates :liquids, presence: true
  validates :support_from_family, presence: true
  validates :cooks, presence: true
  validates :home_cooked_percentage, presence: true, numericality: { min: 0, max: 100 }
  validates :craving_sugar_cigarettes_or_addictions, presence: true
  validates :most_important_improvements, presence: true
  validates :regular_periods, presence: true, if: :female?
  validates :flow_days, presence: true, if: :female?
  validates :frequency, presence: true, if: :female?
  validates :painful_or_symptomatic, presence: true, if: :female?
  validates :reached_or_approaching_menopause, presence: true, if: :female?
  validates :birth_control_history, presence: true, if: :female?
  validates :yeast_infection_or_urinary_tract_infections, presence: true, if: :female?
  validates :supplements_or_medications, presence: true
  validates :healers_helpers_or_therapies, presence: true
  validates :role_of_sports, presence: true
end
