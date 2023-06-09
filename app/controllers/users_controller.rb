# frozen_string_literal: true

class UsersController < ApplicationController
  def lock
    authorize(current_user)
    if current_user.locked_website_at.nil?
      current_user.update(locked_website_at: Time.zone.now)
      flash[:notice] = "Website locked"
    else
      current_user.update(locked_website_at: nil)
      flash[:notice] = "Website unlocked"
    end
    redirect_to(request.referrer || root_path)
  end
end
