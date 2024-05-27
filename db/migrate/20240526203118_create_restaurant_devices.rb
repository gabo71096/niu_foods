# frozen_string_literal: true

# Create RestaurantDevice table
class CreateRestaurantDevices < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurant_devices do |t|
      t.string :name
      t.integer :device_type, null: false, default: 0
      t.string :status, null: false, default: 'ok'
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
