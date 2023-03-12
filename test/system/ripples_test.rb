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

    fill_in "Your", with: @ripple.​​name
    fill_in "A", with: @ripple.url
    fill_in "Your message", with: @ripple.message
    click_on "Create Ripple"
  end

  test "next 10 and then newest" do
    visit ripples_url
    click_on "Next 10 Ripples"
    puts "testing"
    assert_equal(10, getPosition)
    click_on "Newest"
  end
  
  test "oldest and back by 10" do
    visit ripples_url
    click_on "Oldest"
    click_on "Previous 10 Ripples"
  end
end
