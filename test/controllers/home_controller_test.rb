require File.expand_path("../../test_helper", __FILE__)

class HomeControllerTest < ActionDispatch::IntegrationTest

  self.use_instantiated_fixtures = true

  test "should_get_index" do
    get home_index_url
    assert_response :success
  end

  # test "should_redirect_to_person_prediction_on_valid_submit" do
  #   @person = people(:zero_one)
  #   get person_path(@person[:id])
  #   assert_select "button", "People#show"
  # end
  #
  # test "should_redirect_to_index_on_invalid_submit" do
  #   @person = people(:zero_four)
  #   get person_path(@person[:id])
  #   assert_redirected_to home_index_url
  # end

end
