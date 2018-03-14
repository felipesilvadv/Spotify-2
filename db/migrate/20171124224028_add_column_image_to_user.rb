class AddColumnImageToUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :image, :string
    change_table :users do |t|
      t.attachment :image
    end
  end
end
