require File.expand_path("../../test_helper", __FILE__)

class PersonTest < ActiveSupport::TestCase

  self.use_instantiated_fixtures = true

  test "should_be_an_instance_of_Person" do
    @person = Person.new
    assert_instance_of Person, @person, "@person is not an instance of the Person model"
  end

  # Validations
  test "height_is_validated" do
    @person = people(:zero_one)
    @person.height = nil
    assert @person.valid?, "@person is valid when height is nil"
  end

  test "weight_is_validated" do
    @person = people(:zero_one)
    @person.weight = nil
    assert @person.valid?, "@person is valid when weight is nil"
  end

  test "valid_with_height_and_weight" do
    @person = people(:zero_one)
    assert @person.valid?, "@person is not valid"
  end

  test "valid_with_all_attributes" do
    @person = people(:one)
    assert @person.valid?, "@person is not valid"
  end

  # Height
  test "height_is_an_integer" do
    @person = people(:one)
    assert @person.height.to_int, "height is not an integer"
  end

  test "height_is_greater_than_36_inches" do
    @person = people(:one)
    assert_not @person.height < 36, "height is not greater than 36 inches"
  end

  test "height_is_less_than_96_inches" do
    @person = people(:one)
    assert_not @person.height > 96, "height is not less than 96 inches"
  end

  # Weight
  test "weight_is_an_integer" do
    @person = people(:one)
    assert @person.weight.to_int, "weight is not an integer"
  end

  test "weight_is_greater_than_50_lbs" do
    @person = people(:one)
    assert_not @person.weight < 50, "weight is less than 50 lbs"
  end

  test "weight_is_less_than_350_lbs" do
    @person = people(:one)
    assert_not @person.weight > 350, "weight is greater than 350 lbs"
  end

  # BMI
  test "bmi_can_be_calculated_from_height_and_weight" do
    @person = people(:zero_one)
    @person.bmi = ( (@person.weight.to_f)/(@person.height.to_f * @person.height.to_f) ) * 703
    assert_equal(23.170166015625, @person.bmi, "bmi could not be calculated from height and weight")
  end

  test "bmi_is_a_float" do
    @person = people(:two)
    assert @person.bmi.to_f, "bmi is not a float"
  end

  test "bmi_is_greater_than_4" do
    @person = people(:three)
    assert_not @person.bmi < 4, "bmi is less than 4"
  end

  test "bmi_is_less_than_40" do
    @person = people(:three)
    assert_not @person.bmi > 40, "bmi is greater than 40"
  end

  # Prediction
  test "prediction_is_dog_with_healthy_bmi" do
    @person = people(:zero_one)
    # bmi_calculator
    @person.bmi = ( (@person.weight.to_f)/(@person.height.to_f * @person.height.to_f) ) * 703
    # dog_or_cat
    if @person[:bmi] > 25 || @person[:bmi] < 18
      @person[:prediction] = 'cat'
    else
      @person[:prediction] = 'dog'
    end
    assert_equal('dog', @person.prediction, "prediction is not a dog with healthy bmi")
  end

  test "prediction_is_cat_with_unhealthy_bmi" do
    @person = people(:zero_two)
    # bmi_calculator
    @person.bmi = ( (@person.weight.to_f)/(@person.height.to_f * @person.height.to_f) ) * 703
    # dog_or_cat
    if @person[:bmi] > 25 || @person[:bmi] < 18
      @person[:prediction] = 'cat'
    else
      @person[:prediction] = 'dog'
    end
    assert_equal('cat', @person.prediction, "prediction is not a dog with healthy bmi")
  end

end
