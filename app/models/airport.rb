class Airport < ApplicationRecord
  has_many :arriving_flights, class_name: "Flight", inverse_of: :to_airport, foreign_key: "to_airport_id"
  has_many :departing_flights, class_name: "Flight", inverse_of: :from_airport, foreign_key: "from_airport_id"

end
