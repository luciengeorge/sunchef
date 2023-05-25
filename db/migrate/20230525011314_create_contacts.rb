class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.integer :gender, default: 0, null: false
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.date :birthdate
      t.string :place_of_birth
      t.integer :height
      t.float :current_weight
      t.float :weight_six_month_ago
      t.float :weight_one_year_ago
      t.boolean :weight_change, default: false, null: false
      t.string :weight_goal
      t.string :address
      t.string :occupation
      t.integer :hours_of_work_per_week
      t.integer :relationship_status, default: 0, null: false
      t.string :children
      t.string :pets
      t.text :health_concerns
      t.text :other_concerns_or_goals
      t.string :best_point_in_life
      t.string :health_of_mother
      t.string :health_of_father
      t.string :sleep_condition
      t.integer :hours_of_sleep
      t.boolean :wake_up_at_night, default: false, null: false
      t.text :wake_up_at_night_reason
      t.boolean :serious_illnesses, default: false, null: false
      t.boolean :pain_stiffness_or_swelling, default: false, null: false
      t.boolean :constipation_diarrhea_or_gas, default: false, null: false
      t.boolean :allergies_or_sensitivities, default: false, null: false
      t.text :allergies_or_sensitivities_explanation
      t.text :breakfast
      t.text :lunch
      t.text :dinner
      t.text :snacks
      t.text :liquids
      t.boolean :support_from_family, default: false, null: false
      t.boolean :cooks, default: false, null: false
      t.integer :home_cooked_percentage
      t.boolean :craving_sugar_cigarettes_or_addictions, default: false, null: false
      t.text :most_important_improvements
      t.text :additional_comment
      t.boolean :regular_periods, default: false, null: false
      t.integer :flow_days
      t.string :frequency
      t.boolean :painful_or_symptomatic, default: false, null: false
      t.text :painful_or_symptomatic_explanation
      t.boolean :reached_or_approaching_menopause, default: false, null: false
      t.text :birth_control_history
      t.boolean :yeast_infection_or_urinary_tract_infections, default: false, null: false
      t.text :yeast_infection_or_urinary_tract_infections_explanation
      t.boolean :supplements_or_medications, default: false, null: false
      t.text :supplements_or_medications_list
      t.boolean :healers_helpers_or_therapies, default: false, null: false
      t.text :healers_helpers_or_therapies_list
      t.text :role_of_sports

      t.timestamps
    end
  end
end
