require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  self.use_instantiated_fixtures = true

  # Height
  test "height should be an integer" do

  end

  test "height should be greater than 36 inches" do

  end

  test "height should be less than 96 inches" do

  end

  # Weight
  test "weight should be an integer" do

  end

  test "weight should be greater than 50 lbs" do

  end

  test "weight should be less than 350 lbs" do

  end

  # BMI
  test "bmi should be a float" do

  end

  test "bmi should be greater than 4" do

  end

  test "bmi should be less than 40" do

  end

  # Prediction
  test "prediction should be a dog if bmi is within ta healthy range" do

  end

  test "prediction should be a cat if bmi is within an unhealthy range" do

  end

end
