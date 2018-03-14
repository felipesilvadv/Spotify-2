class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.text :lyrics
      t.integer :duration
      t.string :genre

      t.timestamps
    end
  end
end
