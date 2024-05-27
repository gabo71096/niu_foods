# frozen_string_literal: true

# Update RestaurantDevice status randomly
class UpdateDeviceStatusJob
  include Sidekiq::Job

  def perform
    RestaurantDevice.find_each do |rd|
      rd.update!(status: %w[ok error].sample)
    end
  end
end
