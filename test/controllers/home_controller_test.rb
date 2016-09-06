require File.expand_path("../../test_helper", __FILE__)

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

end
