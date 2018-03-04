require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit events_url
  #
  #   assert_selector "h1", text: "Events"
  # end

  test "creating an event when logged in" do
    log_in

    visit new_event_url

    assert_selector "h1", text: "Start an event"
  end

  test "doesn't create an event when not logged in" do
    visit new_event_url

    assert_selector "h1", text: "Sign in"
  end
end
