class AddLocationToSellingPoints < ActiveRecord::Migration[7.0]
  def change
    add_column :selling_points, :location, :string
  end
end
