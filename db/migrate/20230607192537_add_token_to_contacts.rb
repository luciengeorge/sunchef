class AddTokenToContacts < ActiveRecord::Migration[7.0]
  def change
    add_column :contacts, :token, :string
    add_index :contacts, :token, unique: true
  end
end
