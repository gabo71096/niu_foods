# frozen_string_literal: true

# ApplicationHelper module
module ApplicationHelper
  def local_time(datetime, time_zone = 'Santiago')
    datetime.in_time_zone(time_zone)
  end

  def format_datetime(datetime)
    datetime.strftime('%H:%M:%S %d/%m/%Y')
  end
end
