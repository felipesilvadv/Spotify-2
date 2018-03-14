class RenameColumnPublicFromPlaylists < ActiveRecord::Migration[5.1]
  def change
    change_table :playlists do |t|
      t.rename :public, :public_list
    end
  end
end
