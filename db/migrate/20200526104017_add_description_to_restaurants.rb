class AddDescriptionToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :description, :string
  end
end
