require 'test_helper'

class AjaxControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get ajax_new_url
    assert_response :success
  end

  test "should get index" do
    get ajax_index_url
    assert_response :success
  end

end
