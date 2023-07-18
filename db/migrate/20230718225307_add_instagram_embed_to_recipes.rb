class AddInstagramEmbedToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :instagram_embed, :text
  end
end
