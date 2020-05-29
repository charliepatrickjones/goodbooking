class ChangeForeignKeyOnReviewTable < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :reviews, column: :booking_id
    add_reference :reviews, :restaurant, foreign_key: true
  end
end
