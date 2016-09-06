require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should not create a person without a height" do
    @person = Person.new
    @person[:weight] = 145
    assert_not @person.save, "@person saved without a height"
  end

  test "should not create a person without a weight" do
    @person = Person.new
    @person[:height] = 68
    assert_not @person.save, "@person saved without a weight"
  end

  test "should not save a person without a bmi" do
    @person = Person.new
    @person[:height] = 60
    @person[:weight] = 130
    @person[:prediction] = @person.dog_or_cat
    assert_not @person.save, "@person saved without a bmi"
  end

  test "should not save a person without a prediction" do
    @person = Person.new
    @person[:height] = 60
    @person[:weight] = 136
    @person[:bmi] = @person.bmi_calculator
    assert_not @person.save, "@person saved without a prediction"
  end

end
