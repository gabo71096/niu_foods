# frozen_string_literal: true

# Change status column from string to integer
class ChangeStatusColumnInRestaurantDevices < ActiveRecord::Migration[7.1]
  def up
    # If this migration fails after you do a rollback, you need to comment out
    # the enum :status line in RestaurantDevice model.
    add_column(:restaurant_devices, :int_status, :integer, null: false, default: 0)

    ActiveRecord::Base.transaction do
      RestaurantDevice.find_each do |rd|
        rd.update!(int_status: rd.status.eql?('ok') ? 0 : 1)
      end
    end

    remove_column(:restaurant_devices, :status)
    rename_column(:restaurant_devices, :int_status, :status)
  end

  def down
    add_column(:restaurant_devices, :str_status, :string, null: false, default: :ok)

    ActiveRecord::Base.transaction do
      RestaurantDevice.find_each do |rd|
        rd.update!(str_status: rd.status.eql?(0) ? 'ok' : 'error')
      end
    end

    remove_column(:restaurant_devices, :status)
    rename_column(:restaurant_devices, :str_status, :status)
  end
end
