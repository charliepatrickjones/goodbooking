class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :category
      t.string :address
      t.float :rating
      t.string :phone_number
      t.integer :capacity
      t.references :user, null: false, foreign_key: true
      t.string :menu
      t.integer :price_range

      t.timestamps
    end
  end
end
