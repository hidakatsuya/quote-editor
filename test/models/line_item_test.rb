require "test_helper"

class LineItemTest < ActiveSupport::TestCase
  test "#total_price" do
    assert_equal 250, line_items(:catering_today).total_price
  end
end
