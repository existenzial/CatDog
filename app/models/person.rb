class Person < ApplicationRecord
  validates :height,
    on: :create,
    presence: true,
    length: { in: 1..2 }, #e.g.: 6'0 = 72 in
    numericality: { only_integer: true, greater_than: 36, less_than: 96 }

  validates :weight,
    on: :create,
    presence: true,
    length: { in: 2..3}, #e.g. 135 lbs
    numericality: { only_integer: true, greater_than: 50, less_than: 350 }

  validates :bmi,
    on: :save,
    presence: true,
    length: { in: 1..20}, #e.g. 17.216326530612243 float
    numericality: { greater_than: 4, less_than: 40 }

  validates :prediction,
    on: :save,
    presence: true

end
