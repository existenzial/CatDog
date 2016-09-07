require File.expand_path("../../test_helper", __FILE__)

class PeopleControllerTest < ActionDispatch::IntegrationTest

  self.use_instantiated_fixtures = true

  # Routing
  test "should_be_able_to_show_all_people" do
    get people_url
    assert_response :success
  end

  test "should_be_able_to_show_a_person" do
    @person = people(:four)
    get person_path(@person[:id])
    assert_response :success
  end

  ## C - R - U - D

  # Create
  test "should_create_a_person_with_all_attributes" do
    @person = Person.new
    assert_difference('Person.count') do
      post people_url, params: {
          person: {
            height: 68,
            weight: 145,
            bmi: 22.044766435986162,
            prediction: 'dog'
          }
        }
    end
    assert_redirected_to person_path(Person.last)
  end

  test "should_not_create_a_person_without_a_height" do
    @person = Person.new
    @person.weight = 145
    assert_not @person.save, "saved without a height"
  end

  test "should_not_create_a_person_without_a_weight" do
    @person = Person.new
    @person.height = 68
    assert_not @person.save, "saved without a weight"
  end

  # Read
  test "should_read_a_person" do
    @person = people(:three)
    assert Person.find(@person.id), "could not read person from the database"
  end


  # Update
  test "should_update_height" do
    @person = people(:one)
    patch person_url(@person), params: {
      person: {
        height: 69
      }
    }
    @person.reload
    assert_equal 69, @person.height, "height could not be updated"
  end

  test "should_update_weight" do
    @person = people(:one)
    patch person_url(@person), params: {
      person: {
        weight: 180
      }
    }
    @person.reload
    assert_equal 180, @person.weight, "weight could not be updated"
  end

  test "should_update_bmi_with_new_height_or_weight" do
    @person = people(:one)
    new_bmi = ( (@person.weight.to_f)/(@person.height.to_f * @person.height.to_f) ) * 703
    patch person_url(@person), params: {
      person: {
        height: 69,
        weight: 180,
        bmi: new_bmi
      }
    }
    assert_equal new_bmi, @person.bmi, "bmi could not be updated"
  end

  test "should_update_prediction_with_new_bmi" do
    @person = people(:one)
    new_bmi = ( (@person.weight.to_f)/(@person.height.to_f * @person.height.to_f) ) * 703
    patch person_url(@person), params: {
      person: {
        height: 69,
        weight: 180,
        bmi: new_bmi
      }
    }
    @person.reload
    assert_equal 'cat', @person.prediction, "prediction could not be updated"
  end

  test "should_update_all_attributes" do
    @person = people(:one)
    patch person_url(@person), params: {
      person: {
        height: 69,
        weight: 180,
        bmi: 27.3659169550173,
        prediction: 'cat'
      }
    }
    @person.reload
    assert_equal @person, Person.find(@person[:id]), "all attributes could not be updated"
  end

  # Delete
  test "should_delete_a_person" do
    @person = people(:two)
    assert_difference('Person.count', -1) do
      delete person_url(@person)
    end
    assert_redirected_to home_index_path, "could not delete a person from the database"
  end

end
