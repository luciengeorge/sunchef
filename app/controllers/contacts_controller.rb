# frozen_string_literal: true

class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def index
    @contacts = policy_scope(Contact)
  end

  def show
    @contact = Contact.find(params[:id])
    authorize(@contact)
  end

  def new
    @contact = Contact.new
    authorize(@contact)
  end

  def create
    @contact = Contact.new(contact_params)
    authorize(@contact)
    if @contact.save
      redirect_to(coaching_path, notice: "Thank you for filling the form! I'll be in touch shortly 😊")
    else
      render(
        json: { form: render_to_string(Contacts::FormComponent.new(contact: @contact)) },
        status: :unprocessable_entity,
      )
    end
  end

  private

  def contact_params
    params.require(:contact).permit(
      :gender,
      :first_name,
      :last_name,
      :email,
      :phone,
      :birthdate,
      :place_of_birth,
      :height,
      :current_weight,
      :weight_six_month_ago,
      :weight_one_year_ago,
      :weight_change,
      :weight_goal,
      :address,
      :occupation,
      :hours_of_work_per_week,
      :relationship_status,
      :children,
      :pets,
      :health_concerns,
      :other_concerns_or_goals,
      :best_point_in_life,
      :health_of_mother,
      :health_of_father,
      :sleep_condition,
      :hours_of_sleep,
      :wake_up_at_night,
      :wake_up_at_night_reason,
      :serious_illnesses,
      :pain_stiffness_or_swelling,
      :constipation_diarrhea_or_gas,
      :allergies_or_sensitivities,
      :allergies_or_sensitivities_explanation,
      :breakfast,
      :lunch,
      :dinner,
      :snacks,
      :liquids,
      :support_from_family,
      :cooks,
      :home_cooked_percentage,
      :craving_sugar_cigarettes_or_addictions,
      :most_important_improvements,
      :additional_comment,
      :regular_periods,
      :flow_days,
      :frequency,
      :painful_or_symptomatic,
      :painful_or_symptomatic_explanation,
      :reached_or_approaching_menopause,
      :birth_control_history,
      :yeast_infection_or_urinary_tract_infections,
      :yeast_infection_or_urinary_tract_infections_explanation,
      :supplements_or_medications,
      :supplements_or_medications_list,
      :healers_helpers_or_therapies,
      :healers_helpers_or_therapies_list,
      :role_of_sports,
    )
  end
end
