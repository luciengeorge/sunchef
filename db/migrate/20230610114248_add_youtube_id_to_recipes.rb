class AddYoutubeIdToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :youtube_id, :string
  end
end
