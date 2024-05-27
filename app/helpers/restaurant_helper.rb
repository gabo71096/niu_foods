# frozen_string_literal: true

# Restaurant helper
module RestaurantHelper
  def status_color(status)
    colors = { ok: 'success', warning: 'warning', error: 'danger' }
    colors[:"#{status}"]
  end
end
