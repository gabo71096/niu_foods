# frozen_string_literal: true

require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  # local_time method testing
  test 'should get Santiago time' do
    assert_equal('2024-12-30 21:00:00 -0300', local_time('2024/12/31'.to_datetime).to_s)
  end

  test 'should get Auckland timezone' do
    assert_equal('(GMT+12:00) Auckland', local_time(Time.zone.now, 'Auckland').time_zone.to_s)
  end

  # format_datetime method testing
  test 'should get datetime in %H:%M:%S %d/%m/%Y format' do
    assert_equal('00:00:00 31/12/2024', format_datetime('2024/12/31'.to_datetime))
  end

  test 'should raise an ArgumentError' do
    assert_raises(ArgumentError) { format_datetime }
  end

  test 'should raise a NoMethodError' do
    assert_raises(NoMethodError) { format_datetime(1) }
  end
end
