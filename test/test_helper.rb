require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def log_in
    visit new_session_url

    fill_in "email", with: "bob@example.com"
    fill_in "password", with: "abcdef123456"

    click_button "Log in"
  end
end
