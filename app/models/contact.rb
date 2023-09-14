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
  # validates :height, presence: true
  # validates :current_weight, presence: true
  # validates :weight_six_month_ago, presence: true
  # validates :weight_one_year_ago, presence: true
  # validates :weight_change, inclusion: [true, false]
  # validates :weight_goal, presence: true
  # validates :address, presence: true
  # validates :occupation, presence: true
  # validates :hours_of_work_per_week, presence: true
  # validates :relationship_status, presence: true
  # validates :children, presence: true
  # validates :pets, presence: true
  # validates :health_concerns, presence: true
  # validates :best_point_in_life, presence: true
  # validates :health_of_mother, presence: true
  # validates :health_of_father, presence: true
  # validates :sleep_condition, presence: true
  # validates :hours_of_sleep, presence: true
  # validates :wake_up_at_night, inclusion: [true, false]
  # validates :serious_illnesses, inclusion: [true, false]
  # validates :pain_stiffness_or_swelling, inclusion: [true, false]
  # validates :constipation_diarrhea_or_gas, inclusion: [true, false]
  # validates :allergies_or_sensitivities, inclusion: [true, false]
  # validates :breakfast, presence: true
  # validates :lunch, presence: true
  # validates :dinner, presence: true
  # validates :snacks, presence: true
  # validates :liquids, presence: true
  # validates :support_from_family, inclusion: [true, false]
  # validates :cooks, inclusion: [true, false]
  # validates :home_cooked_percentage, presence: true, numericality: { min: 0, max: 100 }
  # validates :craving_sugar_cigarettes_or_addictions, inclusion: [true, false]
  # validates :most_important_improvements, presence: true
  # with_options if: :female? do |female|
  #   female.validates(:regular_periods, inclusion: [true, false])
  #   female.validates(:flow_days, presence: true)
  #   female.validates(:frequency, presence: true)
  #   female.validates(:painful_or_symptomatic, presence: true)
  #   female.validates(:reached_or_approaching_menopause, presence: true)
  #   female.validates(:birth_control_history, presence: true)
  #   female.validates(:yeast_infection_or_urinary_tract_infections, presence: true)
  # end
  # validates :supplements_or_medications, presence: true
  # validates :healers_helpers_or_therapies, inclusion: [true, false]
  # validates :role_of_sports, presence: true

  has_secure_token :token, length: 36

  after_create :deliver_email

  def name
    "#{first_name} #{last_name}"
  end

  private

  def deliver_email
    SunchefMailer.with(contact: self).new_contact.deliver_later
    ContactMailer.with(contact: self).new_contact.deliver_later
  end
end
