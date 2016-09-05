# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

people = Person.create([
    { height: 68, weight: 145, bmi: 22.044766435986162, prediction: 'dog' },
    { height: 66, weight: 170, bmi: 27.435720844811755, prediction: 'cat' },
    { height: 70, weight: 120, bmi: 17.216326530612243, prediction: 'cat' },
    { height: 60, weight: 110, bmi: 21.480555555555554, prediction: 'dog' },
    { height: 58, weight: 135, bmi: 28.21195005945303, prediction: 'cat' },
    { height: 63, weight: 92, bmi: 16.295288485764676, prediction: 'cat' },
    { height: 82, weight: 185, bmi: 19.341909577632364, prediction: 'dog' },
    { height: 75, weight: 200, bmi: 24.995555555555555, prediction: 'cat' },
    { height: 78, weight: 135, bmi: 15.599112426035502, prediction: 'cat' }
])