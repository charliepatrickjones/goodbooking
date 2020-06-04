class AddDefaultValueToUserRating < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :rating, :float, default: 3.0
  end
end
