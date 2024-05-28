# frozen_string_literal: true

require 'test_helper'

class RestaurantControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurants_with_devices = restaurants(:one, :two)
    @turboframe_id = 'restaurant_device'
    @restaurant_info = {}

    @restaurants_with_devices.each do |rwd|
      unique_statuses = rwd.restaurant_devices.map(&:status).uniq
      max_updated_at = rwd.restaurant_devices.map(&:updated_at).max
      @restaurant_info[rwd.id] = {
        status: unique_statuses.size.equal?(1) ? unique_statuses.first : 'warning',
        updated_at: max_updated_at
      }
    end
  end

  teardown do
    Rails.cache.clear
  end

  test 'should get index' do
    get restaurant_index_url
    assert_response :success
  end

  test 'should get Restaurant as title' do
    get(restaurant_index_url)
    assert_select('h1', 'Restaurants')
  end

  test 'should get 2 Restaurant instances' do
    get(restaurant_index_url)
    assert_equal(2, @restaurants_with_devices.size)
  end

  test 'turboframe_id should be restaurant_device' do
    get(restaurant_index_url)
    assert_equal('restaurant_device', @turboframe_id)
  end

  test 'first Restaurant instance should have an OK status' do
    get(restaurant_index_url)
    assert_equal('ok', @restaurant_info[@restaurants_with_devices.first.id][:status])
  end

  test 'second Restaurant instance should have an Error status' do
    get(restaurant_index_url)
    assert_equal('error', @restaurant_info[@restaurants_with_devices.last.id][:status])
  end
end
