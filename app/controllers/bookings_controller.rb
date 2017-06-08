class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:new_flight])
    @booking = @flight.bookings.new
    params[:num_passengers].to_i.times do
      @booking.passengers.new
    end
  end

  def create
    render 'new'
  end
end
