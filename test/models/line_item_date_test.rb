require "test_helper"

class LineItemDateTest < ActiveSupport::TestCase
  test "#previous_date" do
    assert_equal line_item_dates(:today), line_item_dates(:next_week).previous_date
    assert_nil line_item_dates(:today).previous_date
  end
end
