require 'test_helper'

class EnvsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get envs_create_url
    assert_response :success
  end

end
