# frozen_string_literal: true

namespace :images do
  desc "Update images"
  task update: [:environment] do
    CarouselImage.find_each(&:save)
    Recipe.find_each(&:save)
  end
end
