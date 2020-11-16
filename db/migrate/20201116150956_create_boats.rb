class CreateBoats < ActiveRecord::Migration[6.0]
  def change
    create_table :boats do |t|

      t.string :model
      t.string :name
      t.text :description
      t.integer :capacity
      t.integer :price_per_day
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
