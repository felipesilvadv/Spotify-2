class RemoveColumnGenreFromAlbums < ActiveRecord::Migration[5.1]
  def change
    remove_column :albums, :genre
  end
end
