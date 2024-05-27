# frozen_string_literal: true

require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test 'should get 2 Restaurant instances' do
    assert_equal(2, Restaurant.count)
  end

  test 'should be able to save Restaurant without name' do
    restaurant = Restaurant.new
    assert(restaurant.save)
  end

  test 'name should be normalized' do
    restaurant = Restaurant.create(name: '   restaurant 1   ')
    assert_equal('Restaurant 1', restaurant.name)
  end

  # Restaurant Devices
  test 'should get 1 Restaurant Devices for Restaurant 1' do
    assert_equal(1, Restaurant.first.restaurant_devices.size)
  end

  test 'should not get 2 Restaurant Devices for Restaurant 1' do
    assert_not_equal(2, Restaurant.last.restaurant_devices.size)
  end
end
