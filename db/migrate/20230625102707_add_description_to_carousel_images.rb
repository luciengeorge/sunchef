class AddDescriptionToCarouselImages < ActiveRecord::Migration[7.0]
  def change
    add_column :carousel_images, :description, :text
  end
end
