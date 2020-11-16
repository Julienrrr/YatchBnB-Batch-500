class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|

      t.integer :duration
      t.integer :price
      t.datetime :start_date
      t.datetime :end_date
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :boat, null: false, foreign_key: true
      t.timestamps
    end
  end
end
