class CreateFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :features do |t|
      t.references :plan, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
