require "application_system_test_case"

class RipplesTest < ApplicationSystemTestCase
  setup do
    @ripple = ripples(:one)
  end

  test "visiting the index" do
    visit ripples_url
    assert_selector "h1", text: "CONSCIOUS/mess"
    assert_selector "h1", text: "...a stream of anonymous online ramblings"
  end

  test "creating a Ripple" do
    visit ripples_url
    click_on "New Ripple"
    assert_selector "h1", text: "Say What's On Your Mind"

    fill_in "Your name", with: @ripple.name
    fill_in "A", with: @ripple.url
    fill_in "Your message", with: @ripple.message
    click_on "Create Ripple"
    assert_selector "th", text: "Name"
    assert_selector "th", text: "Message"
    assert_selector "th", text: "Posted"
    assert_selector "td", text: @ripple.name
  end

end
