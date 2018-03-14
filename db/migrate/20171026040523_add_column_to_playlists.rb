class AddColumnToPlaylists < ActiveRecord::Migration[5.1]
  def change
    add_column :playlists, :public, :bool
  end
end
