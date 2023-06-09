class AddLockedWebsiteAtToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :locked_website_at, :datetime
  end
end
