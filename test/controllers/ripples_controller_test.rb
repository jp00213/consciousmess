require "test_helper"

class RipplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ripple = ripples(:one)
  end

  test "should get index" do
    get ripples_url
    assert_response :success
  end

  test "should get new" do
    get new_ripple_url
    assert_response :success
  end

  test "should create ripple" do
    assert_difference('Ripple.count') do
      post ripples_url, params: { ripple: { message: @ripple.message, url: @ripple.url, name: @ripple.name } }
    end

    assert_redirected_to action: "index"
  end

  test "should show ripple" do
    get ripple_url(@ripple)
    assert_response :success
  end

  test "should get edit" do
    get edit_ripple_url(@ripple)
    assert_response :success
  end

  test "should update ripple" do
    patch ripple_url(@ripple), params: { ripple: { message: @ripple.message, url: @ripple.url, name: @ripple.name } }
    assert_redirected_to ripple_url(@ripple)
  end

  test "should destroy ripple" do
    assert_difference('Ripple.count', -1) do
      delete ripple_url(@ripple)
    end

    assert_redirected_to ripples_url
  end
  
  test "next 10 and then newest" do
    get ripples_url
    assert_nil(session[:position])
    setPosition(10)
#    assert_equal(10, session[:position])
#    click_on "Next 10 Ripples"
#    click_on "Newest"
  end
  
  test "oldest and back by 10" do
    get ripples_url
#    click_on "Oldest"
#    click_on "Previous 10 Ripples"
  end

end
