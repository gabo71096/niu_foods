# frozen_string_literal: true

# RestaurantDevice model
class RestaurantDevice < ApplicationRecord
  belongs_to :restaurant

  enum :device_type, %i[printer web_server db_server]
  enum :status, %i[ok error]

  validates :device_type, presence: true
  validates :status, presence: true

  normalizes :name, with: ->(name) { name.strip.titlecase }
end
