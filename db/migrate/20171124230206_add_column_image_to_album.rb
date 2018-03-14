class AddColumnImageToAlbum < ActiveRecord::Migration[5.1]
  def change
    change_table :albums do |t|
      t.attachment :image
    end
  end
end
