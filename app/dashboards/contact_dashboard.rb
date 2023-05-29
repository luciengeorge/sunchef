# frozen_string_literal: true

require "administrate/base_dashboard"

class ContactDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    additional_comment: Field::Text,
    address: Field::String,
    allergies_or_sensitivities: Field::Boolean,
    allergies_or_sensitivities_explanation: Field::Text,
    best_point_in_life: Field::String,
    birth_control_history: Field::Text,
    birthdate: Field::Date,
    breakfast: Field::Text,
    children: Field::String,
    constipation_diarrhea_or_gas: Field::Boolean,
    cooks: Field::Boolean,
    craving_sugar_cigarettes_or_addictions: Field::Boolean,
    current_weight: Field::Number.with_options(decimals: 2),
    dinner: Field::Text,
    email: Field::String,
    first_name: Field::String,
    flow_days: Field::Number,
    frequency: Field::String,
    gender: Field::Select.with_options(searchable: false, collection: ->(field) {
                                                                        field.resource.class.send(field.attribute.to_s.pluralize).keys.map(&:humanize)
                                                                      }),
    healers_helpers_or_therapies: Field::Boolean,
    healers_helpers_or_therapies_list: Field::Text,
    health_concerns: Field::Text,
    health_of_father: Field::String,
    health_of_mother: Field::String,
    height: Field::Number,
    home_cooked_percentage: Field::Number,
    hours_of_sleep: Field::Number,
    hours_of_work_per_week: Field::Number,
    last_name: Field::String,
    liquids: Field::Text,
    lunch: Field::Text,
    most_important_improvements: Field::Text,
    occupation: Field::String,
    other_concerns_or_goals: Field::Text,
    pain_stiffness_or_swelling: Field::Boolean,
    painful_or_symptomatic: Field::Boolean,
    painful_or_symptomatic_explanation: Field::Text,
    pets: Field::String,
    phone: Field::String,
    place_of_birth: Field::String,
    reached_or_approaching_menopause: Field::Boolean,
    regular_periods: Field::Boolean,
    relationship_status: Field::Select.with_options(searchable: false, collection: ->(field) {
                                                                                     field.resource.class.send(field.attribute.to_s.pluralize).keys.map(&:humanize)
                                                                                   }),
    role_of_sports: Field::Text,
    serious_illnesses: Field::Boolean,
    sleep_condition: Field::String,
    snacks: Field::Text,
    supplements_or_medications: Field::Boolean,
    supplements_or_medications_list: Field::Text,
    support_from_family: Field::Boolean,
    wake_up_at_night: Field::Boolean,
    wake_up_at_night_reason: Field::Text,
    weight_change: Field::Boolean,
    weight_goal: Field::String,
    weight_one_year_ago: Field::Number.with_options(decimals: 2),
    weight_six_month_ago: Field::Number.with_options(decimals: 2),
    yeast_infection_or_urinary_tract_infections: Field::Boolean,
    yeast_infection_or_urinary_tract_infections_explanation: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :additional_comment,
    :address,
    :allergies_or_sensitivities,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :additional_comment,
    :address,
    :allergies_or_sensitivities,
    :allergies_or_sensitivities_explanation,
    :best_point_in_life,
    :birth_control_history,
    :birthdate,
    :breakfast,
    :children,
    :constipation_diarrhea_or_gas,
    :cooks,
    :craving_sugar_cigarettes_or_addictions,
    :current_weight,
    :dinner,
    :email,
    :first_name,
    :flow_days,
    :frequency,
    :gender,
    :healers_helpers_or_therapies,
    :healers_helpers_or_therapies_list,
    :health_concerns,
    :health_of_father,
    :health_of_mother,
    :height,
    :home_cooked_percentage,
    :hours_of_sleep,
    :hours_of_work_per_week,
    :last_name,
    :liquids,
    :lunch,
    :most_important_improvements,
    :occupation,
    :other_concerns_or_goals,
    :pain_stiffness_or_swelling,
    :painful_or_symptomatic,
    :painful_or_symptomatic_explanation,
    :pets,
    :phone,
    :place_of_birth,
    :reached_or_approaching_menopause,
    :regular_periods,
    :relationship_status,
    :role_of_sports,
    :serious_illnesses,
    :sleep_condition,
    :snacks,
    :supplements_or_medications,
    :supplements_or_medications_list,
    :support_from_family,
    :wake_up_at_night,
    :wake_up_at_night_reason,
    :weight_change,
    :weight_goal,
    :weight_one_year_ago,
    :weight_six_month_ago,
    :yeast_infection_or_urinary_tract_infections,
    :yeast_infection_or_urinary_tract_infections_explanation,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :additional_comment,
    :address,
    :allergies_or_sensitivities,
    :allergies_or_sensitivities_explanation,
    :best_point_in_life,
    :birth_control_history,
    :birthdate,
    :breakfast,
    :children,
    :constipation_diarrhea_or_gas,
    :cooks,
    :craving_sugar_cigarettes_or_addictions,
    :current_weight,
    :dinner,
    :email,
    :first_name,
    :flow_days,
    :frequency,
    :gender,
    :healers_helpers_or_therapies,
    :healers_helpers_or_therapies_list,
    :health_concerns,
    :health_of_father,
    :health_of_mother,
    :height,
    :home_cooked_percentage,
    :hours_of_sleep,
    :hours_of_work_per_week,
    :last_name,
    :liquids,
    :lunch,
    :most_important_improvements,
    :occupation,
    :other_concerns_or_goals,
    :pain_stiffness_or_swelling,
    :painful_or_symptomatic,
    :painful_or_symptomatic_explanation,
    :pets,
    :phone,
    :place_of_birth,
    :reached_or_approaching_menopause,
    :regular_periods,
    :relationship_status,
    :role_of_sports,
    :serious_illnesses,
    :sleep_condition,
    :snacks,
    :supplements_or_medications,
    :supplements_or_medications_list,
    :support_from_family,
    :wake_up_at_night,
    :wake_up_at_night_reason,
    :weight_change,
    :weight_goal,
    :weight_one_year_ago,
    :weight_six_month_ago,
    :yeast_infection_or_urinary_tract_infections,
    :yeast_infection_or_urinary_tract_infections_explanation,
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how contacts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(contact)
  #   "Contact ##{contact.id}"
  # end
end
