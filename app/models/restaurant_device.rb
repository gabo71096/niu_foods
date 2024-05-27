# frozen_string_literal: true

# RestaurantDevice model
class RestaurantDevice < ApplicationRecord
  belongs_to :restaurant

  enum :device_type, %i[printer web_server db_server]
end
