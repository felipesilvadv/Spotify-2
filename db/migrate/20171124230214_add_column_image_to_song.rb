class AddColumnImageToSong < ActiveRecord::Migration[5.1]
  def change
    change_table :songs do |t|
      t.attachment :image
    end
  end
end
