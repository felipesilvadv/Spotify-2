class ChangeDefaultToPlaylist < ActiveRecord::Migration[5.1]
  def change
    change_column_default :playlists, :public_list, from: true, to: nil
  end
end
