# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

people = Person.create([
    { height: 175, weight: 180, prediction: 'dog' },
    { height: 130, weight: 125, prediction: 'dog' },
    { height: 155, weight: 157, prediction: 'cat' },
    { height: 123, weight: 85, prediction: 'dog' },
    { height: 95, weight: 115, prediction: 'cat' }
])