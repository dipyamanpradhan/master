require "test_helper"

class TeachersControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get teachers_home_url
    assert_response :success
  end
end
