# frozen_string_literal: true

# Restaurant controller
class RestaurantController < ApplicationController
  before_action :fetch_restaurants_with_devices, only: :index
  before_action :map_restaurant_info, only: :index

  def index
    @turboframe_id = 'restaurant_device'

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  private

  def fetch_restaurants_with_devices
    @restaurants_with_devices = Restaurant.select(:id, :name).includes(:restaurant_devices)
  end

  def map_restaurant_info
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
end
