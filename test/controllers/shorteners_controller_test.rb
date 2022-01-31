require "test_helper"

class ShortenersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shorteners_index_url
    assert_response :success
  end

end
