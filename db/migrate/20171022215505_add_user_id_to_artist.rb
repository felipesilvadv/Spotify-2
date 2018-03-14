class AddUserIdToArtist < ActiveRecord::Migration[5.1]
  def change
    add_column :artists, :user_id, :integer
  end
end
