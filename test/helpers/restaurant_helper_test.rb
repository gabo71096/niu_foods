# frozen_string_literal: true

require 'test_helper'

class RestaurantHelperTest < ActionView::TestCase
  test 'should get success' do
    assert_equal('success', status_color('ok'))
  end

  test 'should get warning' do
    assert_equal('warning', status_color('warning'))
  end

  test 'should get danger' do
    assert_equal('danger', status_color('error'))
  end

  test 'should return nil' do
    assert_nil(status_color(1))
  end
end
