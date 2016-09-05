require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  self.use_instantiated_fixtures = true

  test "@person should be an instance of the Person model" do
    @person = Person.new
    assert_instance_of Person, @person, "@person is not an instance of the Person model"
  end

  # Height
  test "@person[:height] should be an integer" do
    assert @person[:height].is_a? Integer, "@person[:height] is not an integer"
  end

  test "@person[:height] should be greater than 36 inches" do
    assert_operator @person[:height], :>, 36, "@person[:height] is not greater than 36 inches"
  end

  test "@person[:height] should be less than 96 inches" do
    assert_operator @person[:height], :<, 96, "@person[:height] is not less than 96 inches"
  end

  # Weight
  test "@person[:weight] should be an integer" do
    assert @person[:weight].is_a? Integer, "@person[:weight] is not an integer"
  end

  test "@person[:weight] should be greater than 50 lbs" do
    assert_operator @person[:weight], :>, 50, "@person[:weight] is not greater than 50 lbs"
  end

  test "@person[:weight] should be less than 350 lbs" do
    assert_operator @person[:weight], :<, 350, "@person[:weight] is not less than 350 lbs"
  end

  # BMI
  test "@person[:bmi] should be a float" do
    assert @person[:bmi].is_a? Float, "@person[:bmi] is not a float"
  end

  test "@person[:bmi] should be greater than 4" do
    assert_operator @person[:bmi], :>, 4, "@person[:bmi] is not greater than 4"
  end

  test "@person[:bmi] should be less than 40" do
    assert_operator @person[:bmi], :<, 40, "@person[:bmi] is not less than 40"
  end

  # Prediction
  test "@person[:prediction] should be a dog if bmi is within a healthy range" do
    assert_equal('dog', @person[:prediction], "person[:prediction] is not a dog")
  end

  test "@person[:prediction] should be a cat if bmi is within an unhealthy range" do
    assert_equal('cat', @person[:prediction], "person[:prediction] is not a cat")
  end

end
