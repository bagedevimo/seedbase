require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400], options: {
    desired_capabilities: {
      chromeOptions: {
        args: %w[headless disable-gpu],
      }
    }
  }
end
