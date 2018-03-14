class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :description
      t.string :genre
      t.string :nationality
      t.string :active_time

      t.timestamps
    end
  end
end
