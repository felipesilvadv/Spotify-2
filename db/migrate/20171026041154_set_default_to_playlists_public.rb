class SetDefaultToPlaylistsPublic < ActiveRecord::Migration[5.1]
  def change
    change_column_default :playlists, :public, from: false, to: true
  end
end
