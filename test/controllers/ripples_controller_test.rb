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
  
  # gets index page, position is 0, changes position by 10, 
  # resets position to 0 for newest items
  test "next 10 and then newest" do
    get ripples_url
    assert_equal(0, session[:position])
    post '/changePosition', params: { value: 10 }
    assert_equal(10, session[:position])
    post '/setPosition', params: { value: 0 }
    assert_equal(0, session[:position])
  end
  
  # gets index page, position is 0, selects last page (), 
  # changes position by -10 for back one page
  test "oldest and back by 10" do
    get ripples_url
    assert_equal(0, session[:position])
    arraySize = @controller.index.size
    lastPage = (arraySize / 10) * 10
    post '/changePosition', params: { value: lastPage }
    assert_equal(lastPage, session[:position])
    post '/changePosition', params: { value: -10 }
    assert_equal(lastPage-10, session[:position])
  end

end
