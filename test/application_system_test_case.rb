require "test_helper"
require "playwright_driver"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Warden::Test::Helpers

  driven_by :playwright, screen_size: [1400, 1400]
end
