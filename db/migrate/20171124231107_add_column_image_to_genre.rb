class AddColumnImageToGenre < ActiveRecord::Migration[5.1]
  def change
    change_table :genres do |t|
      t.attachment :image
    end
  end
end
