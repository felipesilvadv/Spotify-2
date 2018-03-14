class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.references :artist, foreign_key: true
      t.references :songs, foreign_key: true
      t.string :genre
      t.date :date
      t.integer :number

      t.timestamps
    end
  end
end
