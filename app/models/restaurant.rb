# frozen_string_literal: true

# Restaurant model
class Restaurant < ApplicationRecord
  has_many :restaurant_devices, dependent: :destroy
end
