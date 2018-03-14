class SecondCreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.belongs_to :rater
      t.belongs_to :rateable, polymorphic: true
      t.float :stars, null: false
      t.string :dimension
      t.timestamps
    end
    add_index :rates, [:rateable_id, :rateable_type]
  end
end
