# frozen_string_literal: true

require 'test_helper'

class RestaurantDeviceTest < ActiveSupport::TestCase
  test 'should not save Restaurant Device without status' do
    restaurant_device = RestaurantDevice.new(restaurant: Restaurant.first, status: nil, device_type: :printer)
    assert_not(restaurant_device.save)
  end

  test 'should not save Restaurant Device without device type' do
    restaurant_device = RestaurantDevice.new(restaurant: Restaurant.first, status: :ok, device_type: nil)
    assert_not(restaurant_device.save)
  end

  test 'should not save Restaurant Device without restaurant' do
    restaurant_device = RestaurantDevice.new(status: :ok, device_type: :printer)
    assert_not(restaurant_device.save)
  end

  test 'should save Restaurant Device correctly' do
    restaurant_device = RestaurantDevice.new(restaurant: Restaurant.first, status: :ok, device_type: :printer)
    assert(restaurant_device.save)
  end
end
