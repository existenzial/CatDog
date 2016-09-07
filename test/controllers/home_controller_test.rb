require File.expand_path("../../test_helper", __FILE__)

class HomeControllerTest < ActionDispatch::IntegrationTest

  self.use_instantiated_fixtures = true

  test "should_get_index" do
    get home_index_url
    assert_response :success
  end

  test "should_get_person_path_on_valid_submit" do
    @person = Person.new
    @person.id = Person.last.id
    @person.height = 58
    @person.weight = 150
    get person_path(@person[:id])
    assert_response :success
  end

end
