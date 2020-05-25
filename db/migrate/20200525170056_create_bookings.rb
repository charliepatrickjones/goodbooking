class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.time :time
      t.boolean :accepted
      t.integer :party

      t.timestamps
    end
  end
end
