class FlightsController < ApplicationController

  def index
    @airport_options = Airport.all.map {|airport| [airport.name,airport.id] }
    @flight_dates = Flight.get_all_dates
    @passengers = Array.new
    4.times {|num| @passengers << [(num+1).to_s,(num+1)]}
    @flight = Flight.new
    if params[:flight]
      @found_flights = Flight.find_flights(params[:flight][:to_airport], params[:flight][:from_airport], params[:flight][:start])
      @num_passengers = params[:num_tickets]
    end
  end

  #private

end
