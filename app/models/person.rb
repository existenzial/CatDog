class Person < ApplicationRecord
  validates :height,
    presence: true,
    length: { in: 100..230 }, #e.g.: 7 ft = 213 cm
    numericality: { only_integer: true }

  validates :weight,
    presence: true,
    length: { in: 50..350}, #e.g. 135 lbs
    numericality: { only_integer: true }
end
