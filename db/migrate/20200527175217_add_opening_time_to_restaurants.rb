class AddOpeningTimeToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :opening_time, :string
  end
end
