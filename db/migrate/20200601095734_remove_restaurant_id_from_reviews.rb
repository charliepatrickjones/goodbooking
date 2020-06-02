class RemoveRestaurantIdFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_reference :reviews, :restaurant, null: false, foreign_key: true
  end
end
