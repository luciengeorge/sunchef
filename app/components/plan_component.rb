# frozen_string_literal: true

class PlanComponent < ViewComponent::Base
  attr_reader :plan, :color

  def initialize(plan:, color:)
    @plan = plan
    @color = color
  end

  def background_color
    color[:background]
  end

  def text_color
    color[:text]
  end
end
