require "test_helper"
require "playwright_driver"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :playwright, screen_size: [1400, 1400]
end
