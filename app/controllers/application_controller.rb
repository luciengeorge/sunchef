# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :under_maintenance

  def under_maintenance
    return unless under_maintenance?

    redirect_to(maintenance_path)
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def under_maintenance?
    admin = User.find_by(admin: true)
    !((controller_name == "pages" && action_name == "maintenance") ||
      admin.locked_website_at.blank? ||
      current_user&.admin?)
  end
end
