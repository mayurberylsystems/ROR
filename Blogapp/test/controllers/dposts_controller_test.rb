require 'test_helper'

class DpostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dposts_index_url
    assert_response :success
  end

  test "should get new" do
    get dposts_new_url
    assert_response :success
  end

  test "should get show" do
    get dposts_show_url
    assert_response :success
  end

end
