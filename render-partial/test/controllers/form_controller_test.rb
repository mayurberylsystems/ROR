require 'test_helper'

class FormControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get form_new_url
    assert_response :success
  end

  test "should get edit" do
    get form_edit_url
    assert_response :success
  end

  test "should get show" do
    get form_show_url
    assert_response :success
  end

end
