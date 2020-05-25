class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.float :booking_rating
      t.text :content
      t.float :punctuality_rating
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
