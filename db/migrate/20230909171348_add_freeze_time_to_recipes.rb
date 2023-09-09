class AddFreezeTimeToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :freeze_time, :string
  end
end
