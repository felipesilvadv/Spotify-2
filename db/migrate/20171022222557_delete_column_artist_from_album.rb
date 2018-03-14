class DeleteColumnArtistFromAlbum < ActiveRecord::Migration[5.1]
  def change
    remove_column :albums, :artist_id
    remove_column :albums, :songs_id
    remove_column :albums, :number
  end
end
