class Flight < ApplicationRecord
  belongs_to :to_airport, class_name: "Airport", inverse_of: :arriving_flights
  belongs_to :from_airport, class_name: "Airport", inverse_of: :departing_flights
  has_many :bookings

  #Class Methods
  def self.get_all_dates
    self.find_by_sql("select distinct start from flights order by start asc")
  end

  def self.find_flights(to_airport, from_airport, start_time)
    self.where("to_airport_id = ? and from_airport_id = ? and start = ?",to_airport, from_airport, start_time)
  end

  #Instance Methods
  def date_formatted
    start.strftime("%m/%d/%Y")
  end

  def to_html
    "DEPARTING: #{from_airport.code} on #{start.to_formatted_s}. ARRIVING: #{to_airport.code}"
  end

end
