# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Airport.create([name: "New York City", code: "NYC"])
Airport.create([name: "San Fransico", code: "SFO"])

NYC = Airport.first
SFO = Airport.second

25.times do
  flight = Flight.new(duration: 4, start: Faker::Time.between(Time.now, 1.months.from_now))
  NYC.arriving_flights << flight
  SFO.departing_flights << flight
  flight.save
end

25.times do
  flight = Flight.new(duration: 4, start: Faker::Time.between(Time.now, 1.months.from_now))
  SFO.arriving_flights << flight
  NYC.departing_flights << flight
  flight.save
end
