require 'test_helper'

class Doctors::PatientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get doctors_patients_index_url
    assert_response :success
  end

end
