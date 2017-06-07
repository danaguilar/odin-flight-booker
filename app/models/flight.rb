class Flight < ApplicationRecord
  belongs_to :to_airport, class_name: "Airport", inverse_of: :arriving_flights
  belongs_to :from_airport, class_name: "Airport", inverse_of: :departing_flights
end
