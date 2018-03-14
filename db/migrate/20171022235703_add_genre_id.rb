class AddGenreId < ActiveRecord::Migration[5.1]
  def change
    add_column :artists, :genre_id , :integer
    add_column :songs, :genre_id , :integer
    add_column :albums, :genre_id , :integer
  end
end
