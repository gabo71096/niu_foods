# frozen_string_literal: true

# rubocop:disable Rails/SkipsModelValidations
if Rails.env.development?
  restaurant1 = Restaurant.create!(name: 'Restaurant 1')
  restaurant2 = Restaurant.create!(name: 'Restaurant 2')

  RestaurantDevice.insert_all!(
    [
      {
        name: 'Restaurant 1 Printer',
        status: 'ok',
        device_type: :printer,
        restaurant_id: restaurant1.id
      },
      {
        name: 'Restaurant 1 Web Server',
        status: 'ok',
        device_type: :web_server,
        restaurant_id: restaurant1.id
      },
      {
        name: 'Restaurant 1 DB Server',
        status: 'ok',
        device_type: :db_server,
        restaurant_id: restaurant1.id
      },
      {
        name: 'Restaurant 2 Printer',
        status: 'ok',
        device_type: :printer,
        restaurant_id: restaurant2.id
      },
      {
        name: 'Restaurant 2 Web Server',
        status: 'ok',
        device_type: :web_server,
        restaurant_id: restaurant2.id
      },
      {
        name: 'Restaurant 2 DB Server',
        status: 'ok',
        device_type: :db_server,
        restaurant_id: restaurant2.id
      }
    ]
  )
end
# rubocop:enable Rails/SkipsModelValidations
