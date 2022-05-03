require 'test_helper'

class KakeibosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kakeibos_index_url
    assert_response :success
  end

end
