class PlansController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @plans = policy_scope(Plan)
    @colors = [
      {
        background: "#A1BFCD",
        text: "#024261",
      },
      {
        background: "#D8C3DD",
        text: "#8D29A5",
      },
      {
        background: "#CBD6AB",
        text: "#5F751F"
      }
    ]
  end
end
