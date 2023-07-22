# frozen_string_literal: true

class CarouselImageComponent < ViewComponent::Base
  attr_reader :image, :carousel

  def initialize(image:, carousel:)
    @image = image
    @carousel = carousel
  end
end
