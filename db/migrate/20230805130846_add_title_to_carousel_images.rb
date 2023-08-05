class AddTitleToCarouselImages < ActiveRecord::Migration[7.0]
  def change
    add_column :carousel_images, :title, :string
  end
end
