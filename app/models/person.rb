class Person < ApplicationRecord
  validates :height,
    presence: true,
    length: { in: 36..96 }, #e.g.: 6'0 = 72 in
    numericality: { only_integer: true }

  validates :weight,
    presence: true,
    length: { in: 50..350}, #e.g. 135 lbs
    numericality: { only_integer: true }
end
